import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/dataFile/data_file.dart';
import 'package:tailor_app/util/constant_widget.dart';

import '../../controller/controller.dart';
import '../../model/intro_model.dart';
import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/pref_data.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  backClick() {
    Constant.closeApp();
  }

  PageController pageController = PageController(initialPage: 0);
  IntroController introController = Get.put(IntroController());
  List<ModelIntro> introLists = DataFile.introList;

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
    Constant.setupSize(context);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<IntroController>(
            init: IntroController(),
            builder: (controller) => Stack(
              children: [
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: introLists[controller.position.value]
                          .color
                          .toColor()),
                  child: Stack(
                    children: [
                      getAssetImage(introLists[controller.position.value].image,
                              height: double.infinity,
                              width: double.infinity,
                              boxFit: BoxFit.fill)
                          .marginOnly(bottom: 253.h),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 320.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22.h)),
                              boxShadow: [
                                BoxShadow(
                                    color: "#26A92F45".toColor(),
                                    blurRadius: 47,
                                    offset: const Offset(1, 4))
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                        child: PageView.builder(
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return Column(
                          children: const [],
                        );
                      },
                      itemCount: introLists.length,
                      onPageChanged: (index) {
                        _onPageViewChange(index);
                      },
                    ))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    getCustomFont(introLists[controller.position.value].title,
                        26.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                    getVerSpace(8.h),
                    getMultilineCustomFont(
                        introLists[controller.position.value].discription,
                        16.sp,
                        Colors.black,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        txtHeight: 1.5.h),
                    getVerSpace(30.h),
                    GetBuilder<IntroController>(
                      init: IntroController(),
                      builder: (controller) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          introLists.length,
                          (position) {
                            return getSvgImage(
                                    position == controller.position.value
                                        ? "select_dot.svg"
                                        : "unselect_dot.svg",
                                    width: 8.h,
                                    height: 8.h)
                                .paddingOnly(
                                    left: position == 0 ? 0 : 4.h, right: 5.h);
                          },
                        ),
                      ),
                    ),
                    getVerSpace(20.h),
                    GetBuilder<IntroController>(
                      init: IntroController(),
                      builder: (controller) => getButton(
                          context, buttonColor, "Next ", Colors.white, () {
                        if (controller.position.value ==
                            introLists.length - 1) {
                          PrefData.setIsIntro(false);
                          Constant.sendToNext(context, Routes.loginRoute);
                        } else {
                          pageController
                              .jumpToPage(controller.position.value + 1);
                        }
                      }, 18.sp,
                          weight: FontWeight.w600,
                          borderRadius: BorderRadius.circular(22.h),
                          buttonHeight: 60.h),
                    ),
                    getVerSpace(40.h)
                  ],
                ).marginSymmetric(horizontal: 20.h),
                GestureDetector(
                  onTap: () {
                    PrefData.setIsIntro(false);
                    Constant.sendToNext(context, Routes.loginRoute);
                  },
                  child: getCustomFont("Skip", 16.sp, Colors.black, 1,
                          fontWeight: FontWeight.w600)
                      .marginOnly(top: 20.h, left: 20.h),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onPageViewChange(int page) {
    introController.onChange(page.obs);
  }
}
