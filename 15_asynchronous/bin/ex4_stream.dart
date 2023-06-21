Future<void> main(List<String> args) async {
  // * Stream

  /* 
    https://dart.dev/tutorials/language/streams

    ? What is Stream
    future => | ---- 1 SEC ---- X |
    stream => | ---- 1 SEC ---- X ---- 1 SEC ---- Y |

    Consuming a Stream looks like Iterable
    Iterable: for (var i in items) { }
    Stream: await for (var i in stream) { }
            await stream.forEach((value) => { })

    When using forEach without await keyword, the stream happens in background,
    similar to Future

   */

  final numStream = getNumbers(5);
  await for (var number in numStream) {
    print(number);
  }

  final plans = ['Buy a bag', 'Learn FLutter', 'Learn Golang'];
  final planStream = Stream.periodic(
    const Duration(seconds: 1),
    (index) => plans.elementAt(index),
  );
  // * consuming a Stream without await, it will be concurrency
  planStream.forEach(print);

  try {
    final nameStream = getNames();
    await nameStream.forEach(print);
  } catch (e) {
    print(e);
  }
}

/// | 0 -- 1 -- 2 -- 3 -- 4 -- 5 -- 6 -- 7 -- 8 -- 9 |
///
/// each value requires 1 sec
Stream<int> getNumbers(int count) async* {
  for (var i = 0; i < count; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

Stream<String> getNames() async* {
  await Future.delayed(Duration(seconds: 1));
  yield 'John';
  throw Exception('Something went wrong');
  // yield "Doe"; // Dead Code, cannot yield after throwing an exception
}
