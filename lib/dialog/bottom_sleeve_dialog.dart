import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/constant_widget.dart';

class BottomSleeveDialog extends StatefulWidget {
  const BottomSleeveDialog({Key? key}) : super(key: key);

  @override
  State<BottomSleeveDialog> createState() => _BottomSleeveDialogState();
}

class _BottomSleeveDialogState extends State<BottomSleeveDialog> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(22.h))),
          child: Column(
            children: [
              getVerSpace(30.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 137.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.h),
                          boxShadow: [
                            BoxShadow(
                                color: "#12000000".toColor(),
                                blurRadius: 23,
                                offset: const Offset(0, 6))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getSvgImage("s_sleeve.svg",
                              height: 67.h, width: 67.h),
                          getVerSpace(8.h),
                          getCustomFont("Short Sleeves", 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400, txtHeight: 1.5)
                        ],
                      ),
                    ),
                  ),
                  getHorSpace(20.h),
                  Expanded(
                    child: Container(
                      height: 137.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.h),
                          boxShadow: [
                            BoxShadow(
                                color: "#12000000".toColor(),
                                blurRadius: 23,
                                offset: const Offset(0, 6))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getSvgImage("l_sleeve.svg",
                              height: 67.h, width: 67.h),
                          getVerSpace(8.h),
                          getCustomFont("Long Sleeves", 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400, txtHeight: 1.5)
                        ],
                      ),
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 30.h),
              getVerSpace(30.h),
              Row(
                children: [
                  Expanded(
                    child: getButton(context, Colors.white, "Upload Design",
                        buttonColor, () {}, 18.sp,
                        weight: FontWeight.w600,
                        buttonHeight: 60.h,
                        isBorder: true,
                        borderColor: buttonColor,
                        borderRadius: BorderRadius.circular(22.h),
                        borderWidth: 1.h),
                  ),
                  getHorSpace(20.h),
                  Expanded(
                    child: getButton(
                      context,
                      buttonColor,
                      "Call Tailor",
                      Colors.white,
                      () {},
                      18.sp,
                      weight: FontWeight.w600,
                      buttonHeight: 60.h,
                      borderRadius: BorderRadius.circular(22.h),
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(40.h)
            ],
          ),
        )
      ],
    );
  }
}
