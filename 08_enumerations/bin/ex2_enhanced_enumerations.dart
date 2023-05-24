void main(List<String> args) {
  // * Enhanced Enumerations

  /* 
    Dart's Hanced Enumerations are not same as Swift/Rust Hanced Enumerations.
    It is dynamic in Swift/Rust, but hard-coded in Dart.
    And it is very similar with `class` in Dart, also could be replaced with `class`.

    Swift enum Example:
    ```swift
    enum Car {
        case modelX(manufacturer: String, year: Int)
        case modelY(manufacturer: String, year: Int, engineCount: Int)
    }

    let modelX = Car.modelX(manufacturer: "Tesla", year: 2023)
    let modelY = Car.modelY(manufacturer: "Tesla", year: 2023, engineCount: 4)
    ```
  */

  final foo = Person(car: Car.teslaModelX, name: 'Foo');

  switch (foo.car) {
    case Car.teslaModelX:
      print('Foo has a Tesla Model X = ${foo.car}');
      break;
    case Car.teslaModelY:
      print('Foo has a Tesla Model Y = ${foo.car}');
      break;
  }
}

class Person {
  final String name;
  final Car car;

  const Person({
    required this.name,
    required this.car,
  });
}

enum Car {
  teslaModelX(manufacturer: 'Tesla', model: 'Model X', year: 2023),
  teslaModelY(manufacturer: 'Tesla', model: 'Model Y', year: 2022);

  final String manufacturer;
  final String model;
  final int year;

  const Car({
    required this.manufacturer,
    required this.model,
    required this.year,
  });

  @override
  String toString() => 'Car($manufacturer $model $year)';
}
