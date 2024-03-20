import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/dataFile/data_file.dart';
import 'package:tailor_app/model/trending_model.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';

import '../../../model/most_sell_model.dart';
import '../../../model/shop_category_model.dart';
import '../../../util/constant.dart';
import '../../../util/constant_widget.dart';

class TabShop extends StatefulWidget {
  const TabShop({Key? key}) : super(key: key);

  @override
  State<TabShop> createState() => _TabShopState();
}

class _TabShopState extends State<TabShop> {
  void backClick() {
    Constant.closeApp();
  }

  TextEditingController searchController = TextEditingController();
  List<ModelShopCategory> shopCategoryLists = DataFile.shopCategoryList;
  ShopController shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getVerSpace(20.h),
        getAppBar(
          "Ready-Made Garments",
          () {
            backClick();
          },
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(30.h),
        Expanded(
            flex: 1,
            child: ListView(
              primary: true,
              shrinkWrap: false,
              children: [
                buildSearchWidget(context),
                getVerSpace(30.h),
                buildShopNowPoster(context),
                getVerSpace(20.h),
                buildCategoryList(),
                getVerSpace(30.h),
                buildTrendingList(context),
                getVerSpace(30.h),
                buildMostSellingList(context)
              ],
            ))
      ],
    );
  }

  Column buildMostSellingList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCustomFont("Most Selling Product", 18.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.5),
            GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.mostSellingListRoute);
              },
              child: getCustomFont("View All", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5),
            )
          ],
        ).paddingSymmetric(horizontal: 20.h),
        GetBuilder<ShopController>(
          init: ShopController(),
          builder: (controller) => SizedBox(
            height: 180.h,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
              itemCount: 2,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ModelMostSell modelMostSell = controller.mostSellLists[index];
                return GestureDetector(
                  onTap: () {
                    Constant.sendToNext(context, Routes.mostSellingDetailRoute);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? 20.h : 0, right: 20.h),
                    width: 340.h,
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
                                  getCustomFont(modelMostSell.rating, 12.sp,
                                      Colors.black, 1,
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
                            Container(
                              margin: EdgeInsets.only(right: 12.h, top: 12.h),
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
                                  controller.sellSelectChange(index);
                                },
                                child: getSvgImage(
                                        controller
                                                .mostSellLists[index].favourite
                                            ? "favourite.svg"
                                            : "un_favourite.svg",
                                        width: 16.h,
                                        height: 16.h)
                                    .paddingAll(7.h),
                              ),
                            ),
                            getCustomFont("(122/300)", 12.sp, hintColor, 1,
                                    fontWeight: FontWeight.w400)
                                .paddingOnly(right: 12.h, bottom: 15.h)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Column buildTrendingList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCustomFont("Trending Products", 18.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.5),
            GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.trendingProductListRoute);
              },
              child: getCustomFont("View All", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5),
            )
          ],
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(20.h),
        GetBuilder<ShopController>(
          init: ShopController(),
          builder: (controller) => SizedBox(
            height: 236.h,
            child: ListView.builder(
              itemCount: 2,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ModelTrending modeltrending =
                    controller.shoptrendingLists[index];
                return GestureDetector(
                  onTap: () {
                    Constant.sendToNext(context, Routes.mostSellingDetailRoute);
                  },
                  child: Container(
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
                                  image: AssetImage(Constant.assetImagePath +
                                      modeltrending.image),
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
                                          controller.shoptrendingLists[index]
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
                              child: getCustomFont(
                                  modeltrending.price, 14.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400),
                            ),
                            getSvgImage("star.svg", height: 16.h, width: 16.h),
                            getHorSpace(5.h),
                            getCustomFont(
                                modeltrending.rating, 12.sp, Colors.black, 1,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Column buildCategoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont("Categories", 18.sp, Colors.black, 1,
                fontWeight: FontWeight.w700)
            .paddingSymmetric(horizontal: 20.h),
        getVerSpace(20.h),
        SizedBox(
          height: 108.h,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: shopCategoryLists.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ModelShopCategory modelShopCategory = shopCategoryLists[index];
              return Container(
                margin:
                    EdgeInsets.only(left: index == 0 ? 20.h : 0, right: 20.h),
                width: 79.h,
                child: Column(
                  children: [
                    getAssetImage(modelShopCategory.image,
                        height: 79.h, width: 79.h),
                    getVerSpace(8.h),
                    getCustomFont(
                        modelShopCategory.name, 14.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400)
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container buildShopNowPoster(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      height: 147.h,
      padding: EdgeInsets.only(left: 30.h),
      decoration: BoxDecoration(
          color: "FBBCBC".toColor(),
          borderRadius: BorderRadius.circular(22.h),
          image: DecorationImage(
              image: AssetImage("${Constant.assetImagePath}bg_image.png"),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getCustomFont("Big Fashion Sale ", 16.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, textAlign: TextAlign.center),
          getVerSpace(16.h),
          getButton(
              context, buttonColor, "Shop Now", Colors.white, () {}, 14.sp,
              weight: FontWeight.w500,
              borderRadius: BorderRadius.circular(22.h),
              buttonHeight: 40.h,
              buttonWidth: 131.h)
        ],
      ),
    );
  }

  Widget buildSearchWidget(BuildContext context) {
    return getSearchTextField(context, "Search...", searchController,
            isEnable: false,
            height: 56.h,
            withprefix: true,
            image: "search.svg",
            withSufix: true,
            suffiximage: "filter_color.svg",
            isBorder: false)
        .marginSymmetric(horizontal: 20.h);
  }
}
