import 'dart:async';

void main(List<String> args) async {
  // * Stream Timeout Example

  final names = getNames(); // 0s 1s 10s

  try {
    await for (final name in names.withTimeoutBetweenEvents(
      const Duration(seconds: 3), // 3 seconds timeout
    )) {
      print(name);
    }
  } on TimeoutBetweenEventsException catch (e, stackTrace) {
    print('TimeoutBetweenEventsException: $e');
    print('Stack trace: $stackTrace');
  }
}

Stream<String> getNames() async* {
  yield 'John';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Jane';
  await Future.delayed(const Duration(seconds: 10));
  yield 'Doe';
}

extension WithTimeoutBetweenEvents<T> on Stream<T> {
  Stream<T> withTimeoutBetweenEvents(Duration duration) => transform(
        TimeoutBetweenEvents(
          duration: duration,
        ),
      );
}

/// events of [Stream] after [Duration] should be timed out
class TimeoutBetweenEvents<E> extends StreamTransformerBase<E, E> {
  final Duration duration;

  const TimeoutBetweenEvents({
    required this.duration,
  });

  @override
  Stream<E> bind(Stream<E> stream) {
    StreamController<E>? controller;
    StreamSubscription<E>? subscription;
    Timer? timer;

    controller = StreamController(
      onListen: () {
        subscription = stream.listen(
          (event) {
            // reset timer for every event
            timer?.cancel();
            timer = Timer.periodic(
              duration,
              (timer) {
                // When after 1 seccond, we want to see timeout exception
                controller?.addError(
                  TimeoutBetweenEventsException(
                    'Timeout',
                  ),
                );
              },
            );

            // add event to stream when timout is not happened
            controller?.add(event);
          },
          onError: controller?.addError,
          onDone: controller?.close,
        );
      },
      onCancel: () {
        subscription?.cancel();
        timer?.cancel();
      },
    );

    return controller.stream;
  }
}

class TimeoutBetweenEventsException implements Exception {
  final String message;
  TimeoutBetweenEventsException(this.message);
}
