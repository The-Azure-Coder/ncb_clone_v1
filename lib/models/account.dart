import 'package:ncb_frontend_v1/models/transaction.dart';

class Account {
  final String? id;
  final String? userID;
  // final String accType;
  final AccountType? accType;
  final String accNo;
  final AccountCurrency? currency;
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
    // var list = json['accType'] as List;
    // print(list);
    // List accountType = list.map((i) => AccountType.fromJson(i)).toList();
    return Account(
      id: json['_id'],
      userID: json['userID'],
      // accType: json['accType'],
      accType: _toObject(json['accType'], (e) => AccountType.fromJson(e)),
      accNo: json['accNo'],
      currency: _toObject(json['currency'], (e) => AccountCurrency.fromJson(e)),
      balance: json['balance'],
    );
  }
}

class AccountList {
  final List<Account> accounts;

  AccountList({
    required this.accounts,
  });

  factory AccountList.fromJson(List<dynamic> json) {
    List<Account> accounts = <Account>[];
    accounts = json.map((e) => Account.fromJson(e)).toList();
    return AccountList(accounts: accounts);
  }
}

class AccountType {
  final String id;
  final String? name;

  AccountType({
    required this.id,
    required this.name,
  });

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return AccountType(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class AccountCurrency {
  final String id;
  final String name;
  final String symbol;

  AccountCurrency({
    required this.id,
    required this.name,
    required this.symbol,
  });

  factory AccountCurrency.fromJson(Map<String, dynamic> json) {
    return AccountCurrency(
      id: json['_id'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }
}

T? _toObject<T>(AccountInfo, T Function(Map<String, dynamic>) fromJson) {
  if (AccountInfo == null) {
    return null;
  }
  return fromJson(AccountInfo as Map<String, dynamic>);
}
