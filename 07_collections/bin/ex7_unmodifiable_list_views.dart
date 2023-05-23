import 'package:collection/collection.dart';

void main(List<String> args) {
  // * Unmodifiable List Views

  // List is read-write
  final names = ["Paul", "George", "Ringo", "Ringo"];
  names.add('John');

  final readOnlyNames = UnmodifiableListView(names);
  try {
    readOnlyNames.add('Jill');
  } catch (e) {
    print(e);
  }
}
