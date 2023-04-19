void main(List<String> args) {
  // * Nullable Collections

  List<String>? names = null;
  names?.add('foo'); // won't be added into list
  print(names);

  List<String?>? foods = [];
  foods = [null, 'two', null, 'four'];

  foods?.add('new-food');
  foods?.add(null);
  foods?.add('last-food');
  print(foods);

  final last = foods?.last;
  print(last);

  List<String?> list = [];
  // ! Can't get a element from an empty list, it will throw an error
  // but in Rust the first element in list is must be no-null value
  final first = list.first;
  print(first);
}
