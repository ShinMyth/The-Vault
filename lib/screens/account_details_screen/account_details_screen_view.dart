import 'package:vault/constants/app_colors.dart';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/account_details_screen/account_details_screen_controller.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AccountDetailsScreenView extends StatefulWidget {
  const AccountDetailsScreenView({
    Key? key,
    required this.accountItem,
    required this.accountsScreenController,
  }) : super(key: key);

  final AccountItem accountItem;
  final AccountsScreenController accountsScreenController;

  @override
  State<AccountDetailsScreenView> createState() =>
      _AccountDetailsScreenViewState();
}

class _AccountDetailsScreenViewState extends State<AccountDetailsScreenView> {
  late AccountDetailsScreenController controller;

  @override
  void initState() {
    controller = AccountDetailsScreenController(
      setstate: () => setState(() {}),
      context: context,
      accountsScreenController: widget.accountsScreenController,
    );

    controller.setAccountData(accountItem: widget.accountItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ACCOUNT DETAILS",
            style: TextStyle(
              fontSize: 18.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () =>
                  controller.updateAccountItem(accountItem: widget.accountItem),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () =>
                  controller.deleteAccountItem(accountItem: widget.accountItem),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(3.w),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.accountItem.accountItemImage,
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/flutter-logo.png"),
                      width: 11.w,
                      height: 11.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      widget.accountItem.accountItemName,
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: color03,
              ),
              TextField(
                controller: controller.username,
                style: TextStyle(
                  fontSize: 17.5.sp,
                ),
                decoration: const InputDecoration(
                  label: Text("Username"),
                ),
              ),
              SizedBox(height: 3.h),
              TextField(
                controller: controller.password,
                style: TextStyle(
                  fontSize: 17.5.sp,
                ),
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
