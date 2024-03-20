import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:tailor_app/dialog/account_create_dialog.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

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
                getCustomFont("Verify", 34.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(4.h),
                getMultilineCustomFont("Enter code sent to your phone number!",
                        16.sp, Colors.black,
                        fontWeight: FontWeight.w400, txtHeight: 1.5.h)
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
                          Pinput(
                            focusedPinTheme: PinTheme(
                              decoration: BoxDecoration(
                                color: fieldBg,
                                border:
                                    Border.all(color: borderColor, width: 1.h),
                                borderRadius: BorderRadius.circular(22.h),
                              ),
                              height: 54.h,
                              width: 54.h,
                              margin: EdgeInsets.symmetric(horizontal: 5.h),
                              textStyle: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Constant.fontsFamily),
                            ),
                            disabledPinTheme: PinTheme(
                              width: 54.h,
                              height: 54.h,
                              margin: EdgeInsets.symmetric(horizontal: 5.h),
                              textStyle: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Constant.fontsFamily),
                              decoration: BoxDecoration(
                                  color: fieldBg,
                                  border: Border.all(
                                      color: borderColor, width: 1.h),
                                  borderRadius: BorderRadius.circular(22.h)),
                            ),
                            defaultPinTheme: PinTheme(
                              width: 54.h,
                              height: 54.h,
                              margin: EdgeInsets.symmetric(horizontal: 5.h),
                              textStyle: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Constant.fontsFamily),
                              decoration: BoxDecoration(
                                  color: fieldBg,
                                  border: Border.all(
                                      color: borderColor, width: 1.h),
                                  borderRadius: BorderRadius.circular(22.h)),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) {},
                            length: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          getVerSpace(52.h),
                          getButton(
                              context, buttonColor, "Verify", Colors.white, () {
                            Get.dialog(const AccountCreateDialog());
                          }, 18.sp,
                              weight: FontWeight.w600,
                              buttonHeight: 60.h,
                              borderRadius: BorderRadius.circular(22.h)),
                          getVerSpace(30.h),
                          getTwoRichText(
                              "Didn’t recieve code? ",
                              Colors.black,
                              FontWeight.w400,
                              16.sp,
                              "Resend",
                              buttonColor,
                              FontWeight.w700,
                              16.sp,
                              txtHeight: 1.5.h,
                              function: () {})
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
