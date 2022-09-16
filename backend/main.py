import torch
import torch.nn as nn
from transformers import BertTokenizer,BertModel
MAX_LENGTH=64

device=torch.device("cuda") if torch.cuda.is_available() else torch.device("cpu")

BERT_NAME='bert-base-uncased'
class SentimentClassifier(nn.Module):
  def __init__(self, n_classes,max_length, device):
    super(SentimentClassifier, self).__init__()
    self.device=device
    self.bert = BertModel.from_pretrained(BERT_NAME).to(self.device)
    self.tokenizer = BertTokenizer.from_pretrained(BERT_NAME)
    self.drop = nn.Dropout(p=0.3).to(self.device)
    self.out = nn.Linear(self.bert.config.hidden_size, n_classes).to(self.device)
    ### Optional: Freeze the BERT model
    # for param in self.bert.parameters():
    #   param.requires_grad = False
    self.max_length=max_length
  def pre_process_data(self,text):
    encoded_review = self.tokenizer.encode_plus(
      text,
      max_length=self.max_length,
      add_special_tokens=True,
      return_token_type_ids=False,
      pad_to_max_length=True,
      return_attention_mask=True,
      return_tensors='pt',
    )
    input_ids = encoded_review['input_ids'].to(self.device)
    attention_mask = encoded_review['attention_mask'].to(self.device)
    return input_ids, attention_mask
  def forward(self, input_ids, attention_mask=None):
    if attention_mask==None:
      input_ids, attention_mask=self.pre_process_data(input_ids)
    o = self.bert(
      input_ids=input_ids,
      attention_mask=attention_mask
    )
    pooled_output=o['pooler_output']
    output = self.drop(pooled_output)
    return self.out(output)

model = SentimentClassifier(2,max_length=MAX_LENGTH,device=device) # initialize your model class
model.load_state_dict(torch.load('testmodel.pt'))

sample_txt="I love Mc Donalds very much."

class_names=['negative',"positive"]
sentiment=model(sample_txt)
_, sentiment = torch.max(sentiment, dim=1)
print(class_names[sentiment])