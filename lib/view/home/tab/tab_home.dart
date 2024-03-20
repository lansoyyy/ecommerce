import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/dataFile/data_file.dart';
import 'package:tailor_app/model/best_sell_model.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/constant.dart';
import 'package:tailor_app/util/constant_widget.dart';

import '../../../model/category_model.dart';
import '../../../model/fabric_model.dart';
import '../../../util/device_util.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  TextEditingController searchController = TextEditingController();
  List<ModelCategory> categoryLists = DataFile.categoryList;
  List<ModelFabric> fabricLists = DataFile.fabricList;
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getVerSpace(20.h),
        buildAppBar(),
        getVerSpace(30.h),
        Expanded(
            flex: 1,
            child: ListView(
              primary: true,
              shrinkWrap: false,
              children: [
                buildSearchWidget(context),
                getVerSpace(37.h),
                buildCategoryList(),
                buildFabricList(),
                buildBestSellingList()
              ],
            ))
      ],
    );
  }

  Column buildBestSellingList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont("Best Selling Products", 20.sp, Colors.black, 1,
                fontWeight: FontWeight.w700),
            GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.bestSellingListRoute);
              },
              child: getCustomFont("View All", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400),
            )
          ],
        ).paddingSymmetric(horizontal: 20.h),
        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => SizedBox(
            height: 172.h,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
              itemCount: 3,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ModelBestSell modelBestSell = controller.bestSellLists[index];
                return GestureDetector(
                  onTap: () {
                    Constant.sendToNext(context, Routes.mostSellingDetailRoute);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? 20.h : 0, right: 20.h),
                    width: 311.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.h),
                        boxShadow: [
                          BoxShadow(
                              color: "#1A3F3F3F".toColor(),
                              blurRadius: 32,
                              offset: const Offset(-2, 5))
                        ]),
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Row(
                      children: [
                        getAssetImage(modelBestSell.image, width: 94.h),
                        getHorSpace(12.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getCustomFont(
                                  modelBestSell.name, 16.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w700, txtHeight: 1.5),
                              getVerSpace(4.h),
                              getCustomFont(
                                  modelBestSell.price, 16.sp, Colors.black, 1,
                                  fontWeight: FontWeight.w400, txtHeight: 1.5),
                              getVerSpace(9.h),
                              Row(
                                children: [
                                  getSvgImage("star.svg",
                                      width: 16.h, height: 16.h),
                                  getHorSpace(5.h),
                                  getCustomFont("5.4", 12.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400)
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 30.h,
                              width: 30.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.h),
                                  boxShadow: [
                                    BoxShadow(
                                        color: "#12000000".toColor(),
                                        offset: const Offset(0, 6),
                                        blurRadius: 23)
                                  ]),
                              padding: EdgeInsets.all(7.h),
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectChange(index);
                                },
                                child: getSvgImage(
                                    modelBestSell.select
                                        ? "favourite.svg"
                                        : "un_favourite.svg",
                                    height: 16.h,
                                    width: 16.h),
                              ),
                            ),
                            getVerSpace(42.h),
                            getCustomFont(
                                "${modelBestSell.view}/${modelBestSell.totalView}",
                                12.sp,
                                hintColor,
                                1,
                                fontWeight: FontWeight.w400)
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

  Column buildFabricList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont("Our Fabric Collection", 20.sp, Colors.black, 1,
                fontWeight: FontWeight.w700),
            GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.fabricCollectionRoute);
              },
              child: getCustomFont("View All", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400),
            )
          ],
        ).paddingSymmetric(horizontal: 20.h),
        SizedBox(
          height: 223.h,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
            itemCount: 3,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ModelFabric modelFabric = fabricLists[index];
              return GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.fabricDetailRoute);
                },
                child: Container(
                  width: 177.h,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getVerSpace(6.h),
                      Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.h),
                            image: DecorationImage(
                                image: AssetImage(Constant.assetImagePath +
                                    modelFabric.image),
                                fit: BoxFit.fill)),
                      ).paddingSymmetric(horizontal: 6.h),
                      getVerSpace(8.h),
                      getCustomFont(modelFabric.name, 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w700, txtHeight: 1.5)
                          .paddingSymmetric(horizontal: 12.h),
                      getVerSpace(2.h),
                      getCustomFont(modelFabric.price, 14.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400, txtHeight: 1.5)
                          .paddingSymmetric(horizontal: 12.h)
                    ],
                  ),
                ).marginOnly(left: index == 0 ? 20.h : 0, right: 20.h),
              );
            },
          ),
        )
      ],
    );
  }

  GridView buildCategoryList() {
    var height = 118.h;
    var margin = 12.h;
    var crossAxisCount = DeviceUtil.isTablet ? 5 : 3;
    var screenWidth =
        ((context.width - (margin * crossAxisCount)) / crossAxisCount) - margin;

    return GridView.builder(
      padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 30.h),
      primary: false,
      shrinkWrap: true,
      itemCount: categoryLists.length,
      itemBuilder: (context, index) {
        ModelCategory modelCategory = categoryLists[index];
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              Constant.sendToNext(context, Routes.giveMeasurementScreenRoute);
            } else if (index == 1) {
              Constant.sendToNext(context, Routes.fabricCollectionRoute);
            } else if (index == 2) {
              Constant.sendToNext(context, Routes.alterationRoute);
            } else if (index == 3) {
              Constant.sendToNext(context, Routes.customizeClothRoute);
            } else if (index == 4) {
              Constant.sendToNext(context, Routes.bestSellingListRoute);
            }
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 101.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.h),
                    boxShadow: [
                      BoxShadow(
                          color: "#1A3F3F3F".toColor(),
                          blurRadius: 32,
                          offset: const Offset(-2, 5))
                    ]),
                alignment: Alignment.bottomCenter,
                child: getCustomFont(modelCategory.name, 14.sp, Colors.black, 2,
                        fontWeight: FontWeight.w600,
                        txtHeight: 1.5.h,
                        textAlign: TextAlign.center)
                    .paddingOnly(right: 15.h, left: 15.h, bottom: 12.h),
              ),
              Positioned(
                height: 56.h,
                width: 56.h,
                bottom: 62.h,
                child: Container(
                  padding: EdgeInsets.all(13.h),
                  decoration: BoxDecoration(
                    color: modelCategory.color.toColor(),
                    borderRadius: BorderRadius.circular(22.h),
                  ),
                  child: getSvgImage(modelCategory.image,
                      height: 30.h, width: 30.h),
                ),
              )
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20.h,
        childAspectRatio: screenWidth / height,
        crossAxisSpacing: margin,
      ),
    );
  }

  Container buildSearchWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      height: 170.h,
      decoration: BoxDecoration(
          color: "#F3C7CE".toColor(),
          borderRadius: BorderRadius.circular(22.h),
          image: DecorationImage(
              image: AssetImage("${Constant.assetImagePath}search_image.png"),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          getSearchTextField(context, "Search...", searchController,
                  isEnable: false,
                  height: 56.h,
                  withprefix: true,
                  image: "search.svg",
                  withSufix: true,
                  suffiximage: "filter.svg",
                  isBorder: false)
              .paddingOnly(left: 20.h, right: 20.h, bottom: 13.h),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.notificationScreenRoute);
              },
              child: Container(
                height: 46.h,
                width: 46.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.h),
                    boxShadow: [
                      BoxShadow(
                          color: "#1A3F3F3F".toColor(),
                          blurRadius: 32,
                          offset: const Offset(-2, 5))
                    ]),
                child:
                    getSvgImage("notification.svg", width: 24.h, height: 24.h)
                        .paddingAll(11.h),
              ),
            ),
            getHorSpace(20.h),
            GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.myProfileScreenRoute);
                },
                child: getAssetImage("profile_image.png",
                    height: 46.h, width: 46.h))
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 20.h);
  }
}
