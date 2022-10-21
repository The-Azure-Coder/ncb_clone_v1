class Account {
  final String UserID;
  final String accType;
  final int accNo;
  final int currency;
  final int balance;
  final int transaction;

  const Account(
      {required this.UserID,
      required this.accType,
      required this.accNo,
      required this.currency,
      required this.balance,
      required this.transaction});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      UserID: json['UserID'],
      accNo: json['accNo'],
      currency: json['currency'],
      accType: json['accType'],
      balance: json['balance'],
      transaction: json['transaction'],
    );
  }
}
