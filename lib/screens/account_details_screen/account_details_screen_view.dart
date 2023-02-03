import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/account_details_screen/account_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AccountDetailsScreenView extends StatefulWidget {
  const AccountDetailsScreenView({
    Key? key,
    required this.accountItem,
  }) : super(key: key);

  final AccountItem accountItem;

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
          title: const Text("Account Details"),
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
                    Container(
                      height: 10.w,
                      width: 10.w,
                      color: Colors.white,
                      child: CachedNetworkImage(
                        imageUrl: widget.accountItem.accountItemImage,
                        placeholder: (context, url) =>
                            Image.asset("assets/images/flutter-logo.png"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/flutter-logo.png"),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      widget.accountItem.accountItemName,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(height: 3.h),
              const Text("Username"),
              SizedBox(height: 1.h),
              TextField(
                controller: controller.username,
              ),
              SizedBox(height: 3.h),
              const Text("Password"),
              SizedBox(height: 1.h),
              TextField(
                controller: controller.password,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
