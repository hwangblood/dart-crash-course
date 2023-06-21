void main(List<String> args) {
  // * Constrained Generic Type Definitions

  const momAndDad = {
    'mom': Person(),
    'dad': Person(),
  };
  const brotherAndSisterAndMyFish = {
    'Brother': Person(),
    'Sister': Person(),
    'Fishy': Fish(),
  };

  final allValues = [momAndDad, brotherAndSisterAndMyFish];
  describe(allValues);
}

void describe(Iterable<BreathingThings> values) {
  for (final map in values) {
    for (final keyAndValue in map.entries) {
      print('Will call breathe() on ${keyAndValue.key}');
      keyAndValue.value.breathe();
    }
  }
}

typedef BreathingThings<T extends CanBreathe> = Map<String, T>;
// typedef BreathingThings = Map<String, CanBreathe>;

mixin CanBreathe {
  void breathe();
}

class Person with CanBreathe {
  const Person();
  @override
  void breathe() {
    print('Person is breathing...');
  }
}

class Fish with CanBreathe {
  const Fish();
  @override
  void breathe() {
    print('Fish is breathing...');
  }
}
