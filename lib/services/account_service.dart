import 'dart:developer';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/services/sqflite_database_service.dart';

class AccountService {
  Future<void> insertAccountItem({required AccountItem accountItem}) async {
    try {
      await db!.transaction((txn) async {
        txn.insert("accounts", accountItem.toMap());
      });
    } catch (e) {
      log("insertAccountItem: $e");
    }
  }
}
