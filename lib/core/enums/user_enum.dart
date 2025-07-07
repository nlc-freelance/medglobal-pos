enum UserType { CASHIER, ADMIN, STORE_MANAGER }

enum ProfileMenu {
  PROFILE('Account Profile'),
  LOGOUT('Logout');

  final String title;
  const ProfileMenu(this.title);
}
