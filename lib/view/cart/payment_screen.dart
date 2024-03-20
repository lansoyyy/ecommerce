import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/dataFile/data_file.dart';
import 'package:tailor_app/routes/app_routes.dart';

import '../../dialog/confirm_dialog.dart';
import '../../model/payment_model.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  List<ModelPayment> paymentLists = DataFile.paymentLists;
  PaymentController controller = Get.put(PaymentController());

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
                "Payment",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              buildCardList(),
              GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.addCardScreenRoute);
                },
                child: getCustomFont("+ Add New Card", 16.sp, Colors.black, 1,
                    fontWeight: FontWeight.w400),
              ),
              getVerSpace(30.h),
              getButton(context, buttonColor, "Confirm Payment", Colors.white,
                      () {
                Get.dialog(const ConfirmDialog());
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

  Expanded buildCardList() {
    return Expanded(
        flex: 1,
        child: GetBuilder<PaymentController>(
          init: PaymentController(),
          builder: (controller) => ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            primary: true,
            shrinkWrap: false,
            itemCount: paymentLists.length,
            itemBuilder: (context, index) {
              ModelPayment modelPayment = paymentLists[index];
              return Container(
                padding: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.h),
                    boxShadow: [
                      BoxShadow(
                          color: "#121A2947".toColor(),
                          blurRadius: 24,
                          offset: const Offset(-3, 9))
                    ]),
                child: Row(
                  children: [
                    getAssetImage(modelPayment.image,
                        height: 46.h, width: 46.h),
                    getHorSpace(16.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont(
                              modelPayment.name, 16.sp, Colors.black, 1,
                              fontWeight: FontWeight.w700),
                          Visibility(
                            visible: modelPayment.number == "" ? false : true,
                            child: Column(
                              children: [
                                getVerSpace(6.h),
                                getCustomFont(
                                    modelPayment.number, 14.sp, hintColor, 1,
                                    fontWeight: FontWeight.w400)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.change(index);
                      },
                      child: getSvgImage(
                          // ignore: unrelated_type_equality_checks
                          controller.select == index
                              ? "pay_radio.svg"
                              : "pay_un_radio.svg",
                          width: 24.h,
                          height: 24.h),
                    )
                  ],
                ),
              ).marginOnly(bottom: 20.h);
            },
          ),
        ));
  }
}
