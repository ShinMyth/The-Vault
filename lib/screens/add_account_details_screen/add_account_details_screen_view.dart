import 'package:vault/models/account_item_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vault/screens/add_account_details_screen/add_account_details_screen_controller.dart';

class AddAccountDetailsScreenView extends StatefulWidget {
  const AddAccountDetailsScreenView({
    Key? key,
    required this.accountItem,
  }) : super(key: key);

  final AccountItem accountItem;

  @override
  State<AddAccountDetailsScreenView> createState() =>
      _AddAccountDetailsScreenViewState();
}

class _AddAccountDetailsScreenViewState
    extends State<AddAccountDetailsScreenView> {
  late AddAccountDetailsScreenController controller;

  @override
  void initState() {
    controller = AddAccountDetailsScreenController(
      setstate: () => setState(() {}),
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Account Details"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () =>
                  controller.insertAccountItem(accountItem: widget.accountItem),
              icon: const Icon(Icons.add),
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
