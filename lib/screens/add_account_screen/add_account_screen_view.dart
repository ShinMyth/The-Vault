import 'package:vault/screens/add_account_screen/widgets/custom_account.dart';
import 'package:vault/screens/add_account_screen/add_account_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddAccountScreenView extends StatefulWidget {
  const AddAccountScreenView({Key? key}) : super(key: key);

  @override
  State<AddAccountScreenView> createState() => _AddAccountScreenViewState();
}

class _AddAccountScreenViewState extends State<AddAccountScreenView> {
  late AddAccountScreenController controller;

  @override
  void initState() {
    controller = AddAccountScreenController(
      setstate: () => setState(() {}),
      context: context,
    );

    controller.getAccountsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Account"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: ListView.builder(
          itemCount: controller.accounts.length,
          itemBuilder: (context, index) {
            return CustomAccount(account: controller.accounts[index]);
          },
        ),
      ),
    );
  }
}
