import 'dart:isolate';

Future<void> main(List<String> args) async {
  // * Spawning Isolates using Uri

  // the package of this uri must have a 'main' function defined
  final uri = Uri.parse('package:isolates/isolates.dart');

  final rp = ReceivePort();
  Isolate.spawnUri(uri, [], rp.sendPort);

  final firstMessage = await rp.first;
  print(firstMessage);
}
