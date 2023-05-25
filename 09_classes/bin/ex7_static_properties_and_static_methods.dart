void main(List<String> args) {
  // * Static Properties and Static Methods

  /* 
    Both of them can be considered as static members
   */

  print(Car.carsInstantiated);

  Car(name: 'My Car');
  print(Car.carsInstantiated);

  Car(name: 'Your Car');
  print(Car.carsInstantiated);

  // ! Instance can access static members in Dart
  // final car = Car(name: 'new car');
  // print(car.carsInstantiated);
}

class Car {
  static int _carInstantiated = 0;

  static int get carsInstantiated => _carInstantiated;

  final String name;

  Car({
    required this.name,
  }) {
    _incrementCarsInstantiated();
  }

  static void _incrementCarsInstantiated() => _carInstantiated++;
}
