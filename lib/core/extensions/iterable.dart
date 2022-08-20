extension CompactMap<E> on Iterable<E> {
  Iterable<T> compactMap<T>(T? Function(E element) function) sync* {
    for (final value in this) {
      final transformed = function(value);
      if (transformed != null) {
        yield transformed;
      }
    }
  }
}
