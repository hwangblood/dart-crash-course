import 'dart:isolate';

int calculate() {
  return 6 * 7;
}

void main(List<String> args, SendPort sp) {
  sp.send('Welcome to Isolates!');
}
