import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';

import '../routes/app_routes.dart';
import '../util/color_category.dart';
import '../util/constant.dart';
import '../util/constant_widget.dart';
import '../util/pref_data.dart';

class AccountCreateDialog extends StatefulWidget {
  const AccountCreateDialog({Key? key}) : super(key: key);

  @override
  State<AccountCreateDialog> createState() => _AccountCreateDialogState();
}

class _AccountCreateDialogState extends State<AccountCreateDialog> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.h)),
      child:
      SizedBox(
        width: 350.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getVerSpace(40.h),
            getAssetImage("acccount_create_image.png",
                width: 140.h, height: 140.h),
            getVerSpace(20.h),
            getCustomFont("Account Created", 22.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.5.h),
            getVerSpace(8.h),
            getMultilineCustomFont(
                    "Your account has been successfully created!",
                    16.sp,
                    Colors.black,
                    fontWeight: FontWeight.w400,
                    txtHeight: 1.5.h,
                    textAlign: TextAlign.center)
                .paddingSymmetric(horizontal: 30.h),
            getVerSpace(40.h),
            getButton(context, buttonColor, "Ok", Colors.white, () {
              controller.onChange(0.obs);
              PrefData.setIsSignIn(false);
              Constant.sendToNext(context, Routes.homeScreenRoute);
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
