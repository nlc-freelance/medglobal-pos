String branchCode(String name) {
  final words = name.trim().split(' ');
  final initials = words.map((word) => word[0].toUpperCase()).join();
  return '${initials}B';
}
