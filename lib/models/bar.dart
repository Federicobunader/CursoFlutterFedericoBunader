class Bar {
  final String name;
  final String street;
  final int number;
  final String neighborhood;
  final String phone;
  final String email;
  final String website;
  final String facebook;
  final String twitter;
  final String instagram;

  Bar({
    required this.name,
    required this.street,
    required this.number,
    required this.neighborhood,
    this.phone = '',
    this.email = '',
    this.website = '',
    this.facebook = '',
    this.twitter = '',
    this.instagram = '',
  });
}