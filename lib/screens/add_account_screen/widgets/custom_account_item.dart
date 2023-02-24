import 'package:cached_network_image/cached_network_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:vault/screens/add_account_details_screen/add_account_details_screen_view.dart';
import 'package:flutter/material.dart';

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
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: CachedNetworkImage(
            imageUrl: widget.accountItem.accountItemImage,
            placeholder: (context, url) =>
                Image.asset("assets/images/flutter-logo.png"),
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/flutter-logo.png"),
          ),
        ),
      ),
    );
  }
}
