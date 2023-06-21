import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  // * Stream Transformers

  final filePath = '15_asynchronous/bin/ex10_stream_transformers.dart';
  final comments = readComments(filePath);
  await comments.forEach(print);
  print("---------------------------");

  await for (final capitalizedName in names.capitalizedUsingMap) {
    print(capitalizedName);
  }
  print("---------------------------");

  await for (final capitalizedName in names.capitalized) {
    print(capitalizedName);
  }
}

/// read comments of this file, with trimming
///
/// https://dart.dev/tutorials/language/streams#reading-decoding-file
Stream<String> readComments(String filePath) async* {
  var file = File(filePath);
  var lines = utf8.decoder
      // decode content of file as utf8
      .bind(file.openRead())
      // split content by lines
      .transform(const LineSplitter());

  await for (final line in lines) {
    if (line.trim().startsWith('//')) {
      yield line.trim();
    }
  }
}

Stream<String> names = Stream.fromIterable(
  [
    'Seth',
    'Kathy',
    'Lars',
  ],
);

extension on Stream<String> {
  /// convert strings to upper case with built-in functions (map, toUpperCase)
  Stream<String> get capitalizedUsingMap => map(
        (name) => name.toUpperCase(),
      );

  /// convert strings to upper case with custom StreamTransformer
  Stream<String> get capitalized => transform(
        ToUpperCase(),
      );
}

/// Custom [StreamTransformer] StreamTransformerBase<IN, OUT>
class ToUpperCase extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map(
      (name) => name.toUpperCase(),
    );
  }
}
