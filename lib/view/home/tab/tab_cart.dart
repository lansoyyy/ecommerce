import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/dataFile/data_file.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';

import '../../../model/my_cart_model.dart';
import '../../../util/constant.dart';
import '../../../util/constant_widget.dart';

class TabCart extends StatefulWidget {
  const TabCart({Key? key}) : super(key: key);

  @override
  State<TabCart> createState() => _TabCartState();
}

class _TabCartState extends State<TabCart> {
  void backClick() {
    Constant.closeApp();
  }

  List<ModelMyCart> myCartLists = DataFile.myCartList;
  MyCartController controller = Get.put(MyCartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
      init: MyCartController(),
      builder: (controller) => Column(
        children: [
          getVerSpace(20.h),
          getAppBar(
            "My Cart",
            () {
              backClick();
            },
          ),
          getVerSpace(30.h),
          !controller.list.value
              ? Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getAssetImage("empty_cart.png",
                        width: 140.h, height: 140.h),
                    getVerSpace(30.h),
                    getCustomFont("Your cart is empty", 22.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700),
                    getVerSpace(30.h),
                    getButton(context, bgWhite, "Explore Now", buttonColor, () {
                      controller.onChange();
                    }, 18.sp,
                        weight: FontWeight.w600,
                        buttonHeight: 60.h,
                        isBorder: true,
                        borderRadius: BorderRadius.circular(22.h),
                        borderWidth: 1.h,
                        borderColor: buttonColor,
                        buttonWidth: 250.w)
                  ],
                ))
              : buildCartList()
        ],
      ).paddingSymmetric(horizontal: 20.h),
    );
  }

  Expanded buildCartList() {
    return Expanded(
        child: ListView.builder(
      itemCount: myCartLists.length,
      primary: true,
      shrinkWrap: false,
      itemBuilder: (context, index) {
        ModelMyCart modelMyCart = myCartLists[index];
        return GestureDetector(
          onTap: () {
            Constant.sendToNext(context, Routes.cartScreenRoute);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.h),
                boxShadow: [
                  BoxShadow(
                      color: "#12000000".toColor(),
                      blurRadius: 23,
                      offset:
                      const Offset(0, 6))
                ]),
            padding: EdgeInsets.all(8.h),
            child: Row(
              children: [
                getAssetImage(modelMyCart.image,
                    height: 116.h, width: 116.h, boxFit: BoxFit.fill),
                getHorSpace(20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont(modelMyCart.name, 16.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700),
                    getVerSpace(4.h),
                    getCustomFont(modelMyCart.fabric, 14.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400),
                    getVerSpace(6.h),
                    getCustomFont(modelMyCart.price, 16.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400)
                  ],
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
