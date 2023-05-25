void main(List<String> args) {
  // * Methods

  final car = Car();
  car.drive(speed: 20);
  print('Speed is ${car.speed}');

  car.drive(speed: 40);
  car.stop();
  print('Speed is ${car.speed}');
}

class Car {
  int speed = 0;

  void drive({
    required int speed,
  }) {
    this.speed = speed;
    print('Accelerating to $speed km/h');
  }

  void stop() {
    print('Stopping...');
    speed = 0;
    print('Stopped');
  }
}
