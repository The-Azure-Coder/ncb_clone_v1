class Benificary {
  final String id;
  final String name;
  final String accNo;
  final String accId;

  const Benificary({
    required this.id,
    required this.name,
    required this.accNo,
    required this.accId,
  });

  factory Benificary.fromJson(Map<String, dynamic> json) {
    return Benificary(
      id: json['_id'],
      name: json['name'],
      accNo: json['accNo'],
      accId: json['AccId'],
    );
  }
}
