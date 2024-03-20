class Personnal {
  final int id;
  final String fullName;
  final String address;
  final String phoneNumber;

  Personnal({
    required this.id,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
  });

  factory Personnal.fromMap(Map personnalMap) {
    return Personnal(
      id: personnalMap['id'],
      fullName: personnalMap['fullName'],
      address: personnalMap['address'],
      phoneNumber: personnalMap['phoneNumber'],
    );
  }
}
