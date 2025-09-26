enum UserType {
  cashier,
  admin,
  supervisor;

  static UserType fromString(String value) {
    if (value == 'admin') {
      return admin;
    } else if (value == 'supervisor') {
      return supervisor;
    } else {
      return cashier;
    }
  }
}

enum ProfileMenu {
  PROFILE('Account Profile'),
  LOGOUT('Logout');

  final String title;
  const ProfileMenu(this.title);
}
