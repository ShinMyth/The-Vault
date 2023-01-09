import 'package:vault/screens/add_account_details_screen/add_account_details_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAccount extends StatefulWidget {
  const CustomAccount({Key? key}) : super(key: key);

  @override
  State<CustomAccount> createState() => _CustomAccountState();
}

class _CustomAccountState extends State<CustomAccount> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddAccountDetailsScreenView(),
        ),
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: const Icon(Icons.facebook),
        ),
      ),
    );
  }
}
