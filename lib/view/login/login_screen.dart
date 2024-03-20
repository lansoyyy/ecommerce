import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/constant_widget.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/pref_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void backClick() {
    Constant.closeApp();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  HomeController controller = Get.put(HomeController());

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                getVerSpace(55.h),
                getCustomFont("Login", 34.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(4.h),
                getMultilineCustomFont(
                        "Glad to meet you again! ", 16.sp, Colors.black,
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
                          getDefaultTextFiledWithLabel(
                              context, "Enter email address", emailController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "profile.svg"),
                          getVerSpace(30.h),
                          getDefaultTextFiledWithLabel(
                              context, "Enter password", passwordController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "lock.svg",
                              isPass: true,
                              withSufix: true,
                              suffiximage: "eye.svg"),
                          getVerSpace(12.h),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Constant.sendToNext(
                                    context, Routes.forgotScreenRoute);
                              },
                              child: getCustomFont(
                                  "Forgot Password?", 16.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          getVerSpace(40.h),
                          getButton(context, buttonColor, "Login", Colors.white,
                              () {
                            controller.onChange(0.obs);
                            PrefData.setIsSignIn(false);
                            Constant.sendToNext(
                                context, Routes.homeScreenRoute);
                          }, 18.sp,
                              weight: FontWeight.w600,
                              buttonHeight: 60.h,
                              borderRadius: BorderRadius.circular(22.h)),
                          getVerSpace(30.h),
                          getCustomFont("or", 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400),
                          getVerSpace(30.h),
                          getButton(context, "#FAF8F8".toColor(),
                              "Login with Google", Colors.black, () {}, 16.sp,
                              weight: FontWeight.w400,
                              buttonHeight: 56.h,
                              borderRadius: BorderRadius.circular(22.h),
                              isBorder: true,
                              borderColor: borderColor,
                              borderWidth: 1.h,
                              isIcon: true,
                              image: 'google.svg'),
                          getVerSpace(30.h),
                          getButton(context, "#FAF8F8".toColor(),
                              "Login with Facebook", Colors.black, () {}, 16.sp,
                              weight: FontWeight.w400,
                              buttonHeight: 56.h,
                              borderRadius: BorderRadius.circular(22.h),
                              isBorder: true,
                              borderColor: borderColor,
                              borderWidth: 1.h,
                              isIcon: true,
                              image: 'facebook.svg'),
                          getVerSpace(62.h),
                          getTwoRichText(
                              "Don’t have an account? ",
                              Colors.black,
                              FontWeight.w400,
                              16.sp,
                              "Sign Up",
                              buttonColor,
                              FontWeight.w700,
                              16.sp,
                              txtHeight: 1.5.h, function: () {
                            Constant.sendToNext(
                                context, Routes.signUpScreenRoute);
                          })
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
