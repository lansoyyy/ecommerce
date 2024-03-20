import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';

import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';
import '../../util/country_code_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  SignUpController controller = Get.put(SignUpController());

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
                getCustomFont("Sign Up", 34.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(4.h),
                getMultilineCustomFont(
                        "Enter your detail for sign up!", 16.sp, Colors.black,
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
                              context, "Enter name", nameController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "profile.svg"),
                          getVerSpace(30.h),
                          getDefaultTextFiledWithLabel(
                              context, "Enter email address", emailController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "profile.svg"),
                          getVerSpace(30.h),
                          getPhoneTextField(
                              context, "Phone number", phoneController,
                              isEnable: false,
                              height: 56.h,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              withprefix: true,
                              image: SizedBox(
                                height: 24.h,
                                width: 60.h,
                                child: CountryCodePicker(
                                  onChanged: print,
                                  initialSelection: 'IN',
                                  flagWidth: 24.h,
                                  padding: EdgeInsets.zero,
                                  textStyle: TextStyle(
                                      color: hintColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp),
                                  favorite: const ['+91', 'IN'],
                                  showCountryOnly: false,
                                  showDropDownButton: false,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                ),
                              )),
                          getVerSpace(30.h),
                          getDefaultTextFiledWithLabel(
                              context, "Password", passswordController,
                              isEnable: false,
                              height: 56.h,
                              withprefix: true,
                              image: "lock.svg",
                              withSufix: true,
                              suffiximage: "eye.svg"),
                          getVerSpace(20.h),
                          GetBuilder<SignUpController>(
                            init: SignUpController(),
                            builder: (controller) => Row(
                              children: [
                                GestureDetector(
                                  child: getSvgImage(
                                      controller.check.value
                                          ? "check.svg"
                                          : "uncheck.svg",
                                      width: 24.h,
                                      height: 24.h),
                                  onTap: () {
                                    controller.onChange();
                                  },
                                ),
                                getHorSpace(10.h),
                                getCustomFont("I agree with Terms & Privacy",
                                    16.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w400)
                              ],
                            ),
                          ),
                          getVerSpace(40.h),
                          getButton(context, buttonColor, "Sign up",
                              Colors.white, () {
                            Constant.sendToNext(context, Routes.verifyScreenRoute);
                              }, 18.sp,
                              weight: FontWeight.w600,
                              buttonHeight: 60.h,
                              borderRadius: BorderRadius.circular(22.h)),
                          getVerSpace(93.h),
                          getTwoRichText(
                              "Already have an account? ",
                              Colors.black,
                              FontWeight.w400,
                              16.sp,
                              "Login",
                              buttonColor,
                              FontWeight.w700,
                              16.sp,
                              txtHeight: 1.5.h, function: () {
                            Constant.sendToNext(context, Routes.loginRoute);
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
