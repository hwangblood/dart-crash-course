Future<void> main(List<String> args) async {
  // * Future

  /* 
    https://dart.dev/codelabs/async-await
   */

  //  * Synchronous code
  final name1 = getName(); // execution will stop util getName returns
  final name2 = 'Foo Bar 2';
  print(name1);
  print(name2);

  // * Asynchronous code
  // * using await keyword to wait the result of a Future
  // * requires async keyword for the caller function
  print(await getUserName());
  print(await getAddress());
  print(await getPhoneNumber()); // 1s
  print(await getCity()); // 1s
  print(await getCountry());
  print(await getZipCode()); // 1s
}

String getName() => 'Foo Bar';

Future<String> getUserName() async => 'John Doe';
Future<String> getAddress() => Future.value('123 Main St');

Future<String> getPhoneNumber() => Future.delayed(
      const Duration(seconds: 1),
      () => '555-555-5555',
    );

Future<String> getCity() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'New York';
}

// with async keyword, we can return the raw value immediately of the Future
Future<String> getCountry() async => 'India';

// async keyword doesn't really contribute with anything here
Future<String> getZipCode() /* async */ => Future.delayed(
      const Duration(seconds: 1),
      () => '12345',
    );
