import 'package:vault/constants/app_colors.dart';
import 'package:vault/screens/set_pin_confirmation_screen/set_pin_confirmation_screen_view.dart';
import 'package:vault/screens/set_pin_screen/set_pin_screen_controller.dart';
import 'package:vault/widgets/custom_elevated_button.dart';
import 'package:vault/widgets/custom_pin_circle.dart';
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
      body: Stack(
        children: [
          if (controller.pin.length == 4)
            Positioned(
              top: 6.85.h,
              right: 7.5.w,
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetPinConfirmationScreenView(
                      pin: controller.pin,
                    ),
                  ),
                ),
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: color03,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "SET PIN",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomPinCircle(
                        color: controller.pin.isNotEmpty
                            ? color02
                            : Colors.transparent,
                      ),
                      CustomPinCircle(
                        color: controller.pin.length >= 2
                            ? color02
                            : Colors.transparent,
                      ),
                      CustomPinCircle(
                        color: controller.pin.length >= 3
                            ? color02
                            : Colors.transparent,
                      ),
                      CustomPinCircle(
                        color: controller.pin.length >= 4
                            ? color02
                            : Colors.transparent,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("1"),
                        label: "1",
                      ),
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("2"),
                        label: "2",
                      ),
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("3"),
                        label: "3",
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("4"),
                        label: "4",
                      ),
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("5"),
                        label: "5",
                      ),
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("6"),
                        label: "6",
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("7"),
                        label: "7",
                      ),
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("8"),
                        label: "8",
                      ),
                      CustomElevatedButton(
                        onPressed: () => controller.enterPin("9"),
                        label: "9",
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Stack(
                    children: [
                      Align(
                        child: CustomElevatedButton(
                          onPressed: () => controller.enterPin("0"),
                          label: "0",
                        ),
                      ),
                      if (controller.pin.isNotEmpty)
                        Positioned(
                          right: 0,
                          child: ElevatedButton(
                            onPressed: () => controller.removePin(),
                            child: const Icon(
                              Icons.backspace_outlined,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
