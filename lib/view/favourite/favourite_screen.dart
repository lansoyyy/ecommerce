import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/model/most_sell_model.dart';
import 'package:tailor_app/routes/app_routes.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  FavouriteController controller = Get.put(FavouriteController());
  HomeController homeController = Get.put(HomeController());

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
                "Favourite",
                () {
                  backClick();
                },
              ),
              getVerSpace(30.h),
              buildFavouriteList(),
              getButton(context, buttonColor, "Add all to cart", Colors.white,
                  () {
                Constant.sendToNext(context, Routes.homeScreenRoute);
                homeController.onChange(2.obs);
              }, 18.sp,
                  weight: FontWeight.w600,
                  buttonHeight: 60.h,
                  borderRadius: BorderRadius.circular(22.h)),
              getVerSpace(40.h)
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }

  GetBuilder<FavouriteController> buildFavouriteList() {
    return GetBuilder<FavouriteController>(
      init: FavouriteController(),
      builder: (controller) => Expanded(
          flex: 1,
          child: ListView.builder(
            primary: true,
            shrinkWrap: false,
            itemCount: controller.favourite.length,
            itemBuilder: (context, index) {
              ModelMostSell modelMostSell = controller.favourite[index];
              return Container(
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
                          borderRadius: BorderRadius.circular(22.h)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          getAssetImage(modelMostSell.image, height: 111.h)
                        ],
                      ),
                    ),
                    getHorSpace(12.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomFont(
                              modelMostSell.name, 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(4.h),
                          getCustomFont(
                              modelMostSell.price, 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400),
                          getVerSpace(9.h),
                          Row(
                            children: [
                              getSvgImage("star.svg",
                                  height: 16.h, width: 16.h),
                              getHorSpace(5.h),
                              getCustomFont(
                                  modelMostSell.rating, 12.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: "#12000000".toColor(),
                                      blurRadius: 23,
                                      offset: const Offset(0, 6))
                                ]),
                            padding: EdgeInsets.all(7.h),
                            child: getSvgImage("trash.svg",
                                width: 16.h, height: 16.h),
                          ).paddingOnly(top: 12.h, right: 12.h),
                          onTap: () {
                            controller.onRemove(index);
                          },
                        ),
                        getCustomFont("(122/300)", 12.sp, hintColor, 1,
                                fontWeight: FontWeight.w400)
                            .paddingOnly(right: 12.h, bottom: 15.h)
                      ],
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
