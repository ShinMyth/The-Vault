import 'package:vault/screens/account_details_screen/account_details_screen.dart';
import 'package:vault/screens/add_account_screen/add_account_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountsScreenView extends StatefulWidget {
  const AccountsScreenView({Key? key}) : super(key: key);

  @override
  State<AccountsScreenView> createState() => _AccountsScreenViewState();
}

class _AccountsScreenViewState extends State<AccountsScreenView> {
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
            itemCount: 20,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountDetailsScreenView(),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: const ListTile(
                      leading: Icon(Icons.facebook),
                      title: Text("Facebook"),
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
            builder: (context) => const AddAccountScreenView(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
