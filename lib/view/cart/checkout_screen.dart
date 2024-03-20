import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../model/cart_model.dart';
import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  CartController controller = Get.put(CartController());

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
                "Checkout",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              Expanded(
                child: GetBuilder<CartController>(
                  init: CartController(),
                  builder: (controller) => ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    primary: true,
                    shrinkWrap: false,
                    children: [
                      buildShippingDetail(),
                      getVerSpace(20.h),
                      buildProductDetail(controller),
                      getVerSpace(10.h),
                      buildPriceSummary(),
                    ],
                  ),
                ),
              ),
              getButton(context, buttonColor, "Go to Payment", Colors.white,
                      () {
                Constant.sendToNext(context, Routes.paymentScreenRoute);
              }, 18.sp,
                      weight: FontWeight.w600,
                      borderRadius: BorderRadius.circular(22.h),
                      buttonHeight: 60.h)
                  .marginSymmetric(horizontal: 20.h),
              getVerSpace(40.h)
            ],
          ),
        ),
      ),
    );
  }

  Column buildPriceSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont("Subtotal:", 16.sp, Colors.black, 1,
                fontWeight: FontWeight.w400, txtHeight: 1.5),
            getCustomFont("\$34.00", 16.sp, Colors.black, 1,
                fontWeight: FontWeight.w400, txtHeight: 1.5)
          ],
        ),
        getVerSpace(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont("Delivery Charge:", 16.sp, Colors.black, 1,
                fontWeight: FontWeight.w400, txtHeight: 1.5),
            getCustomFont("\$05.00", 16.sp, Colors.black, 1,
                fontWeight: FontWeight.w400, txtHeight: 1.5)
          ],
        ),
        getVerSpace(20.h),
        getDivider(setColor: borderColor),
        getVerSpace(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont("Total", 18.sp, buttonColor, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.5),
            getCustomFont("\$39.00", 18.sp, buttonColor, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.5)
          ],
        )
      ],
    );
  }

  Column buildProductDetail(CartController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont("Order Summery", 16.sp, hintColor, 1,
            fontWeight: FontWeight.w400, txtHeight: 1.5),
        getVerSpace(12.h),
        ListView.builder(
          itemBuilder: (context, index) {
            ModelCart modelCart = controller.cartLists[index];
            return Container(
              height: 132.h,
              padding: EdgeInsets.only(
                  top: 8.h, right: 20.h, bottom: 8.h, left: 8.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.h),
                  boxShadow: [
                    BoxShadow(
                        color: "#12000000".toColor(),
                        blurRadius: 23,
                        offset: const Offset(0, 6))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      getAssetImage(modelCart.image,
                          width: 116.h, height: 116.h),
                      getHorSpace(20.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomFont(modelCart.name, 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w700, txtHeight: 1.5),
                          getVerSpace(4.h),
                          getCustomFont(
                              modelCart.fabric, 14.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400, txtHeight: 1.5),
                          getVerSpace(6.h),
                          getCustomFont(modelCart.price, 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400, txtHeight: 1.5)
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getSvgImage("trash.svg", height: 20.h, width: 20.h),
                      Row(
                        children: [
                          getCustomFont("-", 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400),
                          getHorSpace(14.h),
                          getCustomFont(modelCart.quantity.toString(), 16.sp,
                              Colors.black, 1,
                              fontWeight: FontWeight.w400),
                          getHorSpace(14.h),
                          getCustomFont("+", 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w400)
                        ],
                      )
                    ],
                  ).paddingSymmetric(vertical: 12.h)
                ],
              ),
            ).marginOnly(bottom: 20.h);
          },
          itemCount: controller.cartLists.length,
          primary: false,
          shrinkWrap: true,
        ),
      ],
    );
  }

  Column buildShippingDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont("Shipping Address", 16.sp, hintColor, 1,
            fontWeight: FontWeight.w400, txtHeight: 1.5),
        getVerSpace(12.h),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.h),
              boxShadow: [
                BoxShadow(
                    color: "#12000000".toColor(),
                    blurRadius: 23,
                    offset: const Offset(0, 6))
              ]),
          padding: EdgeInsets.all(14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      getSvgImage("profile.svg", width: 20.h, height: 20.h),
                      getHorSpace(14.h),
                      getCustomFont("Jenny Wilson", 14.sp, Colors.black, 1,
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                  getVerSpace(12.h),
                  Row(
                    children: [
                      getSvgImage("location.svg", width: 20.h, height: 20.h),
                      getHorSpace(14.h),
                      getMultilineCustomFont(
                          "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                          14.sp,
                          Colors.black,
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                  getVerSpace(12.h),
                  Row(
                    children: [
                      getSvgImage("call.svg", width: 20.h, height: 20.h),
                      getHorSpace(14.h),
                      getCustomFont("(302) 555-0107", 14.sp, Colors.black, 1,
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                ],
              ),
              getCustomFont("Edit", 14.sp, buttonColor, 1,
                  fontWeight: FontWeight.w600)
            ],
          ),
        ),
      ],
    );
  }
}
