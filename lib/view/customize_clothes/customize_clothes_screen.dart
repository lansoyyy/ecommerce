import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/dialog/bottom_sleeve_dialog.dart';
import 'package:tailor_app/routes/app_routes.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class CustomizeClotheScreen extends StatefulWidget {
  const CustomizeClotheScreen({Key? key}) : super(key: key);

  @override
  State<CustomizeClotheScreen> createState() => _CustomizeClotheScreenState();
}

class _CustomizeClotheScreenState extends State<CustomizeClotheScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  List<String> clothList = ["Cotton", "Lycra", "Jekard"];
  CustomizeController controller = Get.put(CustomizeController());

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
                "Customize Clothes",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              Expanded(
                flex: 1,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  primary: true,
                  shrinkWrap: false,
                  children: [
                    getDropDownWithItem("Set category",
                        text: false,
                        value: clothList[0],
                        item: clothList.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                getCustomFont(e, 16.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          );
                        }).toList()),
                    getVerSpace(30.h),
                    buildProductImage(),
                    getVerSpace(30.h),
                    buildProductCategory(),
                    getVerSpace(50.h),
                    getButton(context, buttonColor, "Add to cart", Colors.white,
                        () {
                      Constant.sendToNext(context, Routes.cartScreenRoute);
                    }, 18.sp,
                        weight: FontWeight.w600,
                        borderRadius: BorderRadius.circular(22.h),
                        buttonHeight: 60.h)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildProductCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getSvgImage("left_arrow.svg", width: 16.h, height: 16.h),
        Row(
          children: [
            GestureDetector(
              child: Container(
                height: 94.h,
                width: 94.h,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getSvgImage("tshirt.svg", width: 34.h, height: 34.h),
                    getVerSpace(4.h),
                    getCustomFont("Sleeves", 16.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400, txtHeight: 1.5)
                  ],
                ),
              ),
              onTap: () {
                Get.bottomSheet(const BottomSleeveDialog());
              },
            ),
            getHorSpace(16.h),
            Container(
              height: 94.h,
              width: 94.h,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSvgImage("coller.svg", width: 34.h, height: 34.h),
                  getVerSpace(4.h),
                  getCustomFont("Collar", 16.sp, Colors.black, 1,
                      fontWeight: FontWeight.w400, txtHeight: 1.5)
                ],
              ),
            ),
            getHorSpace(16.h),
            Container(
              height: 94.h,
              width: 94.h,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSvgImage("pocket.svg", width: 34.h, height: 34.h),
                  getVerSpace(4.h),
                  getCustomFont("Pocket", 16.sp, Colors.black, 1,
                      fontWeight: FontWeight.w400, txtHeight: 1.5)
                ],
              ),
            )
          ],
        ),
        getSvgImage("right_arrow.svg", height: 16.h, width: 16.h),
      ],
    );
  }

  Container buildProductImage() {
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
      child: Column(
        children: [
          getVerSpace(20.h),
          Stack(
            alignment: Alignment.topRight,
            children: [
              getAssetImage("shirt_image.png",
                      height: 250.h, width: double.infinity)
                  .paddingOnly(top: 8.h),
              Positioned(
                right: 20.h,
                child: Container(
                  height: 54.h,
                  width: 54.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.h),
                      boxShadow: [
                        BoxShadow(
                            color: "#1A3F3F3F".toColor(),
                            blurRadius: 32,
                            offset: const Offset(-2, 5))
                      ]),
                  padding: EdgeInsets.all(12.h),
                  child: getSvgImage("cube.svg", height: 30.h, width: 30.h),
                ),
              )
            ],
          ),
          getVerSpace(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<CustomizeController>(
                builder: (controller) => Row(
                  children: [
                    GestureDetector(
                      child: getSvgImage(
                          // ignore: unrelated_type_equality_checks
                          controller.color == 0
                              ? "black_select.svg"
                              : "black_unselect.svg",
                          width: 30.h,
                          height: 30.h),
                      onTap: () {
                        controller.changeColor(0);
                      },
                    ),
                    getHorSpace(10.h),
                    GestureDetector(
                      onTap: () {
                        controller.changeColor(1);
                      },
                      child: getSvgImage(
                          // ignore: unrelated_type_equality_checks
                          controller.color == 1
                              ? "green_select.svg"
                              : "green_unselect.svg",
                          height: 30.h,
                          width: 30.h),
                    ),
                    getHorSpace(10.h),
                    GestureDetector(
                      onTap: () {
                        controller.changeColor(2);
                      },
                      child: getSvgImage(
                          // ignore: unrelated_type_equality_checks
                          controller.color == 2
                              ? "light_pink_select.svg"
                              : "light_pink_unselect.svg",
                          height: 30.h,
                          width: 30.h),
                    ),
                  ],
                ),
                init: CustomizeController(),
              ),
              getCustomFont("\$20.00", 20.sp, buttonColor, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5)
            ],
          ).paddingSymmetric(horizontal: 20.h),
          getVerSpace(30.h)
        ],
      ),
    );
  }
}
