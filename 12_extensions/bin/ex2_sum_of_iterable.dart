void main(List<String> args) {
  // * Sum of Iterable

  final sum1 = [1, 2, 3].sum;
  print(sum1);
  print(sum1.runtimeType);

  print('--------------------');

  final sum2 = [1, 2.2, 3.5].sum;
  print(sum2);
  print(sum2.runtimeType);
}

extension _SumOfIterable<T extends num> on Iterable<T> {
  T get sum => reduce(
        (a, b) => a + b as T,
      );
}
