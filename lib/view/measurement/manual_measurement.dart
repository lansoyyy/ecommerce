import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/dialog/congratulation_dialog.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class ManualMeasurement extends StatefulWidget {
  const ManualMeasurement({Key? key}) : super(key: key);

  @override
  State<ManualMeasurement> createState() => _ManualMeasurementState();
}

class _ManualMeasurementState extends State<ManualMeasurement> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TextEditingController nameController = TextEditingController();
  MeasurementController controller = Get.put(MeasurementController());

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
              getAppBar("Manual Measurement", () {
                backClick();
              }).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              Expanded(
                  flex: 1,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    primary: true,
                    shrinkWrap: false,
                    children: [
                      getMultilineCustomFont(
                          "You can save your measurement permanently by logging in or becoming  a member",
                          16.sp,
                          Colors.black,
                          fontWeight: FontWeight.w400,
                          txtHeight: 1.5),
                      getVerSpace(30.h),
                      getDefaultTextFiledWithLabel(
                        context,
                        "Set your profile name",
                        nameController,
                        isEnable: false,
                        height: 56.h,
                      ),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Set category", text: false),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Shoulder", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Waist", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Hip", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Kameez Length", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Front Neck Depth", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Sleeve Length", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Salwar Length", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Around Thigh", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Calf", text: true),
                      getVerSpace(20.h),
                      getDropDownTextFiled("Bottom", text: true),
                      getVerSpace(40.h),
                      Row(
                        children: [
                          Expanded(
                              child: getButton(context, bgWhite, "Edit",
                                  buttonColor, () {}, 18.sp,
                                  weight: FontWeight.w600,
                                  borderRadius: BorderRadius.circular(22.h),
                                  buttonHeight: 60.h,
                                  isBorder: true,
                                  borderColor: buttonColor,
                                  borderWidth: 1.h)),
                          getHorSpace(20.h),
                          Expanded(
                              child: getButton(
                                  context, buttonColor, "Confirm", Colors.white,
                                  () {
                            Get.dialog(const CongratulationDialog());
                          }, 18.sp,
                                  weight: FontWeight.w600,
                                  borderRadius: BorderRadius.circular(22.h),
                                  buttonHeight: 60.h))
                        ],
                      ),
                      getVerSpace(40.h),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
