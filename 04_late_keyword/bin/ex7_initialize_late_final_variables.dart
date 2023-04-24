void main(List<String> args) {
  // * Initialzing Late Final Variables

  late final bool isTeenager;
  const age = 12;

  // here, isTeenager may not be initialized, because there is no else scope
  if (age >= 13 && age <= 19) {
    isTeenager = true;
  } else if (age < 13) {
    isTeenager = false;
  }
  // * if have this else scope, dart static analyzer tool knowns the vaiable
  // * hasn be initialized firstly
  //  else {
  //   isTeenager = false;
  // }

  // ! late final variable can only be initialized once and not more.
  try {
    isTeenager = false;
    print('isTeenager = $isTeenager');
  } catch (e) {
    print(e);
  }
}
