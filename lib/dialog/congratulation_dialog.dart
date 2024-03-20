import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/constant.dart';

import '../util/color_category.dart';
import '../util/constant_widget.dart';

class CongratulationDialog extends StatefulWidget {
  const CongratulationDialog({Key? key}) : super(key: key);

  @override
  State<CongratulationDialog> createState() => _CongratulationDialogState();
}

class _CongratulationDialogState extends State<CongratulationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.h)),
      child: SizedBox(
        width: 350.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getVerSpace(40.h),
            getAssetImage("acccount_create_image.png",
                width: 140.h, height: 140.h),
            getVerSpace(20.h),
            getCustomFont("Congratulations!", 22.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.5.h),
            getVerSpace(8.h),
            getMultilineCustomFont("You have successfully saved your profile",
                    16.sp, Colors.black,
                    fontWeight: FontWeight.w400,
                    txtHeight: 1.5.h,
                    textAlign: TextAlign.center)
                .paddingSymmetric(horizontal: 30.h),
            getVerSpace(40.h),
            getButton(context, bgWhite, "Stat Over", buttonColor, () {
              Constant.sendToNext(context, Routes.homeScreenRoute);
            }, 18.sp,
                    weight: FontWeight.w600,
                    borderRadius: BorderRadius.circular(22.h),
                    buttonHeight: 60.h,
                    isBorder: true,
                    borderColor: buttonColor,
                    borderWidth: 1.h)
                .paddingSymmetric(horizontal: 20.h),
            getVerSpace(20.h),
            getButton(context, buttonColor, "Back to Home", Colors.white, () {
              Constant.sendToNext(context, Routes.homeScreenRoute);
            }, 18.sp,
                    weight: FontWeight.w600,
                    borderRadius: BorderRadius.circular(22.h),
                    buttonHeight: 60.h)
                .paddingSymmetric(horizontal: 20.h),
            getVerSpace(40.h),
          ],
        ),
      ),
    );
  }
}
