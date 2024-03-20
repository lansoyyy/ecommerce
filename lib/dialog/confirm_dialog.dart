import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/constant.dart';
import 'package:tailor_app/util/constant_widget.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.h),
      ),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 350.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getVerSpace(40.h),
            getAssetImage("confirm.png", height: 140.h, width: 140.h),
            getVerSpace(20.h),
            getCustomFont("Order Confirm", 22.sp, Colors.black, 1,
                fontWeight: FontWeight.w700),
            getVerSpace(8.h),
            getMultilineCustomFont(
                    "Your order has been successfully Completed!",
                    16.sp,
                    Colors.black,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,txtHeight: 1.5)
                .paddingSymmetric(horizontal: 30.h),
            getVerSpace(40.h),
            getButton(context, buttonColor, "Ok", Colors.white, () {
              Constant.sendToNext(context, Routes.homeScreenRoute);
            }, 18.sp,
                    weight: FontWeight.w600,
                    borderRadius: BorderRadius.circular(22.h),
                    buttonHeight: 60.h)
                .marginSymmetric(horizontal: 48.h),
            getVerSpace(40.h)
          ],
        ),
      ),
    );
  }
}
