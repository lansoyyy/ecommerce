import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/dialog/pass_change_dialog.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgColor);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        backgroundColor: bgWhite,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(20.h),
                GestureDetector(
                  onTap: () {
                    backClick();
                  },
                  child:
                      getSvgImage("arrow_left.svg", height: 24.h, width: 24.h)
                          .paddingSymmetric(horizontal: 20.h),
                ),
                getVerSpace(16.h),
                getCustomFont("Reset Password", 34.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(4.h),
                getMultilineCustomFont(
                        "We need your registration email for reset password!",
                        16.sp,
                        Colors.black,
                        fontWeight: FontWeight.w400,
                        txtHeight: 1.5.h)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(24.h),
                Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      decoration: BoxDecoration(
                          color: bgWhite,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(22.h)),
                          boxShadow: [
                            BoxShadow(
                                color: "#26A92F45".toColor(),
                                blurRadius: 47,
                                offset: const Offset(1, 4))
                          ]),
                      child: Column(
                        children: [
                          getVerSpace(40.h),
                          getDefaultTextFiledWithLabel(
                              context, "Old password", oldPassController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "lock.svg",
                              withSufix: true,
                              suffiximage: "eye.svg"),
                          getVerSpace(30.h),
                          getDefaultTextFiledWithLabel(
                              context, "New password", newPassController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "lock.svg",
                              withSufix: true,
                              suffiximage: "eye.svg"),
                          getVerSpace(30.h),
                          getDefaultTextFiledWithLabel(
                              context, "Confirm password", confPassController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "lock.svg",
                              withSufix: true,
                              suffiximage: "eye.svg"),
                          getVerSpace(40.h),
                          getButton(
                              context, buttonColor, "Submit", Colors.white, () {
                            Get.dialog(const PassChangeDialog());
                          }, 18.sp,
                              weight: FontWeight.w600,
                              buttonHeight: 60.h,
                              borderRadius: BorderRadius.circular(22.h)),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
