void main(List<String> args) {
  // * Simple Mixins

  /* 
    * Dart can't have multiple inheritances

    Mixins must override members that are not implemented by the parent mixins, 
    and also can override implemented members. this is similar to abstract class

    Mixins are like separate entities that can bring functionality to existing
    classes and enumerations.

    so where as your usual functions, you either crate them at top level of your
    application. Inside a class or inside an enumeration, makes things allow
    you to create functionality or functions variables, properties inside the 
    mixin and then bring the mixin into various classes or enumerations.

    in that way, you can basically have a kind of like simulated mutilple
    inheritance

    Example:

    ! this is bad way
    class ClassA {}
    class ClassB extends ClassA {}
    class ClassC extends ClassB {}

    * this is better way
    mixin MixinA {}
    mixin MixinB on MixinA {}
    mixin MixinC on MixinA {}
    class ClassC with MixinA, MixinB, MixinC {}
   */

  final person = Person();
  print(person);

  person.jump(speed: 20);
  person.walk(speed: 30);

  print('----------------------------------------');

  print('before change speed');
  print(person);
  person.speed = 100;
  print('after change speed');
  print(person);
}

mixin HasSpeed {
  abstract double speed;
}

mixin CanJump on HasSpeed {
  void jump({required double speed}) {
    this.speed = speed;
    print('$runtimeType is jumping at the speed of $speed');
  }
}
mixin CanWalk on HasSpeed {
  void walk({required double speed}) {
    this.speed = speed;
    print('$runtimeType is walking at the speed of $speed');
  }
}

/// CanJump based on HasSpeed, Canwalk based on HasSpeed, and HasSpeed is parent
/// so the class must with HasSpeed at the first of mixins
class Person with HasSpeed, CanJump, CanWalk {
  @override
  double speed = 10;

  @override
  String toString() => 'Person(speed: $speed)';
}
