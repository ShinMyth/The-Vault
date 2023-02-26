import 'dart:developer';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/services/sqflite_database_service.dart';

List<AccountItem> accounts = [];

class AccountService {
  Future<void> insertAccountItem({required AccountItem accountItem}) async {
    try {
      await db!.transaction((txn) async {
        txn.insert(
          "accounts",
          accountItem.toMap(),
        );
      });
    } catch (e) {
      log("insertAccountItem: $e");
    }
  }

  Future<void> queryAccountItem() async {
    try {
      List<Map<String, Object?>> result = await db!.query("accounts");

      accounts.clear();

      for (Map<String, Object?> map in result) {
        AccountItem accountItem = AccountItem.fromMap(map);

        accounts.add(accountItem);
      }
    } catch (e) {
      log("queryAccountItem: $e");
    }
  }

  Future<void> updateAccountItem({required AccountItem accountItem}) async {
    try {
      await db!.transaction((txn) async {
        txn.update(
          "accounts",
          accountItem.toMap(),
          where: "id = ?",
          whereArgs: [accountItem.id],
        );
      });
    } catch (e) {
      log("updateAccountItem: $e");
    }
  }

  Future<void> deleteAccountItem({required AccountItem accountItem}) async {
    try {
      await db!.transaction((txn) async {
        txn.delete(
          "accounts",
          where: "id = ?",
          whereArgs: [accountItem.id],
        );
      });
    } catch (e) {
      log("deleteAccountItem: $e");
    }
  }
}
