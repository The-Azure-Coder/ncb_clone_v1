import 'package:ncb_frontend_v1/models/transaction.dart';

class Account {
  final String id;
  final String userID;
  final String accType;
  final String accNo;
  final String currency;
  final num balance;
  List<Transaction> transactions = [];

  Account({
    required this.id,
    required this.userID,
    required this.accType,
    required this.accNo,
    required this.currency,
    required this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['_id'],
      userID: json['userID'],
      accType: json['accType'],
      accNo: json['accNo'],
      currency: json['currency'],
      balance: json['balance'],
    );
  }
}
