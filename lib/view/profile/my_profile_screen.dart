import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/routes/app_routes.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = "Ronald Richards";
    emailController.text = "ronaldrichards@gmail.com";
    phoneController.text = "(208) 555-0112";
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
          child: Column(children: [
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: getAssetImage("profile_photo.png",
                        height: 100.h, width: 100.h)),
                getVerSpace(50.h),
                getCustomFont("Name", 16.sp, hintColor, 1,
                    fontWeight: FontWeight.w400),
                getUnderlineTextfiled(context, nameController, "Name",
                    isdense: false),
                getVerSpace(20.h),
                getCustomFont("Email", 16.sp, hintColor, 1,
                    fontWeight: FontWeight.w400),
                getUnderlineTextfiled(context, emailController, "Email",
                    isdense: false),
                getVerSpace(20.h),
                getCustomFont("Phone Number", 16.sp, hintColor, 1,
                    fontWeight: FontWeight.w400),
                getUnderlineTextfiled(context, phoneController, "Phone Number",
                    isdense: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
              ],
            )),
            getButton(context, buttonColor, "Edit Profile", Colors.white, () {
              Constant.sendToNext(context, Routes.editProfileScreenRoute);
            },
                18.sp,
                weight: FontWeight.w600,
                buttonHeight: 60.h,
                borderRadius: BorderRadius.circular(22.h)),
            getVerSpace(40.h)
          ]).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }
}
