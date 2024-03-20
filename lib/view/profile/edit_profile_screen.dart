import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  ProfileController controller = Get.put(ProfileController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgWhite);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        backgroundColor: bgWhite,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) => Column(
              children: [
                getVerSpace(20.h),
                getAppBar(
                  "My Profile",
                  () {
                    backClick();
                  },
                ),
                getVerSpace(40.h),
                Expanded(
                    child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      clipBehavior: Clip.none,
                      children: [
                        (controller.imagePath.value.isNotEmpty)
                            ? Container(
                                height: 100.h,
                                width: 100.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.h),
                                    image: DecorationImage(
                                        image: FileImage(
                                            File(controller.imagePath.value)),
                                        fit: BoxFit.fill)),
                              )
                            : getAssetImage("profile_photo.png",
                                height: 100.h, width: 100.h),
                        Positioned(
                          right: -12.h,
                          bottom: -12.h,
                          child: GestureDetector(
                              onTap: () {
                                controller.getImage();
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                padding: EdgeInsets.all(8.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.h),
                                    boxShadow: [
                                      BoxShadow(
                                          color: "#12000000".toColor(),
                                          blurRadius: 23,
                                          offset:
                                          const Offset(0, 6))
                                    ]),
                                child: getSvgImage("camera.svg",
                                    width: 30.h, height: 30.h),
                              )),
                        )
                      ],
                    ),
                    getVerSpace(42.h),
                    getDefaultTextFiledWithLabel(
                        context, "Enter your name", nameController,
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
                        image: "email.svg"),
                    getVerSpace(30.h),
                    getDefaultTextFiledWithLabel(
                        context, "Enter your mobile number", phoneController,
                        isEnable: false,
                        height: 56.h,
                        withprefix: true,
                        image: "call.svg",
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ]),
                  ],
                )),
                getButton(context, buttonColor, "Save", Colors.white, () {
                  backClick();
                }, 18.sp,
                    weight: FontWeight.w600,
                    buttonHeight: 60.h,
                    borderRadius: BorderRadius.circular(22.h)),
                getVerSpace(40.h)
              ],
            ).paddingSymmetric(horizontal: 20.h),
          ),
        ),
      ),
    );
  }
}
