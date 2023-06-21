void main(List<String> args) {
  // * Generic Classes with Generic Extensions

  const tuple = Tuple(1, 20.2);
  print(tuple);
  final swapped = tuple.swap();
  print(swapped);

  print(tuple.sum);
  print(swapped.sum);

  const tuple2 = Tuple(1, '123');
  print(tuple2.swap());
  // ! don't have sum getter for non-num Tuple
  // print(tuple2.sum);
}

class Tuple<L, R> {
  final L left;
  final R right;

  const Tuple(this.left, this.right);

  @override
  String toString() => 'Tuple(l: $left, r: $right)';
}

/// change two values in the tuple
extension<L, R> on Tuple<L, R> {
  Tuple<R, L> swap() => Tuple(right, left);
}

/// get sum of two values in the tuple, when they are both [num] type
extension<L extends num, R extends num> on Tuple<L, R> {
  num get sum => left + right;
}
