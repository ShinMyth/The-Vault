import 'package:vault/models/account_item_model.dart';
import 'package:vault/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAccountScreenController {
  final Function() setstate;
  final BuildContext context;

  AddAccountScreenController({required this.setstate, required this.context});

  final firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  List<Account> accounts = [];

  Future<void> getAccountsData() async {
    isLoading = true;

    setstate();

    accounts.clear();

    await firestore
        .collection("accounts")
        .orderBy("accountOrder", descending: false)
        .get()
        .then((value) async {
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in value.docs) {
        Account accountDoc = Account.fromFirestore(doc);

        accounts.add(accountDoc);

        await firestore
            .collection("accounts")
            .doc(accountDoc.accountID)
            .collection("accountItems")
            .orderBy("accountItemOrder", descending: false)
            .get()
            .then((value) {
          for (QueryDocumentSnapshot<Map<String, dynamic>> doc in value.docs) {
            AccountItem accountItemDoc = AccountItem.fromFirestore(doc);

            for (Account account in accounts) {
              if (account.accountID == accountDoc.accountID) {
                account.accountItems.add(accountItemDoc);
              }
            }
          }
        });
      }
    });

    isLoading = false;

    setstate();
  }
}
