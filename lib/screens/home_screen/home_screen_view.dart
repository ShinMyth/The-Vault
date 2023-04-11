import 'package:vault/screens/accounts_screen/accounts_screen_view.dart';
import 'package:vault/screens/home_screen/widgets/custom_account_record.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:vault/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late HomeScreenController controller;

  @override
  void initState() {
    controller = HomeScreenController(
      setstate: () => setState(() {}),
      context: context,
    );

    controller.queryAccountItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "THE VAULT",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: accounts.isEmpty
            ? Center(
                child: Text(
                  "There are no accounts found",
                  style: TextStyle(
                    fontSize: 17.5.sp,
                  ),
                ),
              )
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  return CustomAccountRecord(
                    accountItem: accounts[index],
                    controller: controller,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountsScreenView(
              homeScreenController: controller,
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
