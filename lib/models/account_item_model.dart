import 'package:cloud_firestore/cloud_firestore.dart';

class AccountItem {
  String accountItemID;
  String accountItemImage;
  String accountItemName;
  int accountItemOrder;
  String accountItemUsername;
  String accountItemPassword;

  AccountItem({
    required this.accountItemID,
    required this.accountItemImage,
    required this.accountItemName,
    required this.accountItemOrder,
    required this.accountItemUsername,
    required this.accountItemPassword,
  });

  factory AccountItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final id = snapshot.id;
    final data = snapshot.data();

    return AccountItem(
      accountItemID: id,
      accountItemImage: data?['accountItemImage'],
      accountItemName: data?['accountItemName'],
      accountItemOrder: data?['accountItemOrder'],
      accountItemUsername: "",
      accountItemPassword: "",
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountItemID': accountItemID,
      'accountItemImage': accountItemImage,
      'accountItemName': accountItemName,
      'accountItemUsername': accountItemUsername,
      'accountItemPassword': accountItemPassword,
    };
  }
}
