import 'dart:mirrors';

void main(List<String> args) {
  // * Mixins and Refletion

  /*
    Reflections works using dart:mirrors package in Dart. They are the key to
    reflection in Dart is usually using a function called reflect.

    This reflect function will basically give you an object of type instance 
    mirror, and using this instance mirror then you can get the name of the type
    , which you are reflecting upon. and you can also get the types 
    declarations, and this declarations will give you the variables or functions
    that are available on the type

    https://api.dart.dev/stable/dart-mirrors/dart-mirrors-library.html
   */

  final person = Person(firstName: 'foo', lastName: 'bar');
  print(person.toString());

  final myHouse = House(address: 'Chengdu', roomCount: 2);
  print(myHouse);
}

class Person with HasDescription {
  final String firstName;
  final String lastName;

  Person({
    required this.firstName,
    required this.lastName,
  });
}

class House with HasDescription {
  final String address;
  final int roomCount;

  House({
    required this.address,
    required this.roomCount,
  });
}

mixin HasDescription {
  @override
  String toString() {
    final reflection = reflect(this);

    final thisType = MirrorSystem.getName(
      reflection.type.simpleName,
    );

    final variables =
        reflection.type.declarations.values.whereType<VariableMirror>();

    final properties = <String, dynamic>{
      for (final field in variables)
        field.asKey: reflection.getField(field.simpleName).reflectee,
    }.toString();

    return '$thisType = $properties';
  }
}

extension AsKey on VariableMirror {
  String get asKey {
    final filedName = MirrorSystem.getName(simpleName);
    final filedType = MirrorSystem.getName(type.simpleName);

    return '$filedType $filedName';
  }
}
