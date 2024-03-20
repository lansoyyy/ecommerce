import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

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
                "Add New Card",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomFont("Name", 16.sp, Colors.black, 1,
                          fontWeight: FontWeight.w400),
                      getUnderlineTextfiled(
                        context,
                        cardNameController,
                        "Name On Your Card",
                      ),
                      getVerSpace(30.h),
                      getCustomFont("Card Number", 16.sp, Colors.black, 1,
                          fontWeight: FontWeight.w400),
                      getUnderlineTextfiled(
                          context, cardNumberController, "Your Card Number",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CardNumberFormatter(),
                          ],
                          length: 19),
                      getVerSpace(30.h),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont("MM/YY", 16.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w400),
                                getUnderlineTextfiled(
                                  context,
                                  dateController,
                                  "Month/Year",
                                  onChanged: (value) {
                                    setState(() {
                                      value =
                                          value.replaceAll(RegExp(r"\D"), "");
                                      switch (value.length) {
                                        case 0:
                                          dateController.selection =
                                              const TextSelection.collapsed(
                                                  offset: 0);
                                          break;
                                        case 1:
                                          dateController.text = "$value/";
                                          dateController.selection =
                                              const TextSelection.collapsed(
                                                  offset: 1);
                                          break;
                                        case 2:
                                          dateController.text = "$value/";
                                          dateController.selection =
                                              const TextSelection.collapsed(
                                                  offset: 2);
                                          break;
                                        case 3:
                                          dateController.text =
                                              "${value.substring(0, 2)}/${value.substring(2)}";
                                          dateController.selection =
                                              const TextSelection.collapsed(
                                                  offset: 4);
                                          break;
                                        case 4:
                                          dateController.text =
                                              "${value.substring(0, 2)}/${value.substring(2, 4)}";
                                          dateController.selection =
                                              const TextSelection.collapsed(
                                                  offset: 5);
                                          break;
                                      }
                                      if (value.length > 4) {
                                        dateController.text =
                                            "${value.substring(0, 2)}/${value.substring(2, 4)}";
                                        dateController.selection =
                                            const TextSelection.collapsed(
                                                offset: 5);
                                      }
                                    });
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ],
                            ),
                          ),
                          getHorSpace(20.h),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont("CVV", 16.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w400),
                                getUnderlineTextfiled(
                                  context,
                                  cvvController,
                                  "Your CVV Number",
                                  length: 3,
                                  isPass: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      getVerSpace(20.h),
                      GetBuilder<PaymentController>(
                        init: PaymentController(),
                        builder: (controller) => Row(
                          children: [
                            GestureDetector(
                              child: getSvgImage(
                                  controller.save.value
                                      ? "check.svg"
                                      : "uncheck.svg",
                                  width: 24.h,
                                  height: 24.h),
                              onTap: () {
                                controller.saveChange();
                              },
                            ),
                            getHorSpace(8.h),
                            getCustomFont("Save Card", 12.sp, Colors.black, 1,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20.h)),
              getButton(context, buttonColor, "Add Card", Colors.white, () {
                backClick();
              },
                      18.sp,
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
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    // ignore: avoid_renaming_method_parameters
    TextEditingValue previousValue,
    // ignore: avoid_renaming_method_parameters
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
