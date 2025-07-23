enum SnackbarType {
  ERROR('Something went wrong'),
  SUCCESS('Success!'),
  INVALID('Missing required fields'),
  DUPLICATE('Duplicate item');

  final String title;
  const SnackbarType(this.title);
}
