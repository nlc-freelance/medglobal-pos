enum UserType { cashier, admin, supervisor }

enum ProfileMenu {
  PROFILE('Account Profile'),
  LOGOUT('Logout');

  final String title;
  const ProfileMenu(this.title);
}
