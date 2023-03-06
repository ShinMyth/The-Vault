import 'package:vault/constants/app_colors.dart';
import 'package:vault/constants/app_images.dart';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/account_credentials_screen/account_credentials_screen_view.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomAccountRecord extends StatefulWidget {
  const CustomAccountRecord({
    Key? key,
    required this.accountItem,
    required this.controller,
  }) : super(key: key);

  final AccountItem accountItem;
  final HomeScreenController controller;

  @override
  State<CustomAccountRecord> createState() => _CustomAccountRecordState();
}

class _CustomAccountRecordState extends State<CustomAccountRecord> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountCredentialsScreenView(
            accountItem: widget.accountItem,
            homeScreenController: widget.controller,
            isAddAccount: false,
            isUpdateDeleteAccount: true,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.w),
        margin: EdgeInsets.only(bottom: 3.w),
        decoration: BoxDecoration(
          color: color06,
          border: Border.all(color: color04),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: widget.accountItem.accountItemImage,
            placeholder: (context, url) => SpinKitFadingCircle(
              color: color02,
              size: 22.sp,
              duration: const Duration(milliseconds: 1400),
            ),
            errorWidget: (context, url, error) => Image.asset(imageLogo),
            width: 11.w,
            height: 11.w,
            fit: BoxFit.contain,
          ),
          title: Text(
            widget.accountItem.accountItemName,
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
