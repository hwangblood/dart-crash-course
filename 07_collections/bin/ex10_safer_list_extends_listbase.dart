import 'dart:collection';

void main(List<String> args) {
  // * Extending ListBase to Create a Safer List

  /* 
    The default implementation of List is not safe.
   */

  final List<String> names = [];
  // ! if you have an empty list, and you access `first` or use index to get the element, then your program will get crashed.
  try {
    print(names.first);
    print(names[1]);
  } catch (e) {
    print(e);
  }

  // List<String?> is required for this case
  final List<String?> values = ['Foo', 'Bar'];
  values.length = 3;
  print(values);

  /* 
    It's time to try safer list
   */

  const notFound = 'NOT_FOUND';
  const defaultString = 'DEFAULT_VALUE';

  final myList = SafeList(
    absentValue: notFound,
    defaultValue: defaultString,
    values: ['Bar', 'Baz'],
  );

  print(myList[0]);
  print(myList[1]);
  print(myList[2]);

  myList.length = 4;
  print(myList[2]);
  print(myList[3]);

  myList.length = 1;
  print(myList.first);
  print(myList.last);

  myList.length = 2;
  print(myList.first);
  print(myList.last);

  myList.length = 0;
  print(myList.first);
  print(myList.last);
}

class SafeList<T> extends ListBase<T> {
  final List<T> _list;

  final T absentValue;
  final T defaultValue;

  SafeList({
    required this.defaultValue,
    required this.absentValue,
    List<T>? values,
  }) : _list = values ?? [];

  @override
  T operator [](int index) =>
      index < _list.length ? _list[index] : this.absentValue;

  @override
  void operator []=(int index, T value) => _list[index] = value;

  @override
  int get length => _list.length;

  @override
  set length(int newLength) {
    if (newLength <= _list.length) {
      _list.length = newLength;
    } else {
      _list.addAll(
        List.filled(newLength - _list.length, defaultValue),
      );
    }
  }

  @override
  T get first => _list.isNotEmpty ? _list.first : absentValue;

  @override
  T get last => _list.isNotEmpty ? _list.last : absentValue;
}
