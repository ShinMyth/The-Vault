import 'package:vault/models/account_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String accountID;
  String accountName;
  int accountOrder;
  List<AccountItem> accountItems;

  Account({
    required this.accountID,
    required this.accountName,
    required this.accountOrder,
    required this.accountItems,
  });

  factory Account.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final id = snapshot.id;
    final data = snapshot.data();

    return Account(
      accountID: id,
      accountName: data?['accountName'],
      accountOrder: data?['accountOrder'],
      accountItems: [],
    );
  }
}
