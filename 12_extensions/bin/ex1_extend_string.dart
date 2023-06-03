void main(List<String> args) {
  // * Extending String

  print('Hello, World!'.reversed);
}

extension on String {
  String get reversed => split('').reversed.join();
}
