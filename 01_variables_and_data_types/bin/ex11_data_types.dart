void main(List<String> args) {
  // ignore: unused_local_variable
  final name = 'foo'; // String

  // ! cannot assign String to int
  // final int age = '212';

  final int count = int.parse('123');
  print('count = $count');
}
