import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountDetailsScreenView extends StatefulWidget {
  const AccountDetailsScreenView({Key? key}) : super(key: key);

  @override
  State<AccountDetailsScreenView> createState() =>
      _AccountDetailsScreenViewState();
}

class _AccountDetailsScreenViewState extends State<AccountDetailsScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Details"),
        centerTitle: true,
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
                  const Icon(Icons.facebook),
                  SizedBox(width: 7.w),
                  const Text("Facebook"),
                ],
              ),
            ),
            const Divider(),
            SizedBox(height: 3.h),
            const Text("Username"),
            SizedBox(height: 1.h),
            const TextField(),
            SizedBox(height: 3.h),
            const Text("Password"),
            SizedBox(height: 1.h),
            const TextField(),
          ],
        ),
      ),
    );
  }
}
