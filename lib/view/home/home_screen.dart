import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/view/home/tab/tab_account.dart';
import 'package:tailor_app/view/home/tab/tab_cart.dart';
import 'package:tailor_app/view/home/tab/tab_home.dart';
import 'package:tailor_app/view/home/tab/tab_shop.dart';

import '../../controller/controller.dart';
import '../../dataFile/data_file.dart';
import '../../model/bottom_model.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void backClick() {
    Constant.closeApp();
  }

  HomeController controller = Get.put(HomeController());
  List<ModelBottom> bottomLists = DataFile.bottomList;
  MyCartController myCartController = Get.put(MyCartController());

  static final List<Widget> _widgetOptions = <Widget>[
    const TabHome(),
    const TabShop(),
    const TabCart(),
    const TabAccount()
  ];

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgWhite);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
          backgroundColor: bgWhite,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: buildBottomnavigation(controller),
          body: SafeArea(
            child: GetX<HomeController>(
              init: HomeController(),
              builder: (controller) => _widgetOptions[controller.index.value],
            ),
          ),
        ),
      ),
    );
  }

  Container buildBottomnavigation(HomeController controller) {
    return Container(
      height: 66.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22.h)),
          boxShadow: [
            BoxShadow(
                color: "#126B5050".toColor(),
                offset: const Offset(-4, -5),
                blurRadius: 14.h)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(bottomLists.length, (index) {
          ModelBottom modelBottom = bottomLists[index];
          return GestureDetector(
            onTap: () {
              controller.onChange(index.obs);
              myCartController.onFalse();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getSvgImage(
                    controller.index.value == index
                        ? modelBottom.selectIcon
                        : modelBottom.icon,
                    height: 24.h,
                    width: 24.h),
                getVerSpace(2.h),
                controller.index.value == index
                    ? getCustomFont(modelBottom.name, 12.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                    : getVerSpace(18.h)
              ],
            ),
          );
        }),
      ).paddingSymmetric(horizontal: 30.h),
    );
  }
}
