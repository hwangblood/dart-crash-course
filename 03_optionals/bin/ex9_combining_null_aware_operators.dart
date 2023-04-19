void main(List<String> args) {
  // * Combining Null-Aware Operators
  // * ? ??

  String? lastName;

  void changeLastName() {
    lastName = 'Bar';
  }

  changeLastName();

  // * when lastName?.contains('Bar') is null, set condition to be false
  // * this way is better, it's a lot more explicit
  if (lastName?.contains('Bar') ?? false) {
    print('Last name contains Bar');
  }

  if (lastName?.contains('Bar') == true) {
    print('Last name contains Bar');
  }
}
