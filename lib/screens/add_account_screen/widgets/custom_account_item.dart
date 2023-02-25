import 'package:vault/constants/app_colors.dart';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:vault/screens/add_account_details_screen/add_account_details_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomAccountItem extends StatefulWidget {
  const CustomAccountItem({
    Key? key,
    required this.accountItem,
    required this.accountsScreenController,
  }) : super(key: key);

  final AccountItem accountItem;
  final AccountsScreenController accountsScreenController;

  @override
  State<CustomAccountItem> createState() => _CustomAccountItemState();
}

class _CustomAccountItemState extends State<CustomAccountItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddAccountDetailsScreenView(
            accountItem: widget.accountItem,
            accountsScreenController: widget.accountsScreenController,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color06,
          border: Border.all(
            color: color04,
          ),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: widget.accountItem.accountItemImage,
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/flutter-logo.png"),
            width: 11.w,
            height: 11.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
