import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/dataFile/data_file.dart';
import 'package:tailor_app/routes/app_routes.dart';

import '../../model/order_model.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TextEditingController orderIdController = TextEditingController();
  List<String> orderStatus = ["Success", "Faild"];
  List<ModelOrder> orderLists = DataFile.orderList;

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
                "Order History",
                () {
                  backClick();
                },
              ),
              getVerSpace(30.h),
              Row(
                children: [
                  Expanded(
                    child: getDefaultTextFiledWithLabel(
                      context,
                      "Enter Order ID",
                      orderIdController,
                      isEnable: false,
                      height: 56.h,
                    ),
                  ),
                  getHorSpace(20.h),
                  Expanded(
                    child: getDropDownWithItemCustomRound("Order Status",
                        text: false,
                        item: orderStatus.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                getCustomFont(e, 16.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
              getVerSpace(30.h),
              Expanded(
                child: ListView.builder(
                  primary: true,
                  itemCount: orderLists.length,
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    ModelOrder modelOrder = orderLists[index];
                    return GestureDetector(
                      onTap: (){
                        Constant.sendToNext(context, Routes.orderDetailRoute);
                      },
                      child: Container(
                        height: 120.h,
                        margin: EdgeInsets.only(bottom: 20.h),
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
                          children: [
                            getAssetImage(modelOrder.image,
                                height: 120.h, width: 120.h, boxFit: BoxFit.fill),
                            getHorSpace(12.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  getCustomFont(
                                      modelOrder.name, 16.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w700),
                                  getVerSpace(4.h),
                                  getCustomFont(
                                      modelOrder.id, 12.sp, hintColor, 1,
                                      fontWeight: FontWeight.w400),
                                  getVerSpace(4.h),
                                  getCustomFont(
                                      modelOrder.date, 12.sp, hintColor, 1,
                                      fontWeight: FontWeight.w400)
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont(
                                        modelOrder.price, 16.sp, Colors.black, 1,
                                        fontWeight: FontWeight.w700)
                                    .paddingOnly(top: 12.h, right: 12.h),
                                getCustomFont(
                                        "View Details", 12.sp, buttonColor, 1,
                                        fontWeight: FontWeight.w400)
                                    .paddingOnly(bottom: 12.h, right: 12.h),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }
}
