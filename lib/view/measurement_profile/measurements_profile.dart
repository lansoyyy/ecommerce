import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/color_category.dart';

import '../../../util/constant_widget.dart';
import '../../util/constant.dart';

class MeasurementsProfile extends StatefulWidget {
  const MeasurementsProfile({Key? key}) : super(key: key);

  @override
  State<MeasurementsProfile> createState() => _MeasurementsProfileState();
}

class _MeasurementsProfileState extends State<MeasurementsProfile> {
  void backClick() {
    Constant.backToPrev(context);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerSpace(20.h),
              getAppBar(
                "Measurements Profile",
                () {
                  backClick();
                },
              ),
              getVerSpace(30.h),
              Expanded(
                child: ListView(
                  children: [
                    getCustomFont("Changes do not runnings orders", 16,
                        const Color(0XFF000000), 1,
                        fontWeight: FontWeight.w400),
                    getVerSpace(30.h),
                    getMeasurementWidget("Jenny Wilson", "Measured via AR",
                        "Last update 12 days ago"),
                    getVerSpace(30.h),
                    getMeasurementWidget("Jenny Wilson", "Measured via AR",
                        "Last update 12 days ago"),
                    getVerSpace(30.h),
                    getMeasurementWidget("Jenny Wilson", "Measured via AR",
                        "Last update 12 days ago"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 44.h),
                child: getButton(context, buttonColor,
                    "Create New Measurements", const Color(0XFFFFFFFF), () {
                  Constant.sendToNext(context, Routes.giveMeasurementScreenRoute);
                    }, 18.sp,
                    weight: FontWeight.w600,
                    buttonHeight: 60.h,
                    borderRadius: BorderRadius.circular(22.h)),
              )
            ],
          ),
        )),
      ),
    );
  }
}
