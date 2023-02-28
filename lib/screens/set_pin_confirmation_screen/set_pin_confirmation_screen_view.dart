import 'package:vault/constants/app_colors.dart';
import 'package:vault/screens/set_pin_confirmation_screen/set_pin_confirmation_screen_controller.dart';
import 'package:vault/widgets/custom_elevated_button.dart';
import 'package:vault/widgets/custom_pin_circle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SetPinConfirmationScreenView extends StatefulWidget {
  const SetPinConfirmationScreenView({
    Key? key,
    required this.pin,
  }) : super(key: key);

  final String pin;

  @override
  State<SetPinConfirmationScreenView> createState() =>
      _SetPinConfirmationScreenViewState();
}

class _SetPinConfirmationScreenViewState
    extends State<SetPinConfirmationScreenView> {
  late SetPinConfirmationScreenController controller;

  @override
  void initState() {
    controller = SetPinConfirmationScreenController(
      setstate: () => setState(() {}),
      context: context,
    );

    controller.pin = widget.pin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "CONFIRM PIN",
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomPinCircle(
                    color: controller.confirmPin.isNotEmpty
                        ? color02
                        : Colors.transparent,
                  ),
                  CustomPinCircle(
                    color: controller.confirmPin.length >= 2
                        ? color02
                        : Colors.transparent,
                  ),
                  CustomPinCircle(
                    color: controller.confirmPin.length >= 3
                        ? color02
                        : Colors.transparent,
                  ),
                  CustomPinCircle(
                    color: controller.confirmPin.length >= 4
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
                    onPressed: () => controller.enterConfirmPin("1"),
                    label: "1",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("2"),
                    label: "2",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("3"),
                    label: "3",
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("4"),
                    label: "4",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("5"),
                    label: "5",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("6"),
                    label: "6",
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("7"),
                    label: "7",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("8"),
                    label: "8",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterConfirmPin("9"),
                    label: "9",
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Stack(
                children: [
                  Align(
                    child: CustomElevatedButton(
                      onPressed: () => controller.enterConfirmPin("0"),
                      label: "0",
                    ),
                  ),
                  if (controller.confirmPin.isNotEmpty)
                    Positioned(
                      right: 0,
                      child: ElevatedButton(
                        onPressed: () => controller.removeConfirmPin(),
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
    );
  }
}
