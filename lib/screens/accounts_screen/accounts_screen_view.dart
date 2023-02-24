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
        title: const Text("Accounts"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: ListView.builder(
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
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: ListTile(
                      leading: Container(
                        height: 10.w,
                        width: 10.w,
                        color: Colors.white,
                        child: CachedNetworkImage(
                          imageUrl: accounts[index].accountItemImage,
                          placeholder: (context, url) =>
                              Image.asset("assets/images/flutter-logo.png"),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/flutter-logo.png"),
                        ),
                      ),
                      title: Text(accounts[index].accountItemName),
                    ),
                  ),
                ),
              );
            }),
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
