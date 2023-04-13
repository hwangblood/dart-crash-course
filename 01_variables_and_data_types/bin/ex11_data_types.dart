void main(List<String> args) {
  final name = 'foo'; // String

  // ! cannot assign String to int
  // final int age = '212';

  final int count = int.parse('123');
  print('count = $count');
}
