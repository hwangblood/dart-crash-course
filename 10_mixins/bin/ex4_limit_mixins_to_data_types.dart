void main(List<String> args) {
  // * Limiting Mixins to Data Types

  /* 
    You can alao limit mixins to specific data types 
    
    This means Mixin can depend on another Mixin or Class

    Mixins can't be instantiated.
    Mixin does not have runtimeType property, but Class have it.
  */

  final human = Human();
  human.run();
}

class HasNoFeet {}

class Has2Feet {}

mixin CanRun on Has2Feet {
  void run() => print('$runtimeType is running');
}

class Human extends Has2Feet with CanRun {}

// ! 'CanRun' can't be mixed onto 'HasNoFeet' because 'HasNoFeet' doesn't implement 'Has2Feet'.
class Fish extends HasNoFeet /* with CanRun */ {}
