import 'package:vault/models/account_model.dart';
import 'package:vault/screens/add_account_screen/widgets/custom_account_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAccount extends StatefulWidget {
  const CustomAccount({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  State<CustomAccount> createState() => _CustomAccountState();
}

class _CustomAccountState extends State<CustomAccount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.account.accountName,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 1.h),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: widget.account.accountItems.length,
          itemBuilder: (context, index) {
            return CustomAccountItem(
              accountItem: widget.account.accountItems[index],
            );
          },
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
