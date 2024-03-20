import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

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
          child: Column(
            children: [
              getVerSpace(20.h),
              getAppBar(
                "Settings",
                () {
                  backClick();
                },
              ),
              getVerSpace(40.h),
              getProfileWidget("key.png", "Change password", () {}),
              getVerSpace(20.h),
              getProfileWidget("country.png", "Country", () {}),
              getVerSpace(20.h),
              getProfileWidget("language.png", "Language", () {}),
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }


}
