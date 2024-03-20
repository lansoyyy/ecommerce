import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/model/trending_model.dart';

import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';
import '../../util/device_util.dart';

class TrendingProductList extends StatefulWidget {
  const TrendingProductList({Key? key}) : super(key: key);

  @override
  State<TrendingProductList> createState() => _TrendingProductListState();
}

class _TrendingProductListState extends State<TrendingProductList> {
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
                "Trending Products",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              buildTrendingList()
            ],
          ),
        ),
      ),
    );
  }

  GetBuilder<ShopController> buildTrendingList() {
    var height = 236.h;
    var margin = 20.h;
    var crossAxisCount = DeviceUtil.isTablet ? 4 : 2;
    var screenWidth =
        ((context.width - (margin * crossAxisCount)) / crossAxisCount) - margin;
    return GetBuilder<ShopController>(
      init: ShopController(),
      builder: (controller) => Expanded(
          child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        itemCount: controller.shoptrendingLists.length,
        itemBuilder: (context, index) {
          ModelTrending modelTrending = controller.shoptrendingLists[index];
          return GestureDetector(
            onTap: (){
              Constant.sendToNext(
                  context, Routes.mostSellingDetailRoute);
            },
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
                              Constant.assetImagePath + modelTrending.image),
                          fit: BoxFit.fill)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8.h, top: 8.h),
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
                        child: GestureDetector(
                          onTap: () {
                            controller.selectChange(index);
                          },
                          child: getSvgImage(
                                  controller.shoptrendingLists[index].favourite
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
                getCustomFont(modelTrending.name, 16.sp, Colors.black, 1,
                    fontWeight: FontWeight.w400),
                getVerSpace(2.h),
                Row(
                  children: [
                    Expanded(
                      child: getCustomFont(
                          modelTrending.price, 14.sp, Colors.black, 1,
                          fontWeight: FontWeight.w400),
                    ),
                    getSvgImage("star.svg", height: 16.h, width: 16.h),
                    getHorSpace(5.h),
                    getCustomFont(modelTrending.rating, 12.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400)
                  ],
                ),
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: screenWidth / height,
          crossAxisSpacing: margin,
        ),
      )),
    );
  }
}
