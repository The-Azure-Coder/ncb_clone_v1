class TransactionType {
  final String id;
  final String name;

  TransactionType({required this.id, required this.name});

  factory TransactionType.withJson(Map<String, dynamic> json) {
    return TransactionType(id: json['_id'], name: json['name']);
  }
}
