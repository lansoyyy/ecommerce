import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/constant_widget.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';

class GiveMeasurementScreen extends StatefulWidget {
  const GiveMeasurementScreen({Key? key}) : super(key: key);

  @override
  State<GiveMeasurementScreen> createState() => _GiveMeasurementScreenState();
}

class _GiveMeasurementScreenState extends State<GiveMeasurementScreen> {
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
              getAppBar("Give Measurements", () {
                backClick();
              }).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              getMultilineCustomFont(
                      "Using the latest technology or a professional tailor,you can measure yourself in your comfort zone",
                      16.sp,
                      Colors.black,
                      fontWeight: FontWeight.w400,
                      txtHeight: 1.5)
                  .paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.homeMeasurementRoute);
                },
                child: customWidget("Get Measured at Home by a Tailor",
                    "You can now get measured by calling a professional tailor of a specific gender at your home"),
              ),
              getVerSpace(20.h),
              GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.arMeasurementRoute);
                },
                child: customWidget("Get Measured Via AR",
                    "Ullamcorper morbi tincidunt ornare massa. Sed enim ut sem viverra aliquet eget. Vel elit scelerisque mauris pellentesquei."),
              ),
              getVerSpace(20.h),
              GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.manualMeasurementRoute);
                },
                child: customWidget("Measured by Yourself",
                    "Ullamcorper morbi tincidunt ornare massa. Sed enim ut sem viverra aliquet eget."),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customWidget(String title, String discription) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.h),
          boxShadow: [
            BoxShadow(
                color: "#1A3F3F3F".toColor(),
                blurRadius: 32,
                offset: const Offset(-2, 5))
          ]),
      padding:
          EdgeInsets.only(right: 16.h, left: 20.h, bottom: 20.h, top: 20.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont(title, 18.sp, buttonColor, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.5),
                getVerSpace(8.h),
                getMultilineCustomFont(discription, 14.sp, Colors.black,
                    fontWeight: FontWeight.w400, txtHeight: 1.5)
              ],
            ),
          ),
          getHorSpace(14.h),
          getSvgImage("arrow_right.svg", width: 16.h, height: 16.h)
        ],
      ),
    ).paddingSymmetric(horizontal: 20.h);
  }
}
