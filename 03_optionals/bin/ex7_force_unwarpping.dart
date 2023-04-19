void main(List<String> args) {
  // * Force Unwarpping
  // Force a nullable value to be unwarpped
  // but this is unsafe and cause your app to crash

  String? firstName;

  try {
    // ! Null check operator used on a null value
    // ! You should never write code like this, it's dangerous
    print(firstName!); // force get a no-null value
  } catch (e) {
    print(e);
  }

  // this way is ok
  print(firstName ?? 'no firstName');
}
