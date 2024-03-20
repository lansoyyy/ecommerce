import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/util/color_category.dart';
import 'package:tailor_app/util/constant.dart';

import '../../../util/constant_widget.dart';

class TabAlterOrder extends StatefulWidget {
  const TabAlterOrder({Key? key}) : super(key: key);

  @override
  State<TabAlterOrder> createState() => _TabAlterOrderState();
}

class _TabAlterOrderState extends State<TabAlterOrder> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getDropDownTextFiled("Set category", text: false, value: true),
        getVerSpace(20.h),
        getMultiLineTextField(context, "Write your message", messageController,
            isEnable: false, minLines: true),
        getVerSpace(20.h),
        buildProductDetail()
      ],
    ).paddingSymmetric(horizontal: 20.h);
  }

  Container buildProductDetail() {
    return Container(
      padding: EdgeInsets.all(12.h),
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
        children: [
          Row(
            children: [
              Container(
                height: 90.h,
                width: 90.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.h),
                  image: DecorationImage(
                      image: AssetImage(
                          '${Constant.assetImagePath}product_image.png'),
                      fit: BoxFit.fill),
                ),
              ),
              getHorSpace(12.h),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont("Ballon Sleeve Kurti", 18.sp, Colors.black, 1,
                      fontWeight: FontWeight.w700, txtHeight: 1.5),
                  getVerSpace(8.h),
                  getCustomFont(
                      "Cotton Fabric:20-40 GSM", 14.sp, Colors.black, 1,
                      fontWeight: FontWeight.w400, txtHeight: 1.5)
                ],
              ))
            ],
          ),
          getVerSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Stitching Cost :", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5),
              getCustomFont("\$20", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5)
            ],
          ),
          getVerSpace(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Fabric Cost :", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5),
              getCustomFont("\$08", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5)
            ],
          ),
          getVerSpace(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Subtotal :", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5),
              getCustomFont("\$28", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5)
            ],
          ),
          getVerSpace(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Delivery Charge :", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5),
              getCustomFont("\$02", 14.sp, Colors.black, 1,
                  fontWeight: FontWeight.w400, txtHeight: 1.5)
            ],
          ),
          getVerSpace(12.h),
          getDivider(setColor: lightBorder),
          getVerSpace(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Total", 18.sp, buttonColor, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5),
              getCustomFont("\$30.00", 18.sp, buttonColor, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5)
            ],
          )
        ],
      ),
    );
  }
}
