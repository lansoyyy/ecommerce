import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/pref_data.dart';

import '../../../util/constant.dart';
import '../../../util/constant_widget.dart';

class TabAccount extends StatefulWidget {
  const TabAccount({Key? key}) : super(key: key);

  @override
  State<TabAccount> createState() => _TabAccountState();
}

class _TabAccountState extends State<TabAccount> {
  void backClick() {
    Constant.closeApp();
  }

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgColor);
    return Container(
      color: const Color(0XFFFFCFCF),
      child: Column(
        children: [
          getVerSpace(20.h),
          getAppBar(
            "",
            () {
              backClick();
            },
          ).paddingSymmetric(horizontal: 20.h),
          getVerSpace(63.h),
          Expanded(
            child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.h),
                            topLeft: Radius.circular(20.h)),
                        color: const Color(0XFFFFFFFF)),
                  ),
                  Positioned.fill(
                    top: -43.h,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 157.h),
                          height: 100.h,
                          width: 100.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.h)),
                          child: getAssetImage("profile_photo.png",
                              boxFit: BoxFit.cover),
                        ),
                        getVerSpace(20.h),
                        getCustomFont(
                            "Ronald Richards", 18.sp, const Color(0XFF000000), 1,
                            fontWeight: FontWeight.w700),
                        getVerSpace(6.h),
                        getCustomFont("Allentown, New Mexico", 14.sp,
                            const Color(0XFF7E7E7E), 1,
                            fontWeight: FontWeight.w400),
                        getVerSpace(30.h),
                        GetBuilder<HomeController>(
                          init: HomeController(),
                          builder: (controller) => Expanded(
                            child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: 20.h),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                getProfileWidget(
                                    "profile_icon.png", "My Profile", () {
                                  Constant.sendToNext(
                                      context, Routes.myProfileScreenRoute);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget("setting_icon.png", "Settings",
                                    () {
                                  Constant.sendToNext(
                                      context, Routes.settingScreenRoute);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget(
                                    "notification_icon.png", "Notification",
                                    () {
                                  Constant.sendToNext(
                                      context, Routes.notificationScreenRoute);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget("measurement_icon.png",
                                    "Measurements Profile", () {
                                  Constant.sendToNext(
                                      context, Routes.measurementProfileRoute);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget(
                                    "order_icon.png", "Order History", () {
                                  Constant.sendToNext(
                                      context, Routes.orderHistoryRoute);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget("cart_icon.png", "Cart", () {
                                  controller.onChange(2.obs);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget(
                                    "favourite_icon.png", "Favourite", () {
                                  Constant.sendToNext(
                                      context, Routes.favouriteRoute);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget(
                                    "help_icon.png", "Help & Support", () {
                                  Constant.sendToNext(
                                      context, Routes.helpScreenRoute);
                                }),
                                getVerSpace(20.h),
                                getProfileWidget("privacy_icon.png",
                                    "Privacy Policy", () {
                                      Constant.sendToNext(
                                          context, Routes.privacyRoute);
                                    }),
                                getVerSpace(20.h),
                                getProfileWidget("logout_icon.png", "Logout",
                                    () {
                                  PrefData.setIsSignIn(true);
                                  Constant.sendToNext(
                                      context, Routes.loginRoute);
                                }),
                                getVerSpace(60.h),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
