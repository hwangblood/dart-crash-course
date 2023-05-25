void main(List<String> args) {
  // * Subclassing

  final v = Vehicle(4);
  print(v);
  print(v.toString());

  print(Car());
  print(Bicycle());
}

class Vehicle /* extends Object */ {
  final int wheelCount;

  Vehicle(this.wheelCount);

  @override
  String toString() {
    // if (runtimeType == Vehicle) {
    //   return 'Vehicle with $wheelCount wheels';
    // } else {
    //   return super.toString();
    // }
    return '$runtimeType with $wheelCount whells';
  }
}

class Car extends Vehicle {
  Car() : super(4);
}

class Bicycle extends Vehicle {
  Bicycle() : super(2);
}
