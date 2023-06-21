import 'dart:async';

void main(List<String> args) async {
  // * Absorbing Stream Errors

  await for (final name in getNames().absorbErrorsUsingHandleError()) {
    print(name);
  }
  print("---------------------------");

  await for (final name in getNames().absorbErrorsUsingHandlers()) {
    print(name);
  }
  print("---------------------------");

  await for (final name in getNames().absorbErrorsUsingTransformer()) {
    print(name);
  }
}

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> absorbErrorsUsingHandleError() => handleError(
        (_, __) {}, // ignore the error
      );

  Stream<T> absorbErrorsUsingHandlers() =>
      transform(StreamTransformer.fromHandlers(
        // handleData: (data, sink) => throw UnimplementedError(),
        // ignore the error, and close the sink, stram is done
        handleError: (_, __, sink) => sink.close(),
        // handleDone: (sink) => throw UnimplementedError(),
      ));

  Stream<T> absorbErrorsUsingTransformer() => transform(
        StreamErrorAbsorber(),
      );
}

Stream<String> getNames() async* {
  yield 'John';
  yield 'Jane';
  throw 'All out of names';
  // yield 'Doe'; // ! Dead code, can't yield after throwing an error
}

class StreamErrorAbsorber<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    final controller = StreamController<T>();

    stream.listen(
      controller.sink.add, // add received value to a new stream
      onError: (_) {}, // ignore the error
      onDone: controller.close,
    );

    return controller.stream;
  }
}
