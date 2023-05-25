void main(List<String> args) {
  // * Factory Constructors

  /* 
    Factory Constructors can create instance of the class.
    Even instance of subclasses.
   */

  print(Vehicle.teslaX());
  print('---------------------');

  print(Vehicle.bicycle(name: 'MyBicycle'));
  print('---------------------');

  print(Vehicle.car(name: 'Tesla'));
  print('---------------------');

  final truck = Vehicle.truck(name: '一汽', wheelCount: 8);
  print(truck);
  print('Is it a Vehicle? ${truck is Truck}');
  print('Is it a Truck? ${truck is Truck}');
  print('---------------------');
}

class Vehicle {
  final String name;
  final int wheelCount;

  const Vehicle({
    required this.name,
    required this.wheelCount,
  });

  factory Vehicle.teslaX() => Vehicle(name: 'TeslaX', wheelCount: 4);

  factory Vehicle.car({
    required String name,
    int? wheelCount,
  }) =>
      Car(
        name: name,
        wheelCount: wheelCount,
      );

  factory Vehicle.truck({
    required String name,
    int? wheelCount,
  }) =>
      Truck(
        name: name,
        wheelCount: wheelCount,
      );

  factory Vehicle.bicycle({
    required String name,
    int? wheelCount,
  }) =>
      Bicycle(
        name: name,
        wheelCount: wheelCount,
      );

  @override
  String toString() => '$runtimeType $name with $wheelCount wheels';
}

class Car extends Vehicle {
  const Car({
    required String name,
    int? wheelCount,
  }) : super(
          name: name,
          wheelCount: wheelCount ?? 4,
        );
}

class Truck extends Vehicle {
  const Truck({
    required String name,
    int? wheelCount,
  }) : super(
          name: name,
          wheelCount: wheelCount ?? 4,
        );
}

class Bicycle extends Vehicle {
  const Bicycle({
    required String name,
    int? wheelCount,
  }) : super(
          name: name,
          wheelCount: wheelCount ?? 2,
        );
}
