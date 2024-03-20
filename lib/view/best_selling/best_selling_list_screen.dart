import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../model/best_sell_model.dart';
import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class BestSellingListScreen extends StatefulWidget {
  const BestSellingListScreen({Key? key}) : super(key: key);

  @override
  State<BestSellingListScreen> createState() => _BestSellingListScreenState();
}

class _BestSellingListScreenState extends State<BestSellingListScreen> {
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
                "Best Selling Products",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              buildBestSellingList()
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildBestSellingList() {
    return Expanded(
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          itemCount: controller.bestSellLists.length,
          primary: true,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            ModelBestSell modelBestSell = controller.bestSellLists[index];
            return GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.mostSellingDetailRoute);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.h),
                    boxShadow: [
                      BoxShadow(
                          color: "#1A3F3F3F".toColor(),
                          blurRadius: 32,
                          offset: const Offset(-2, 5))
                    ]),
                padding: EdgeInsets.only(
                    left: 8.h, bottom: 8.h, right: 12.h, top: 8.h),
                child: Row(
                  children: [
                    getAssetImage(modelBestSell.image,
                        width: 94.h, height: 106.h),
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
    );
  }
}
