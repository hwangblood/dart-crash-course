import 'package:collection/collection.dart';

void main(List<String> args) {
  // * Sets

  /* 
    Set is a collection that contains unique values. it doesn't contain duplicates
  */

  final /* Set<String> */ names = {'Foo', 'Bar', 'Baz', 'Qux'};
  names.add('Foo'); // add a duplicate value
  print(names);
  print('---------------------');

  // * Create a Set from List using spread operator
  final names2 = ['Foo', 'Bar', 'Baz', 'Foo'];
  final uniqueNames = {...names2};
  print(names2);
  print(uniqueNames);
  print('---------------------');

  final foo1 = 'Foo';
  var foo2 = 'Foo';
  print(foo1.hashCode);
  print(foo2.hashCode);
  print('---------------------');

  if (names.contains('Foo')) {
    print('Found Foo');
  } else {
    print('Did not find Foo');
  }
  print('---------------------');

  final ages1 = {20, 30, 40};
  final ages2 = {20, 30, 40};
  if (ages1 == ages2) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }
  print('---------------------');

  if (SetEquality().equals(ages1, ages2)) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }
  print('---------------------');

  // * set equality is irrespective of the position of the elements
  final ages3 = {40, 30, 20};
  final ages4 = {20, 30, 40};
  if (SetEquality().equals(ages3, ages4)) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }
  print('---------------------');
}
