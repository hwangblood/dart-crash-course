void main(List<String> args) {
  const thisList = [1, 2, 3];
  final thatList = thisList;
  print(thisList);
  print(thatList);

  // ! fianl allows to mutate content, it's not const
  // const someList = thatList;
}