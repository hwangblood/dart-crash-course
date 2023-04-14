void main(List<String> args) {
  /// * 4 types of operators:
  /// * unary prefix, unary postfix, binary infix, compound assignment

  int age = 30;
  print(--age); // it will change it value of variable, and return it
  print(++age);

  print(!true);
  print(!false);

  /// * unary bit-wise negate operator
  /// (0000 0000) (0000 0000) (0000 0000) (0000 0001)
  /// (1111 1111) (1111 1111) (1111 1111) (1111 1110)
  print(~1); // -1 -1 = -2

  /// * negative value operator, return a new value, won't change the variable
  print(-age);
  print(-(-age));
}
