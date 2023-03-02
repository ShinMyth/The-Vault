import 'package:vault/constants/app_colors.dart';
import 'package:vault/constants/app_images.dart';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/account_credentials_screen/widgets/custom_text_field.dart';
import 'package:vault/screens/account_credentials_screen/account_credentials_screen_controller.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AccountCredentialsScreenView extends StatefulWidget {
  const AccountCredentialsScreenView({
    Key? key,
    required this.accountItem,
    required this.homeScreenController,
    required this.isAddAccount,
    required this.isUpdateDeleteAccount,
  }) : super(key: key);

  final AccountItem accountItem;
  final HomeScreenController homeScreenController;
  final bool isAddAccount;
  final bool isUpdateDeleteAccount;

  @override
  State<AccountCredentialsScreenView> createState() =>
      _AccountCredentialsScreenViewState();
}

class _AccountCredentialsScreenViewState
    extends State<AccountCredentialsScreenView> {
  late AccountCredentialsScreenController controller;

  @override
  void initState() {
    controller = AccountCredentialsScreenController(
      setstate: () => setState(() {}),
      context: context,
    );

    controller.accountItem = widget.accountItem;
    controller.homeScreenController = widget.homeScreenController;

    controller.username.text = controller.accountItem.accountItemUsername;
    controller.password.text = controller.accountItem.accountItemPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            "ACC. CREDENTIALS",
            style: TextStyle(
              fontSize: 18.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            if (widget.isAddAccount)
              IconButton(
                onPressed: () => controller.insertAccountItem(),
                icon: const Icon(Icons.add),
              ),
            if (widget.isUpdateDeleteAccount) ...[
              IconButton(
                onPressed: () => controller.updateAccountItem(),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => controller.deleteAccountItem(),
                icon: const Icon(Icons.delete),
              ),
            ],
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
                      placeholder: (context, url) => SpinKitFadingCircle(
                        color: color02,
                        size: 22.sp,
                        duration: const Duration(milliseconds: 1400),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset(imageLogo),
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
              CustomTextField(
                controller: controller.username,
                label: const Text("Username"),
              ),
              SizedBox(height: 3.h),
              CustomTextField(
                controller: controller.password,
                obscureText: controller.isPasswordObscureText,
                label: const Text("Password"),
                suffixIcon: GestureDetector(
                  onTap: () => controller.changeIsPasswordObscureText(),
                  child: controller.isPasswordObscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
