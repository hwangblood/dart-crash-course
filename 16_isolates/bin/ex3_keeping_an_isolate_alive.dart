import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

Future<void> main(List<String> args) async {
  // * Keeping an Isolate Alive

  /* 
    Hold ReceivePort, SendPort or its Stream into an Object, and create Isolate 
    when instantiating the object

    After that, the Isolate will be alive along with the object
   */

  final Responder responder = await Responder.create();

  do {
    stdout.write('Enter something: ');
    final String? input = stdin.readLineSync(encoding: utf8);
    print('input: ${input?.trim().toLowerCase()}');

    switch (input?.trim().toLowerCase()) {
      case null:
        continue;
      case 'exit':
        exit(0);
      default:
        final resp = await responder.sendMessage(input!);
        print('  $resp');
    }
  } while (true);
}

class Responder {
  final ReceivePort rp;
  final Stream<dynamic> broadcastRp;
  final SendPort communicatorSendPort;

  Responder({
    required this.rp,
    required this.broadcastRp,
    required this.communicatorSendPort,
  });

  static Future<Responder> create() async {
    final rp = ReceivePort();
    Isolate.spawn(
      _communicator,
      rp.sendPort,
    );

    final broadcastRp = rp.asBroadcastStream();
    final SendPort communicatorSendPort = await broadcastRp.first;

    return Responder(
      rp: rp,
      broadcastRp: broadcastRp,
      communicatorSendPort: communicatorSendPort,
    );
  }

  Future<String> sendMessage(String message) async {
    communicatorSendPort.send(message);

    // retrieve the the only one response
    return broadcastRp
        .takeWhile((element) => element is String)
        .cast<String>()
        .take(1)
        .first;
  }
}

Future<void> _communicator(SendPort sp) async {
  final rp = ReceivePort();
  sp.send(rp.sendPort);

  final messages = rp.takeWhile((element) => element is String).cast<String>();

  await for (var msg in messages) {
    for (var entry in messagesAndResponses.entries) {
      if (msg.trim().toLowerCase() == entry.key.trim().toLowerCase()) {
        sp.send(entry.value);
        continue;
      }
    }
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
