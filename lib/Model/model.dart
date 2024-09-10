class User {
  final String name;
  final String profileurl;
  String paymentMethod;
  double paymentAmount;
  bool isUpdated;

  User({
    required this.name,
    required this.profileurl,
    this.paymentMethod = 'cash',
    this.paymentAmount = 2500,
    this.isUpdated = false,
  });
}
