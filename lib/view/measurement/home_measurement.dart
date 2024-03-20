import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class HomeMeasurement extends StatefulWidget {
  const HomeMeasurement({Key? key}) : super(key: key);

  @override
  State<HomeMeasurement> createState() => _HomeMeasurementState();
}

class _HomeMeasurementState extends State<HomeMeasurement> {
  void backClick() {
    Constant.backToPrev(context);
  }

  MeasurementController controller = Get.put(MeasurementController());

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
          child: GetBuilder<MeasurementController>(
            init: MeasurementController(),
            builder: (controller) => Column(
              children: [
                getVerSpace(20.h),
                getAppBar("Get Measured at Home", () {
                  backClick();
                }).paddingSymmetric(horizontal: 20.h),
                getVerSpace(30.h),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getMultilineCustomFont(
                        "Get a professional tailor of aspecific gender to get measured at home",
                        16.sp,
                        Colors.black,
                        fontWeight: FontWeight.w400,
                        txtHeight: 1.5),
                    getVerSpace(30.h),
                    buildSelectTailor(controller),
                    getVerSpace(30.h),
                    buildTailorDetail()
                  ],
                ).paddingSymmetric(horizontal: 20.h)),
                buildConfirmButton(context),
                getVerSpace(40.h)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildConfirmButton(BuildContext context) {
    return getButton(
            context, buttonColor, "Confirm", Colors.white, () {
              backClick();
    }, 18.sp,
            weight: FontWeight.w600,
            borderRadius: BorderRadius.circular(22.h),
            buttonHeight: 60.h)
        .marginSymmetric(horizontal: 20.h);
  }

  Container buildTailorDetail() {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.h),
          boxShadow: [
            BoxShadow(
                color: "#12000000".toColor(),
                blurRadius: 23,
                offset: const Offset(0, 6))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              getSvgImage("call.svg"),
              getHorSpace(14.h),
              getCustomFont("(316) 555-0116 ", 16.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400),
            ],
          ),
          getVerSpace(20.h),
          Row(
            children: [
              getSvgImage("calendar.svg"),
              getHorSpace(14.h),
              getCustomFont("17-Aug-2022", 16.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400),
            ],
          ),
          getVerSpace(20.h),
          Row(
            children: [
              getSvgImage("location.svg"),
              getHorSpace(14.h),
              getCustomFont(
                  "Elgin St. Celina, Delaware ", 16.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400),
            ],
          ),
        ],
      ),
    );
  }

  Column buildSelectTailor(MeasurementController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont("Select Tailor", 18.sp, Colors.black, 1,
            fontWeight: FontWeight.w700, txtHeight: 1.5),
        getVerSpace(20.h),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.onChange(0);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.h),
                      boxShadow: [
                        BoxShadow(
                            color: "#12000000".toColor(),
                            blurRadius: 23,
                            offset: const Offset(0, 6))
                      ]),
                  padding: EdgeInsets.all(18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getCustomFont("Male", 18.sp, Colors.black, 1,
                          fontWeight: FontWeight.w600),
                      getSvgImage(
                          controller.gender.value == 0
                              ? "radio.svg"
                              : "un_radio.svg",
                          height: 24.h,
                          width: 24.h)
                    ],
                  ),
                ),
              ),
            ),
            getHorSpace(20.h),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.onChange(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.h),
                      boxShadow: [
                        BoxShadow(
                            color: "#12000000".toColor(),
                            blurRadius: 23,
                            offset: const Offset(0, 6))
                      ]),
                  padding: EdgeInsets.all(18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getCustomFont("Female", 18.sp, Colors.black, 1,
                          fontWeight: FontWeight.w600),
                      getSvgImage(
                          controller.gender.value == 1
                              ? "radio.svg"
                              : "un_radio.svg",
                          height: 24.h,
                          width: 24.h)
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
