import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/routes/app_routes.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';
import '../../util/device_util.dart';

class UploadFabric extends StatefulWidget {
  const UploadFabric({Key? key}) : super(key: key);

  @override
  State<UploadFabric> createState() => _UploadFabricState();
}

class _UploadFabricState extends State<UploadFabric> {
  void backClick() {
    Constant.backToPrev(context);
  }

  FabricController controller = Get.put(FabricController());

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
          child: GetBuilder<FabricController>(
            init: FabricController(),
            builder: (controller) => Column(
              children: [
                getVerSpace(20.h),
                getAppBar(
                  "Upload Your Fabric",
                  () {
                    backClick();
                  },
                ),
                getVerSpace(30.h),
                buildUploadWidget(controller),
                getVerSpace(30.h),
                buildUploadImageList(),
                getButton(context, buttonColor, "Confirm", Colors.white, () {
                  Constant.sendToNext(context, Routes.homeScreenRoute);
                }, 18.sp,
                    weight: FontWeight.w600,
                    buttonHeight: 60.h,
                    borderRadius: BorderRadius.circular(22.h)),
                getVerSpace(40.h)
              ],
            ).paddingSymmetric(horizontal: 20.h),
          ),
        ),
      ),
    );
  }

  Container buildUploadWidget(FabricController controller) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          color: fieldBg,
          borderRadius: BorderRadius.circular(22.h),
          border: Border.all(color: borderColor, width: 1.h)),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.h),
                  boxShadow: [
                    BoxShadow(
                        color: "#121A2947".toColor(),
                        blurRadius: 24,
                        offset: const Offset(-3, 9))
                  ]),
              child: getSvgImage("black_add.svg", width: 30.h, height: 30.h)
                  .paddingAll(25.h),
            ),
            onTap: () {
              controller.getImage();
            },
          ),
          getHorSpace(20.h),
          getCustomFont("Upload Image", 16.sp, Colors.black, 1,
              fontWeight: FontWeight.w400)
        ],
      ),
    );
  }

  Expanded buildUploadImageList() {
    var height = 198.h;
    var margin = 20.h;
    var crossAxisCount = DeviceUtil.isTablet ? 4 : 2;
    var screenWidth =
        ((context.width - (margin * crossAxisCount)) / crossAxisCount) - margin;
    return Expanded(
        child: GetBuilder<FabricController>(
      init: FabricController(),
      builder: (controller) => GridView.builder(
        itemCount: controller.uploadFabricList.length,
        primary: true,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.h),
                image: DecorationImage(
                    image: FileImage(File(controller.uploadFabricList[index])),
                    fit: BoxFit.fill)),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: margin,
          childAspectRatio: screenWidth / height,
          crossAxisSpacing: margin,
        ),
      ),
    ));
  }
}
