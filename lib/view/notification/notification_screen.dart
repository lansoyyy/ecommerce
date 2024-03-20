import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/dataFile/data_file.dart';

import '../../model/notification_day_model.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  List<ModelNotificationDay> notificationLists = DataFile.notificationList;

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
                "Notifications",
                () {
                  backClick();
                },
              ),
              getVerSpace(30.h),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: notificationLists.length,
                    primary: true,
                    shrinkWrap: false,
                    itemBuilder: (context, index) {
                      ModelNotificationDay modelNotificationDay =
                          notificationLists[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont(
                              modelNotificationDay.day, 14.sp, hintColor, 1,
                              fontWeight: FontWeight.w500),
                          getVerSpace(20.h),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  getAssetImage(
                                      modelNotificationDay
                                          .notificationList[index].image,
                                      width: 60.h,
                                      height: 60.h),
                                  getHorSpace(20.h),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        getMultilineCustomFont(
                                            modelNotificationDay
                                                .notificationList[index]
                                                .discription,
                                            16.sp,
                                            Colors.black,
                                            fontWeight: FontWeight.w400),
                                        getVerSpace(5.h),
                                        getCustomFont(
                                            modelNotificationDay
                                                .notificationList[index].time,
                                            14.sp,
                                            hintColor,
                                            1,
                                            fontWeight: FontWeight.w400)
                                      ],
                                    ),
                                  )
                                ],
                              ).marginOnly(bottom: 20.h);
                            },
                            itemCount:
                                modelNotificationDay.notificationList.length,
                            primary: false,
                            shrinkWrap: true,
                          ),
                          index == notificationLists.length - 1
                              ? const SizedBox()
                              : getDivider(setColor: borderColor)
                        ],
                      ).marginOnly(bottom: 20.h);
                    },
                  ))
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }
}
