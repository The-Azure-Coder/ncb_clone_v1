class Transaction {
  final String id;
  final String accId;
  final num openingBalance;
  final num closingBalance;
  final String type;
  final num amount;
  final String description;

  Transaction(
      {required this.id,
      required this.accId,
      required this.openingBalance,
      required this.closingBalance,
      required this.type,
      required this.amount,
      required this.description});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['transactionId'],
      accId: json['accId'],
      openingBalance: json['openingBalance'],
      closingBalance: json['closingBalance'],
      type: json['type'],
      amount: json['amount'],
      description: json['description'],
    );
  }
}
