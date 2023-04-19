void main(List<String> args) {
  // * Nullable Type Promotion

  final String? firstName = null;

  if (firstName == null) {
    print('firstName is null');
  } else {
    // in else scope, dart knowns firstName is not null, so needn't null-aware
    final int length = firstName.length;
    print('firstName length is $length');
  }
}
