void main(List<String> args) {
  // ignore: unused_local_variable
  final double hisHeight = 150.55;

  // ! less precise type cannot be assigned a more precise type
  // final int myHeight = 170.5;
  final int myHeight = 170;

  // * double has more presice than int
  // ignore: unused_local_variable
  final herHeight = myHeight;
}
