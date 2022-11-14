class Transaction {
  String? id;
  final String accId;
  int? openingBalance;
  String? closingBalance;
  final String type;
  final String amount;
  final String description;

  Transaction(
      {required this.id,
      required this.accId,
      required this.openingBalance,
      required this.closingBalance,
      required this.type,
      required this.amount,
      required this.description});

  Transaction.withoutInfo({
    required this.accId,
    required this.type,
    required this.amount,
    required this.description,
  });

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




//  accId: {
//         type: mongoose.Schema.Types.ObjectId,
//         required: [ true, " Account Id must be specified"]
//     },
//     openingBalance: {
//         type: Number
//     },
//     closingBalance: {
//         type: Number
//     },
//     type: {
//         type: mongoose.Schema.Types.ObjectId, 
//         required: [ true, ' Name must be specified']
//     },
//     amount: {
//         type: Number, 
//         required: [ true, " Symbol must be specified"]
//     }, 
//     description: {
//         type: String,
//         required: [ true, "Transaction description must be specified"]
//     },
//     transactionId: {
//         type: String,
//     }