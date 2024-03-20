import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/constant.dart';
import 'package:tailor_app/util/constant_widget.dart';

class PassChangeDialog extends StatefulWidget {
  const PassChangeDialog({Key? key}) : super(key: key);

  @override
  State<PassChangeDialog> createState() => _PassChangeDialogState();
}

class _PassChangeDialogState extends State<PassChangeDialog> {
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
            getAssetImage("pass_change_image.png", width: 140.h, height: 140.h),
            getVerSpace(20.h),
            getCustomFont("Password Changed", 22.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.5.h),
            getVerSpace(8.h),
            getMultilineCustomFont(
                    "Your password has been successfully changed!",
                    16.sp,
                    Colors.black,
                    fontWeight: FontWeight.w400,
                    txtHeight: 1.5.h,
                    textAlign: TextAlign.center)
                .paddingSymmetric(horizontal: 30.h),
            getVerSpace(40.h),
            getButton(context, buttonColor, "Ok", Colors.white, () {
              Constant.sendToNext(context, Routes.loginRoute);
            }, 18.sp,
                    weight: FontWeight.w600,
                    buttonHeight: 60.h,
                    borderRadius: BorderRadius.circular(22.h))
                .paddingSymmetric(horizontal: 48.h),
            getVerSpace(40.h),
          ],
        ),
      ),
    );
  }
}
