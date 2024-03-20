import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/constant.dart';
import 'package:tailor_app/util/constant_widget.dart';
import 'package:tailor_app/util/pref_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getIsFirst();
  }

  _getIsFirst() async {
    bool isSignIn = await PrefData.getIsSignIn();
    bool isIntro = await PrefData.getIsIntro();

    Timer(const Duration(seconds: 3), () {
      if (isIntro) {
        Get.toNamed(Routes.introRoute);
      }
      else if (isSignIn) {
        Get.toNamed(Routes.loginRoute);
      } else {
        Get.toNamed(Routes.homeScreenRoute, arguments: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    Constant.setupSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getAssetImage("splash_logo.png", width: 100.h, height: 100.h),
            getVerSpace(12.h),
            getCustomFont("E-Tailoring", 26.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
