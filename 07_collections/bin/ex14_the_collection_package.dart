import 'package:collection/collection.dart';

void main(List<String> args) {
  // * The Collection Package

  /* 
    * BoolList
    In our machine, every boolean could take 8 bits for a boolean value.
    (1 byte = 8 bits)
    such as:
    0000 0000 boolean: false
    0000 0001 boolean: true

    If we want to take 8 bits for eight boolean values.
    Each bit represents a boolean value.
    ? How can we do this
    We can use the [BoolList]
    ? When should use the [BoolList]
    when we work with hundreds of boolean values.
    
    * CanonicalizedMap
    It is up to the developer to decide whether the keys of the Map are equal or not.
    such as: if keys have same length in a Map, we say they are equal, etc...

    * CombinedIterableView
    it's an Iterable of Iterables, if the inner iterables have changed, the 
    combined iterable will reflect the changes
    ! Don't use it to contain only one iterable, use simply [Iterable] instead.
    
    * CombinedListView
    It is a list of lists, and is unmodifiable. reflect the changes from inner lists

    * CombinedMapView
    It is an iterable of maps, and is unmodifiable. reflect the changes from inner maps

    * mergeMaps()
    Merge two maps into a new map. And dicide the value when a same key exists in both maps

    ? What is the difference between mergeMaps and CombinedMapView when same keys exist in both maps?
    mergeMaps(): take latest value from both maps, and put it into result map.
    CombinedMapView: take first value from both maps, and put it into result map.
    
   */

  testBoolList();
  print('------------------');
  testCanonicalizedMap();
  print('------------------');
  testCombinedIterableView();
  print('------------------');
  testCombinedListView();
  print('------------------');
  testCombinedMapView();
  print('------------------');
  testMapMerging();
  print('------------------');
}

void testMapMerging() {
  const info1 = {'name': 'John 1', 'age': 31, 'height': 1.8};
  const info2 = {'name': 'John 2', 'age': 32, 'height': 1.9, 'weight': 80};

  final merge = mergeMaps(
    info1,
    info2,
    value: (one, two) => two,
  );

  print(merge);
}

void testCombinedMapView() {
  var map1 = {'a': 1, 'b': 2, 'c': 3};
  var map2 = {'b': 4, 'c': 5, 'd': 6};
  var map3 = {'c': 7, 'd': 8, 'e': 9};

  var combinedMap = CombinedMapView([map1, map2, map3]);
  map2.addAll({'Foo': 20});

  print(combinedMap);
  print(combinedMap['a']);
  print(combinedMap['b']);
  print(combinedMap['c']);
  print(combinedMap['d']);
  print(combinedMap['e']);
  print(combinedMap['f']);

  try {
    // ! can't mutate a CombinedMapView
    combinedMap['a'] = 10;
  } catch (e) {
    print(e);
  }
}

void testCombinedListView() {
  final swedishNames = ['Sven', 'Karl', 'Gustav'];
  final norwegianNames = ['Sven', 'Karl', 'Ole'];
  final frenchNames = ['Sven', 'Karl', 'Pierre'];
  final names = CombinedListView([swedishNames, norwegianNames, frenchNames]);

  print(names);
  frenchNames.add('Jimmy');
  print(names);

  if (names.contains('Sven')) {
    print('Sven is in the list');
  }
  try {
    // ! can't mutate a CombinedListView
    names.removeAt(0);
  } catch (e) {
    print(e);
  }
}

void testCombinedIterableView() {
  final Iterable<int> one = [1, 2, 3];
  final /* List<int> */ two = [10, 20, 30];
  final Iterable<int> three = [40, 50, 60];
  final combined = CombinedIterableView([one, two, three]);
  two.add(35);
  print(combined);
  print(combined.length); // 3 * 3 + 1
  print(combined.isEmpty);
  print(combined.contains(5));
  print(combined.contains(10));
}

void testCanonicalizedMap() {
  final info = {
    'name': 'John',
    'age': 30,
    'sex': 'male',
    'address': 'New York',
  };
  // Here, we want all the key-value pairs in the map have different length of key.
  // if keys have the same length, we consider them are equal, it should't be present repeatly in the Map.
  // final canonMap = CanonicalizedMap.from(info, (key) => key.length);
  // or, the keys whether have same first rune
  final canonMap = CanonicalizedMap.from(
    info,
    (key) =>
        // key.split('').first
        key.runes.first,
  );
  print(canonMap);
}

void testBoolList() {
  // this is a mutable list
  final boolList = BoolList(10, growable: true);
  print(boolList);
  boolList[3] = true; // change the fourth value
  if (boolList[3]) {
    print('The boolean value at index 3 is true');
  } else {
    print('The boolean value at index 3 is false');
  }
  print(boolList);
  boolList.length *= 2;
  print(boolList);
}
