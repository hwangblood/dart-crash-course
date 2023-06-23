import 'dart:isolate';

void main(List<String> args) {
  // * Simple Isolate

  getMessages().forEach((element) {
    print(element);
  });

  getMessagesEasily().forEach((element) {
    print("Easier: $element");
  });
}

Stream<String> getMessages() {
  final rp = ReceivePort(); // also Stream type

  return Isolate.spawn(_getMessages, rp.sendPort)
      .asStream() // only one Isolate in the stream
      .asyncExpand((event) => rp) // ReceivePort to the only Isolate
      .takeWhile((element) => element is String)
      .cast /* <String> */ ();
}

/// Easier to understand than [getMessages] function
Stream<String> getMessagesEasily() async* {
  final rp = ReceivePort(); // also Stream type

  await Isolate.spawn(_getMessages, rp.sendPort);

  yield* rp.takeWhile((element) => element is String).cast<String>();
}

void _getMessages(SendPort sp) async {
  await Stream.periodic(
    const Duration(milliseconds: 200),
    (_) => DateTime.now().toIso8601String(),
  ).forEach(
    // send every events back to the its ReceivePort
    sp.send,
  );
}
