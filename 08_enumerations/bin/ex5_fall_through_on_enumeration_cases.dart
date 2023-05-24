void main(List<String> args) {
  // * Falling Through on Enumeration Cases

  /* 
    Falling Through also happens (also in Swift, Java etc)
    ```swift
    enum AnimalType {
      case rabbit, dog, cat
    }

    let animal = AnimalType.rabbit

    switch (animal) {
      case .rabbit:
        print("Rabbit")
        fallthrough
      case .dog:
        print("Rabbit or Dog")
      case .cat:
        print("Cat")
      default:
        print("Unknown Animal")
    }
    ```
    Output:
    Rabbit
    Rabbit or Dog
   */

  final vehicle = VehicleType.motorcycle;

  switch (vehicle) {
    case VehicleType.motorcycle:
    case VehicleType.bicycle:
    case VehicleType.car:
      print('Most common personal vehicles');
      break;
    case VehicleType.truck:
      print('Usually used for work');
      break;
    default:
      // in this example, default will never be executed
      print('Unknown vehicle');
  }
}

enum VehicleType {
  car,
  truck,
  motorcycle,
  bicycle,
}
