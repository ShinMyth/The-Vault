import 'package:vault/screens/account_details_screen/account_details_screen.dart';
import 'package:flutter/material.dart';

class AccountsScreenView extends StatefulWidget {
  const AccountsScreenView({Key? key}) : super(key: key);

  @override
  State<AccountsScreenView> createState() => _AccountsScreenViewState();
}

class _AccountsScreenViewState extends State<AccountsScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accounts"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Accounts Screen View"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const AccountDetailsScreenView()),
                );
              },
              child: const Text("Account Details"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
