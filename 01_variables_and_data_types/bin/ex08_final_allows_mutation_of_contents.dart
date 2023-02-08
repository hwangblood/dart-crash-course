void main(List<String> args) {
  final yourList = [1, 2, 3];

  // ! Cannot assign a value to final variable again, after assigned
  // yourList = [4, 5];

  // * can mutate contents of final variable
  yourList.add(4);
  print(yourList);
}
