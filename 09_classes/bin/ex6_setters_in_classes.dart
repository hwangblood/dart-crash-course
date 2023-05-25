void main(List<String> args) {
  // * Setters in Classes

  final car = Car();
  car.drive(speed: 10);

  try {
    car.drive(speed: -1);
  } catch (e) {
    print(e);
  }
}

class Car {
  int _speed = 0;

  int get speed => _speed;

  set speed(int newSpeed) {
    if (newSpeed < 0) {
      throw Exception('Speed cannot be negative');
    } else {
      _speed = newSpeed;
    }
  }

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
