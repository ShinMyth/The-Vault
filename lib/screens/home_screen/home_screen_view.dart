import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vault/constants/app_colors.dart';
import 'package:vault/constants/app_images.dart';
import 'package:vault/screens/account_credentials_screen/account_credentials_screen_view.dart';
// import 'package:vault/screens/account_details_screen/account_details_screen_view.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_view.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:vault/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                      // MaterialPageRoute(
                      //   builder: (context) => AccountDetailsScreenView(
                      //     accountItem: accounts[index],
                      //     accountsScreenController: controller,
                      //   ),
                      // ),
                      MaterialPageRoute(
                        builder: (context) => AccountCredentialsScreenView(
                          accountItem: accounts[index],
                          homeScreenController: controller,
                          isAddAccount: false,
                          isUpdateDeleteAccount: true,
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
            builder: (context) => AccountsScreenView(
              accountsScreenController: controller,
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
