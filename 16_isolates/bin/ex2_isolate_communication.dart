import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

void main(List<String> args) async {
  // * Isolate Communication

  /* 
    Using SendPort to communucate between Isolates, each Isolates have their own
    ReceivePort

    In this example, we always create new Isolates to do the work when user 
    input a message
   */

  do {
    stdout.write('Say something: ');
    final String? input = stdin.readLineSync(encoding: utf8);
    switch (input?.trim().toLowerCase()) {
      case null:
        continue;
      case 'exit':
        exit(0); // Exit program
      default:
        final resp = await sendMessage(input!);
        print('  $resp');
    }
  } while (true);
}

Future<String> sendMessage(String input) async {
  final rp = ReceivePort(); // Receive response from communicator
  Isolate.spawn(_communicator, rp.sendPort);

  // ReceivePort to send message to communicator
  final broadcastRp = rp.asBroadcastStream();
  final SendPort communicatorSendPort = await broadcastRp.first;
  communicatorSendPort.send(input);

  return broadcastRp
      .takeWhile((element) => element is String) // take response
      .cast<String>() // as Stream<String>
      .take(1) // Stream contains only one element
      .first; // the first element
}

void _communicator(SendPort sp) async {
  // Receive user's input messages, send response back
  final rp = ReceivePort();
  sp.send(rp.sendPort);

  final messages = rp.takeWhile((element) => element is String).cast<String>();

  await for (var msg in messages) {
    // check if the message has a response
    for (var entry in messagesAndResponses.entries) {
      if (msg.trim().toLowerCase() == entry.key.trim().toLowerCase()) {
        sp.send(entry.value);
        continue;
      }
    }
    // when not repsonse for the message
    sp.send('I have no response to that!');
  }
}

const messagesAndResponses = {
  '': 'Ask me a question like "How are you?"',
  'Hello': 'Hi',
  'How are you?': 'Fine',
  'What are you doing?': 'Learning about Isolates in Dart!',
  'Are you having fun?': 'Yeah sure!',
};
