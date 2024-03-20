import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
                "Order Details",
                () {
                  backClick();
                },
              ),
              getVerSpace(30.h),
              Expanded(
                child: ListView(
                  primary: true,
                  shrinkWrap: false,
                  children: [
                    getCustomFont("Order ID:7412589", 16.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400),
                    getVerSpace(20.h),
                    Container(
                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.h),
                          boxShadow: [
                            BoxShadow(
                                color: "#1A3F3F3F".toColor(),
                                blurRadius: 32,
                                offset: const Offset(-2, 5))
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              getAssetImage("detail_image.png",
                                  height: 90.h, width: 90.h),
                              getHorSpace(12.h),
                              Column(
                                children: [
                                  getCustomFont("Ballon Sleeve Kurti", 18.sp,
                                      Colors.black, 1,
                                      fontWeight: FontWeight.w700),
                                  getVerSpace(8.h),
                                  getCustomFont("Cotton Fabric:20-40 GSM",
                                      14.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400)
                                ],
                              )
                            ],
                          ),
                          getVerSpace(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont(
                                  "Stitching Cost :", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400),
                              getCustomFont("\$20", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          getVerSpace(8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont(
                                  "Fabric Cost :", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400),
                              getCustomFont("\$08", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          getVerSpace(8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont(
                                  "Subtotal :", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400),
                              getCustomFont("\$28", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          getVerSpace(8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont(
                                  "Delivery Charge :", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400),
                              getCustomFont("\$02", 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          getVerSpace(12.h),
                          getDivider(setColor: lightBorder),
                          getVerSpace(12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont("Total", 18.sp, buttonColor, 1,
                                  fontWeight: FontWeight.w700),
                              getCustomFont("\$30.00", 18.sp, buttonColor, 1,
                                  fontWeight: FontWeight.w700)
                            ],
                          )
                        ],
                      ),
                    ),
                    getVerSpace(22.h),
                    getCustomFont("Delivery Detail", 16.sp, hintColor, 1,
                        fontWeight: FontWeight.w400),
                    getVerSpace(12.h),
                    Container(
                      padding: EdgeInsets.all(20.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: "#12000000".toColor(),
                                blurRadius: 23,
                                offset: const Offset(0, 6))
                          ],
                          borderRadius: BorderRadius.circular(22.h)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              getSvgImage("profile.svg",
                                  width: 24.h, height: 24.h),
                              getHorSpace(14.h),
                              Expanded(
                                  child: getCustomFont(
                                      "Ronald Richards", 16.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          getVerSpace(20.h),
                          Row(
                            children: [
                              getSvgImage("call.svg",
                                  width: 24.h, height: 24.h),
                              getHorSpace(14.h),
                              Expanded(
                                  child: getCustomFont(
                                      "(316) 555-0116 ", 16.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          getVerSpace(20.h),
                          Row(
                            children: [
                              getSvgImage("location.svg",
                                  width: 24.h, height: 24.h),
                              getHorSpace(14.h),
                              Expanded(
                                  child: getCustomFont(
                                      "Elgin St. Celina, Delaware ",
                                      16.sp,
                                      Colors.black,
                                      1,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          getVerSpace(20.h),
                          Row(
                            children: [
                              getSvgImage("clock.svg",
                                  width: 24.h, height: 24.h),
                              getHorSpace(14.h),
                              Expanded(
                                  child: getCustomFont(
                                      "Delivery Time: 12:21 PM ",
                                      16.sp,
                                      Colors.black,
                                      1,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          getVerSpace(20.h),
                          Row(
                            children: [
                              getSvgImage("calendar.svg",
                                  width: 24.h, height: 24.h),
                              getHorSpace(14.h),
                              Expanded(
                                  child: getCustomFont(
                                      "Delivery Date: 23 Aug,2022 ",
                                      16.sp,
                                      Colors.black,
                                      1,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ],
                      ),
                    ),
                    getVerSpace(30.h),
                    getButton(context, buttonColor, "Rating", Colors.white,
                        () {}, 18.sp,
                        weight: FontWeight.w600,
                        buttonHeight: 60.h,
                        borderRadius: BorderRadius.circular(22.h))
                  ],
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }
}
