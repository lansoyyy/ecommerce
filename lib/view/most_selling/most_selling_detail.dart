import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/dataFile/data_file.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/constant_widget.dart';

import '../../model/trending_model.dart';
import '../../util/constant.dart';

class MostSellingDetail extends StatefulWidget {
  const MostSellingDetail({Key? key}) : super(key: key);

  @override
  State<MostSellingDetail> createState() => _MostSellingDetailState();
}

class _MostSellingDetailState extends State<MostSellingDetail> {
  void backClick() {
    Constant.backToPrev(context);
  }

  List<String> colorLists = DataFile.color;
  MostSellDetailController controller = Get.put(MostSellDetailController());
  List<String> sizeLists = DataFile.sizeList;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    setStatusBarColor('#FFDEDB'.toColor());
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        backgroundColor: bgWhite,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ListView(
            primary: true,
            shrinkWrap: false,
            children: [
              Stack(
                children: [
                  Container(
                    height: 304.h,
                    decoration: BoxDecoration(
                        color: '#FFDEDB'.toColor(),
                        image: DecorationImage(
                            image: AssetImage(
                                "${Constant.assetImagePath}most_sell1.png"))),
                  ),
                  Column(
                    children: [
                      getVerSpace(20.h),
                      GestureDetector(
                          onTap: () {
                            backClick();
                          },
                          child: getSvgImage("arrow_left.svg",
                              width: 24.h, height: 24.h))
                    ],
                  ).paddingSymmetric(horizontal: 20.h)
                ],
              ),
              getVerSpace(20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: getCustomFont(
                            "Boy Red Kurta", 20.sp, Colors.black, 1,
                            fontWeight: FontWeight.w700, txtHeight: 1.5),
                      ),
                      getSvgImage("star.svg", height: 16.h, width: 16.h),
                      getHorSpace(5.h),
                      getCustomFont("5.4", 12.sp, Colors.black, 1,
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                  getVerSpace(8.h),
                  getCustomFont("\$12.00", 18.sp, Colors.black, 1,
                      fontWeight: FontWeight.w700, txtHeight: 1.5),
                  getVerSpace(20.h),
                  getDivider(setColor: textHintColor),
                  getVerSpace(20.h),
                  getCustomFont("Color", 15.sp, Colors.black, 1,
                      fontWeight: FontWeight.w500),
                  getVerSpace(16.h),
                  SizedBox(
                    height: 24.h,
                    child: GetBuilder<MostSellDetailController>(
                      init: MostSellDetailController(),
                      builder: (controller) => ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: colorLists.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.colorChange(index);
                            },
                            child: Container(
                              width: 24.h,
                              decoration: BoxDecoration(
                                  color: colorLists[index].toColor(),
                                  borderRadius: BorderRadius.circular(30.h)),
                              padding: EdgeInsets.all(5.h),
                              // ignore: unrelated_type_equality_checks
                              child: controller.color == index
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30.h)),
                                    )
                                  : null,
                            ).marginOnly(right: 20.h),
                          );
                        },
                      ),
                    ),
                  ),
                  getVerSpace(20.h),
                  getCustomFont("Size", 15.sp, Colors.black, 1,
                      fontWeight: FontWeight.w500),
                  getVerSpace(16.h),
                  SizedBox(
                    height: 46.h,
                    child: GetBuilder<MostSellDetailController>(
                      init: MostSellDetailController(),
                      builder: (controller) => ListView.builder(
                        itemCount: sizeLists.length,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.sizeChange(index);
                            },
                            child: Container(
                              width: 46.h,
                              decoration: BoxDecoration(
                                  // ignore: unrelated_type_equality_checks
                                  color: controller.size == index
                                      ? buttonColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(40.h),
                                  boxShadow: [
                                    BoxShadow(
                                        color: '#121A2947'.toColor(),
                                        blurRadius: 24,
                                        offset: const Offset(-3, 9))
                                  ]),
                              alignment: Alignment.center,
                              child: getCustomFont(
                                  sizeLists[index],
                                  15.sp,
                                  // ignore: unrelated_type_equality_checks
                                  controller.size == index
                                      ? Colors.white
                                      : Colors.black,
                                  1,
                                  fontWeight: FontWeight.w500),
                            ).marginOnly(right: 20.h),
                          );
                        },
                      ),
                    ),
                  ),
                  getVerSpace(20.h),
                  getCustomFont("Quantity", 15.sp, Colors.black, 1,
                      fontWeight: FontWeight.w500),
                  getVerSpace(16.h),
                  GetBuilder<MostSellDetailController>(
                    init: MostSellDetailController(),
                    builder: (controller) => Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.onMinus();
                          },
                          child: Container(
                            height: 36.h,
                            width: 36.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: "#1A3F3F3F".toColor(),
                                      blurRadius: 32,
                                      offset: const Offset(-2, 5))
                                ]),
                            padding: EdgeInsets.all(9.h),
                            child: getSvgImage("minus.svg",
                                width: 18.h, height: 18.h),
                          ),
                        ),
                        getHorSpace(20.h),
                        getCustomFont(controller.quantity.value.toString(),
                            15.sp, Colors.black, 1,
                            fontWeight: FontWeight.w500),
                        getHorSpace(20.h),
                        GestureDetector(
                          onTap: () {
                            controller.onAdd();
                          },
                          child: Container(
                            height: 36.h,
                            width: 36.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: "#1A3F3F3F".toColor(),
                                      blurRadius: 32,
                                      offset: const Offset(-2, 5))
                                ]),
                            padding: EdgeInsets.all(9.h),
                            child: getSvgImage("black_add.svg",
                                width: 18.h, height: 18.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                  getVerSpace(30.h),
                  getDivider(setColor: borderColor),
                  getVerSpace(20.h),
                  getCustomFont("Trending Products", 22.sp, Colors.black, 1,
                      fontWeight: FontWeight.w700, txtHeight: 1.5),
                  getVerSpace(20.h),
                ],
              ).paddingSymmetric(horizontal: 20.h),
              GetBuilder<ShopController>(
                init: ShopController(),
                builder: (controller) => SizedBox(
                  height: 236.h,
                  child: ListView.builder(
                    itemCount: 3,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ModelTrending modeltrending =
                          controller.shoptrendingLists[index];
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? 20.h : 0, right: 20.h),
                        width: 177.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 177.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.h),
                                  color: "#E2E3E3".toColor(),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Constant.assetImagePath +
                                              modeltrending.image),
                                      fit: BoxFit.fill)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: 8.h, top: 8.h),
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30.h),
                                        boxShadow: [
                                          BoxShadow(
                                              color: "#12000000".toColor(),
                                              blurRadius: 23,
                                              offset: const Offset(0, 6))
                                        ]),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.selectChange(index);
                                      },
                                      child: getSvgImage(
                                              controller
                                                      .shoptrendingLists[index]
                                                      .favourite
                                                  ? "favourite.svg"
                                                  : "un_favourite.svg",
                                              width: 16.h,
                                              height: 16.h)
                                          .paddingAll(7.h),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            getVerSpace(12.h),
                            getCustomFont(
                                modeltrending.name, 16.sp, Colors.black, 1,
                                fontWeight: FontWeight.w400),
                            getVerSpace(2.h),
                            Row(
                              children: [
                                Expanded(
                                  child: getCustomFont(modeltrending.price,
                                      14.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400),
                                ),
                                getSvgImage("star.svg",
                                    height: 16.h, width: 16.h),
                                getHorSpace(5.h),
                                getCustomFont(modeltrending.rating, 12.sp,
                                    Colors.black, 1,
                                    fontWeight: FontWeight.w400)
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              getVerSpace(50.h),
              getButton(context, buttonColor, "Add to cart", Colors.white, () {
                Constant.sendToNext(context, Routes.homeScreenRoute);
                homeController.onChange(2.obs);
              }, 18.sp,
                      weight: FontWeight.w600,
                      buttonHeight: 60.h,
                      borderRadius: BorderRadius.circular(22.h))
                  .marginSymmetric(horizontal: 20.h),
              getVerSpace(40.h)
            ],
          ),
        ),
      ),
    );
  }
}
