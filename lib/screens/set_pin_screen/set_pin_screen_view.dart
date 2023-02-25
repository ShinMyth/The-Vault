import 'package:vault/screens/set_pin_screen/set_pin_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SetPinScreenView extends StatefulWidget {
  const SetPinScreenView({Key? key}) : super(key: key);

  @override
  State<SetPinScreenView> createState() => _SetPinScreenViewState();
}

class _SetPinScreenViewState extends State<SetPinScreenView> {
  late SetPinScreenController controller;

  @override
  void initState() {
    controller = SetPinScreenController(
      setstate: () => setState(() {}),
      context: context,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Set Pin"),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: controller.pin.isNotEmpty
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: controller.pin.length > 1
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: controller.pin.length > 2
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: controller.pin.length > 3
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.enterPin("1"),
                  child: const Text("1"),
                ),
                ElevatedButton(
                  onPressed: () => controller.enterPin("2"),
                  child: const Text("2"),
                ),
                ElevatedButton(
                  onPressed: () => controller.enterPin("3"),
                  child: const Text("3"),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.enterPin("4"),
                  child: const Text("4"),
                ),
                ElevatedButton(
                  onPressed: () => controller.enterPin("5"),
                  child: const Text("5"),
                ),
                ElevatedButton(
                  onPressed: () => controller.enterPin("6"),
                  child: const Text("6"),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.enterPin("7"),
                  child: const Text("7"),
                ),
                ElevatedButton(
                  onPressed: () => controller.enterPin("8"),
                  child: const Text("8"),
                ),
                ElevatedButton(
                  onPressed: () => controller.enterPin("9"),
                  child: const Text("9"),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Align(
              child: ElevatedButton(
                onPressed: () => controller.enterPin("0"),
                child: const Text("0"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
