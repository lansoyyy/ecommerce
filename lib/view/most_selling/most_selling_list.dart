import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';

import '../../model/most_sell_model.dart';
import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class MostSellingList extends StatefulWidget {
  const MostSellingList({Key? key}) : super(key: key);

  @override
  State<MostSellingList> createState() => _MostSellingListState();
}

class _MostSellingListState extends State<MostSellingList> {
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
                "Most Selling Product",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              GetBuilder<ShopController>(
                init: ShopController(),
                builder: (controller) => Expanded(
                    flex: 1,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      primary: true,
                      shrinkWrap: false,
                      itemCount: controller.mostSellLists.length,
                      itemBuilder: (context, index) {
                        ModelMostSell modelMostSell =
                            controller.mostSellLists[index];
                        return GestureDetector(
                          onTap: () {
                            Constant.sendToNext(
                                context, Routes.mostSellingDetailRoute);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            height: 120.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: "#12000000".toColor(),
                                      blurRadius: 23,
                                      offset: const Offset(0, 6))
                                ]),
                            child: Row(
                              children: [
                                Container(
                                  width: 120.h,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                      color: modelMostSell.color.toColor(),
                                      borderRadius:
                                          BorderRadius.circular(22.h)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      getAssetImage(modelMostSell.image,
                                          height: 111.h)
                                    ],
                                  ),
                                ),
                                getHorSpace(12.h),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      getCustomFont(modelMostSell.name, 16.sp,
                                          Colors.black, 1,
                                          fontWeight: FontWeight.w700),
                                      getVerSpace(4.h),
                                      getCustomFont(modelMostSell.price, 16.sp,
                                          Colors.black, 1,
                                          fontWeight: FontWeight.w400),
                                      getVerSpace(9.h),
                                      Row(
                                        children: [
                                          getSvgImage("star.svg",
                                              height: 16.h, width: 16.h),
                                          getHorSpace(5.h),
                                          getCustomFont(modelMostSell.rating,
                                              12.sp, Colors.black, 1,
                                              fontWeight: FontWeight.w400)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: 12.h, top: 12.h),
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
                                          controller.sellSelectChange(index);
                                        },
                                        child: getSvgImage(
                                                controller.mostSellLists[index]
                                                        .favourite
                                                    ? "favourite.svg"
                                                    : "un_favourite.svg",
                                                width: 16.h,
                                                height: 16.h)
                                            .paddingAll(7.h),
                                      ),
                                    ),
                                    getCustomFont(
                                            "(122/300)", 12.sp, hintColor, 1,
                                            fontWeight: FontWeight.w400)
                                        .paddingOnly(right: 12.h, bottom: 15.h)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
