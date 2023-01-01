import 'package:flutter/material.dart';

class AccountDetailsScreenView extends StatefulWidget {
  const AccountDetailsScreenView({Key? key}) : super(key: key);

  @override
  State<AccountDetailsScreenView> createState() =>
      _AccountDetailsScreenViewState();
}

class _AccountDetailsScreenViewState extends State<AccountDetailsScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Details"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Account Details Screen View"),
      ),
    );
  }
}
