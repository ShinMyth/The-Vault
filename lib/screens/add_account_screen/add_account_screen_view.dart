import 'package:vault/constants/app_colors.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:vault/screens/add_account_screen/widgets/custom_account.dart';
import 'package:vault/screens/add_account_screen/add_account_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddAccountScreenView extends StatefulWidget {
  const AddAccountScreenView({
    Key? key,
    required this.accountsScreenController,
  }) : super(key: key);

  final AccountsScreenController accountsScreenController;

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
        title: Text(
          "ADD ACCOUNT",
          style: TextStyle(
            fontSize: 18.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: controller.isLoading
            ? Center(
                child: SpinKitFadingCircle(
                  color: color02,
                  size: 27.sp,
                  duration: const Duration(milliseconds: 1400),
                ),
              )
            : ListView.builder(
                itemCount: controller.accounts.length,
                itemBuilder: (context, index) {
                  return CustomAccount(
                    account: controller.accounts[index],
                    accountsScreenController: widget.accountsScreenController,
                  );
                },
              ),
      ),
    );
  }
}
