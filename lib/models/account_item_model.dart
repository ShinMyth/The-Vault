import 'package:cloud_firestore/cloud_firestore.dart';

class AccountItem {
  int id;
  String accountItemID;
  String accountItemImage;
  String accountItemName;
  String accountItemUsername;
  String accountItemPassword;

  AccountItem({
    required this.id,
    required this.accountItemID,
    required this.accountItemImage,
    required this.accountItemName,
    required this.accountItemUsername,
    required this.accountItemPassword,
  });

  factory AccountItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final id = snapshot.id;
    final data = snapshot.data();

    return AccountItem(
      id: 0,
      accountItemID: id,
      accountItemImage: data?['accountItemImage'],
      accountItemName: data?['accountItemName'],
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

  factory AccountItem.fromMap(Map<String, dynamic> map) {
    return AccountItem(
      id: map['id'] as int,
      accountItemID: map['accountItemID'] as String,
      accountItemImage: map['accountItemImage'] as String,
      accountItemName: map['accountItemName'] as String,
      accountItemUsername: map['accountItemUsername'] as String,
      accountItemPassword: map['accountItemPassword'] as String,
    );
  }
}
