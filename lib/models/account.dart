class Account {
  final String id;
  final String userID;
  final String accType;
  final String accNo;
  final String currency;
  final double balance;
  final List transactions;

  Account(
      {required this.id,
      required this.userID,
      required this.accType,
      required this.accNo,
      required this.currency,
      required this.balance,
      required this.transactions});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['_id'],
      userID: json['userID'],
      accType: json['accType'],
      accNo: json['accNo'],
      currency: json['currency'],
      balance: json['balance'],
      transactions: json['transactions'],
    );
  }
}
