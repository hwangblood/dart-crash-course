void main(List<String> args) {
  // * Implementing Comparable on Enumerations

  print('Before sorting: ');
  print(TeslaCars.values);

  print('After sorting: ');
  print([...TeslaCars.values]..sort());

  print(TeslaCars.model3.compareTo(TeslaCars.modelS)); // => -1
  print(TeslaCars.modelX.compareTo(TeslaCars.modelX)); // => 0
  print(TeslaCars.modelS.compareTo(TeslaCars.modelY)); // => 1
}

enum TeslaCars implements Comparable<TeslaCars> {
  modelY(weightInKg: 200.1),
  modelS(weightInKg: 320.2),
  model3(weightInKg: 300.3),
  modelX(weightInKg: 210.4);

  final double weightInKg;

  const TeslaCars({required this.weightInKg});

  /// Based on `weightInKg` comparison, larger returns 1, smaller returns -1, and equal returns 0
  ///
  /// Examples:
  /// ```dart
  /// print(TeslaCars.model3.compareTo(TeslaCars.modelS)); // => -1
  /// print(TeslaCars.modelX.compareTo(TeslaCars.modelX)); // => 0
  /// print(TeslaCars.modelS.compareTo(TeslaCars.modelY)); // => 1
  /// ```
  @override
  int compareTo(TeslaCars other) => weightInKg.compareTo(other.weightInKg);
}
