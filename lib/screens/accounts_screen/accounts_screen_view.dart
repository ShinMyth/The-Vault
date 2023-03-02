import 'package:vault/constants/app_colors.dart';
import 'package:vault/screens/accounts_screen/widgets/custom_account.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AccountsScreenView extends StatefulWidget {
  const AccountsScreenView({
    Key? key,
    required this.accountsScreenController,
  }) : super(key: key);

  final HomeScreenController accountsScreenController;

  @override
  State<AccountsScreenView> createState() => _AccountsScreenViewState();
}

class _AccountsScreenViewState extends State<AccountsScreenView> {
  late AccountsScreenController controller;

  @override
  void initState() {
    controller = AccountsScreenController(
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "ACCOUNTS",
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
