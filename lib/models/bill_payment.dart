class bill_payment {
  final String accountId;
  final String transactionType;
  final String payee;
  final String payeeAccNum;
  final String amount;

  bill_payment({
    required this.accountId,
    required this.transactionType,
    required this.payee,
    required this.payeeAccNum,
    required this.amount,
  });

  factory bill_payment.fromJson(Map<String, dynamic> json) {
    return bill_payment(
        accountId: json['_id'],
        transactionType: json['paymentType'],
        payee: json['payee'],
        payeeAccNum: json['payeeAccNum'],
        amount: json['paymentAmount']);
  }
}
