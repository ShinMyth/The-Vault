import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vault/constants/app_colors.dart';
import 'package:vault/constants/app_images.dart';
import 'package:vault/screens/account_details_screen/account_details_screen_view.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:vault/screens/add_account_screen/add_account_screen_view.dart';
import 'package:vault/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AccountsScreenView extends StatefulWidget {
  const AccountsScreenView({Key? key}) : super(key: key);

  @override
  State<AccountsScreenView> createState() => _AccountsScreenViewState();
}

class _AccountsScreenViewState extends State<AccountsScreenView> {
  late AccountsScreenController controller;

  @override
  void initState() {
    controller = AccountsScreenController(
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
                  "There are no accounts found.",
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
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreenView(
                          accountItem: accounts[index],
                          accountsScreenController: controller,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 2.w,
                        horizontal: 1.w,
                      ),
                      margin: EdgeInsets.only(bottom: 3.w),
                      decoration: BoxDecoration(
                        color: color06,
                        border: Border.all(
                          color: color04,
                        ),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: accounts[index].accountItemImage,
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
                        title: Text(
                          accounts[index].accountItemName,
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddAccountScreenView(
              accountsScreenController: controller,
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
