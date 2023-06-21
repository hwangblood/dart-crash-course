import 'dart:async';

void main(List<String> args) async {
  // * Stream Controllers

  /* 
    StreamController is readable and writeable
    StreamController.sink is writable
    StreamController.stream is read-only
   */

  final controller = StreamController<String>();
  controller.sink.add('Hello');
  controller.sink.add('World');

  await for (final value in controller.stream) {
    print(value);
  }

  controller.close();
}
