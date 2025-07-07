enum ToastType {
  ERROR('Oops! Something went wrong'),
  SUCCESS('Success!'),
  INVALID('Missing required fields'),
  DUPLICATE('Duplicate item');

  final String title;
  const ToastType(this.title);
}
