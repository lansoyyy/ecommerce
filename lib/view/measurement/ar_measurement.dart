import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class ArMeasurement extends StatefulWidget {
  const ArMeasurement({Key? key}) : super(key: key);

  @override
  State<ArMeasurement> createState() => _ArMeasurementState();
}

class _ArMeasurementState extends State<ArMeasurement> {
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
              getAppBar("Get Measured Via AR", () {
                backClick();
              }).paddingSymmetric(horizontal: 20.h),
              getVerSpace(27.h),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  getAssetImage("male_image.png",
                          height: 526.h, width: double.infinity)
                      .marginOnly(top: 50.h),
                  Positioned(
                      child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(12.h)),
                        height: 50.h,
                        width: 50.h,
                        padding: EdgeInsets.all(13.h),
                        child: getSvgImage("play_circle.svg",
                            width: 24.h, height: 24.h),
                      ),
                      getVerSpace(20.h),
                      Container(
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(12.h)),
                        height: 50.h,
                        width: 50.h,
                        padding: EdgeInsets.all(13.h),
                        child: getSvgImage("microphone.svg",
                            width: 24.h, height: 24.h),
                      ),
                    ],
                  ).paddingOnly(right: 20.h))
                ],
              ),
              getVerSpace(40.h),
              getMultilineCustomFont(
                      "Place your device against the wall,your body must fit into the frame",
                      16.sp,
                      Colors.black,
                      fontWeight: FontWeight.w400,
                      txtHeight: 1.5,
                      textAlign: TextAlign.center)
                  .paddingSymmetric(horizontal: 20.h)
            ],
          ),
        ),
      ),
    );
  }
}
