void main(List<String> args) {
  final int someInteger = 10;
  print(someInteger);

  final double someDouble = 10.5;
  print(someDouble);

  final String someString = 'Hello';
  print(someString);

  final bool someBoolean = true;
  print(someBoolean);

  final List<int> someList = [1, 3, 5, 7, 9, 11];
  print(someList);

  final Map<String, String> someMap = {'foo': 'bar'};
  print(someMap['foo']);

  final Set<int> someSet = {1, 2, 3, 1};
  print(someSet);

  final dynamic someDynamic = null;
  print(someDynamic);

  final Symbol someSymbol = #someNull;
  print(someSymbol);
}
