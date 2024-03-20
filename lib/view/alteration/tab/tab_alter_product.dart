import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';

import '../../../util/color_category.dart';
import '../../../util/constant_widget.dart';

class TabAlterProduct extends StatefulWidget {
  const TabAlterProduct({Key? key}) : super(key: key);

  @override
  State<TabAlterProduct> createState() => _TabAlterProductState();
}

class _TabAlterProductState extends State<TabAlterProduct> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlterationController>(
      init: AlterationController(),
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getDropDownTextFiled("Set category", text: false),
          getVerSpace(30.h),
          buildAttachImage(controller),
          getVerSpace(20.h),
          getMultiLineTextField(
              context, "Write your message", messageController,
              isEnable: false, minLines: true),
        ],
      ).paddingSymmetric(horizontal: 20.h),
    );
  }

  Column buildAttachImage(AlterationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont("Attach your product image", 15.sp, Colors.black, 1,
            fontWeight: FontWeight.w500, txtHeight: 1.5),
        getVerSpace(20.h),
        Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
              color: fieldBg,
              borderRadius: BorderRadius.circular(22.h),
              border: Border.all(color: borderColor, width: 1.h)),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  height: 90.h,
                  width: 90.h,
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
                      .paddingAll(30.h),
                ),
                onTap: () {
                  controller.getImage();
                },
              ),
              getHorSpace(12.h),
              Expanded(
                child: SizedBox(
                  height: 90.h,
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.productList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.topRight,
                        width: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.h),
                            image: DecorationImage(
                                image: FileImage(
                                    File(controller.productList[index])),
                                fit: BoxFit.fill)),
                        padding: EdgeInsets.only(right: 8.h, top: 8.h),
                        child: GestureDetector(
                          onTap: () {
                            controller.onRemove(index);
                          },
                          child: Container(
                            height: 24.h,
                            width: 24.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: "#121A2947".toColor(),
                                      blurRadius: 24.h,
                                      offset: const Offset(-3, 9))
                                ]),
                            padding: EdgeInsets.all(4.h),
                            child: getSvgImage("trash.svg",
                                width: 16.h, height: 16.h),
                          ),
                        ),
                      ).marginOnly(right: 12.h);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
