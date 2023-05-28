void main(List<String> args) {
  // * Abstract Classes

  /* 
    we usually say classes are blueprints, and abstract classes are blueprints
    of the blueprints
   */

  /* 
    ? extends VS implements

    exented class can have at most one.
    implemented classes can have one or more.

    When using extends, subclass must override members that are not implemented 
    by the parent class, and also can override implemented members.

    if using implements, subclass must override all members of parent class.
   */

  final car = Car(name: 'Tesla');
  print(car);
  car.accelerate();

  final motorcycle = MotorCycle(name: '川崎', speed: 360.0);
  print(motorcycle);
  motorcycle.accelerate();

  motorcycle.name = '铃木';
  motorcycle.speed = 370.0;
  print(motorcycle);
  motorcycle.dofromNewClass();
}

class Car extends Vehicle {
  Car({
    required String name,
  }) : super(
          name: name,
          kind: VehicleKind.car,
        );

  @override
  void doSomething() => print('Car $name is doing something');

  @override
  String toString() => 'Car(name: $name, speed: $speed)';

  @override
  double speed = 400;
}

class MotorCycle implements Vehicle, NewClass {
  String _name;

  final VehicleKind _kind = VehicleKind.motorcycle;

  MotorCycle({required String name, required this.speed}) : _name = name;

  @override
  VehicleKind get kind => _kind;

  @override
  String get name => _name;

  @override
  set name(String newName) {
    _name = newName;
  }

  @override
  double speed;

  @override
  void accelerate() => print('MotorCycle $name is accelerating');

  @override
  void decelerate() => print('MotorCycle $name is decelerating');

  @override
  void dofromNewClass() => print('MotorCycle $name is doing from NewClass');

  @override
  void doSomething() => print('MotorCycle $name is doing something');

  @override
  String toString() => 'MotorCycle(name: $name, speed: $speed)';
}

abstract class NewClass {
  void dofromNewClass();
}

abstract class Vehicle {
  String name;
  final VehicleKind kind;
  abstract double speed;

  Vehicle({
    required this.name,
    required this.kind,
  });

  void accelerate() => print('$kind is accelerating');

  void decelerate() => print('$kind is decelerating');

  void doSomething();
}

enum VehicleKind {
  car,
  truck,
  motorcycle,
  bicycle,
}
