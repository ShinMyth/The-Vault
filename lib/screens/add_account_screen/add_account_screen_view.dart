import 'package:vault/screens/add_account_screen/widgets/custom_account.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddAccountScreenView extends StatefulWidget {
  const AddAccountScreenView({Key? key}) : super(key: key);

  @override
  State<AddAccountScreenView> createState() => _AddAccountScreenViewState();
}

class _AddAccountScreenViewState extends State<AddAccountScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Account"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Social Media"),
              SizedBox(height: 1.h),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const CustomAccount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
