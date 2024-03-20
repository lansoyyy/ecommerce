import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tailor_app/controller/controller.dart';
import 'package:tailor_app/util/color_category.dart';

import 'constant.dart';

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getDropDownTextFiled(String hint,
    {bool text = false, bool value = false}) {
  return GetBuilder<MeasurementController>(
    init: MeasurementController(),
    builder: (controller) => SizedBox(
      height: 56.h,
      child: DropdownButtonFormField(
        value: value ? controller.categoryList[0] : null,
        isExpanded: true,
        icon: text
            ? getCustomFont("00 In", 14.sp, hintColor, 1,
                fontWeight: FontWeight.w400)
            : const SizedBox(),
        hint: getCustomFont(hint, 16.sp, hintColor, 1,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            filled: true,
            isDense: true,
            suffixIcon: Container(
              padding: EdgeInsets.only(right: 20.h, top: 20.h, bottom: 20.h),
              child: getSvgImage("arrow-down.svg", width: 16.h, height: 16.h),
            ),
            fillColor: fieldBg,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h))),
        items: controller.categoryList.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                getCustomFont(e, 16.sp, Colors.black, 1,
                    fontWeight: FontWeight.w400),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? value) {},
      ),
    ),
  );
}

Widget getDropDownWithItem(String hint,
    {bool text = false, String? value, List<DropdownMenuItem<String>>? item}) {
  return SizedBox(
    height: 56.h,
    child: DropdownButtonFormField(
      value: value,
      isExpanded: true,
      icon: text
          ? getCustomFont("00 In", 14.sp, hintColor, 1,
              fontWeight: FontWeight.w400)
          : const SizedBox(),
      hint:
          getCustomFont(hint, 16.sp, hintColor, 1, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          filled: true,
          isDense: true,
          suffixIcon: Container(
            padding: EdgeInsets.only(right: 20.h, top: 20.h, bottom: 20.h),
            child: getSvgImage("arrow-down.svg", width: 16.h, height: 16.h),
          ),
          fillColor: fieldBg,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: borderColor, width: 1.h)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: borderColor, width: 1.h)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: borderColor, width: 1.h)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: borderColor, width: 1.h))),
      // items: controller.categoryList.map((e) {
      //   return DropdownMenuItem(
      //     value: e,
      //     child: Row(
      //       children: [
      //         getCustomFont(e, 16.sp, Colors.black, 1,
      //             fontWeight: FontWeight.w400),
      //       ],
      //     ),
      //   );
      // }).toList(),
      items: item,
      onChanged: (value) {},
    ),
  );
}


Widget getDropDownWithItemCustomRound(String hint,
    {bool text = false, String? value, List<DropdownMenuItem<String>>? item}) {
  return SizedBox(
    height: 56.h,
    child: DropdownButtonFormField(
      value: value,
      isExpanded: true,
      icon: text
          ? getCustomFont("00 In", 14.sp, hintColor, 1,
          fontWeight: FontWeight.w400)
          : const SizedBox(),
      hint:
      getCustomFont(hint, 16.sp, hintColor, 1, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          filled: true,
          isDense: true,
          suffixIcon: Container(
            padding: EdgeInsets.only(right: 20.h, top: 20.h, bottom: 20.h),
            child: getSvgImage("arrow-down.svg", width: 16.h, height: 16.h),
          ),
          fillColor: fieldBg,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.h),
              borderSide: BorderSide(color: borderColor, width: 1.h)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.h),
              borderSide: BorderSide(color: borderColor, width: 1.h)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.h),
              borderSide: BorderSide(color: borderColor, width: 1.h)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.h),
              borderSide: BorderSide(color: borderColor, width: 1.h))),
      // items: controller.categoryList.map((e) {
      //   return DropdownMenuItem(
      //     value: e,
      //     child: Row(
      //       children: [
      //         getCustomFont(e, 16.sp, Colors.black, 1,
      //             fontWeight: FontWeight.w400),
      //       ],
      //     ),
      //   );
      // }).toList(),
      items: item,
      onChanged: (value) {},
    ),
  );
}

getMeasurementWidget(String title,String subtitle,String time) {
  return  Container(
    height: 90.h,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.h),
        boxShadow: [
          BoxShadow(
              color: "#12000000".toColor(),
              offset: const Offset(0, 6),
              blurRadius: 23)
        ]),
    child: Padding(
      padding: EdgeInsets.only(right: 20.w,left: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getAssetImage("scanner_icon.png",height: 50,width: 50),
            ],
          ),
          //getHorSpace(20.w),
          Padding(
            padding:  EdgeInsets.only(right: 100.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont(title, 15, const Color(0XFF000000),1,fontWeight: FontWeight.w400),
                getVerSpace(4.h),
                getCustomFont(subtitle, 12, const Color(0XFF7E7E7E),1,fontWeight: FontWeight.w400),
                getVerSpace(4.h),
                getCustomFont(time, 12, const Color(0XFF7E7E7E),1,fontWeight: FontWeight.w400)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 12.h,left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                getAssetImage("More_dot_verticle.png",height: 20.h,width: 20.w)
              ],
            ),
          )
        ],
      ),
    ),
  );
}

getProfileWidget(String image, String title, Function function) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.h),
          boxShadow: [
            BoxShadow(
                color: "#12000000".toColor(),
                offset: const Offset(0, 6),
                blurRadius: 23)
          ]),
      child: Row(
        children: [
          getAssetImage(image, width: 40.h, height: 40.h),
          getHorSpace(12.h),
          Expanded(
            child: getCustomFont(title, 16.sp, Colors.black, 1,
                fontWeight: FontWeight.w400),
          ),
          getSvgImage("arrow_right.svg", height: 16.h, width: 16.h)
        ],
      ),
    ),
  );
}


Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getUnderlineTextfiled(
    BuildContext context, TextEditingController controller, String hint,
    {bool isPass = false,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool isEnable = true,
    bool isReadonly = false,
    int? length,
    ValueChanged<String>? onChanged,
    isdense = true}) {
  return TextFormField(
    onChanged: onChanged,
    enabled: isEnable,
    readOnly: isReadonly,
    validator: validator,
    obscureText: isPass,
    controller: controller,
    maxLength: length,
    style: TextStyle(
        color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      counterText: "",
      hintText: hint,
      hintStyle: TextStyle(
          color: textHintColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1.h),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1.h),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: buttonColor, width: 1.h),
      ),
      isDense: isdense,
    ),
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
  );
}

Widget getRichText(
    String firstText,
    Color firstColor,
    FontWeight firstWeight,
    double firstSize,
    String secondText,
    Color secondColor,
    FontWeight secondWeight,
    double secondSize,
    String thirdText,
    Color thirdColor,
    FontWeight thirdWeight,
    double thirdSize,
    {TextAlign textAlign = TextAlign.center,
    double? txtHeight}) {
  return RichText(
    textAlign: textAlign,
    text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: firstColor,
          fontWeight: firstWeight,
          fontFamily: Constant.fontsFamily,
          fontSize: firstSize,
          height: txtHeight,
        ),
        children: [
          TextSpan(
              text: secondText,
              style: TextStyle(
                  color: secondColor,
                  fontWeight: secondWeight,
                  fontFamily: Constant.fontsFamily,
                  fontSize: secondSize,
                  height: txtHeight)),
          TextSpan(
              text: thirdText,
              style: TextStyle(
                color: thirdColor,
                fontWeight: thirdWeight,
                fontFamily: Constant.fontsFamily,
                fontSize: thirdSize,
                height: txtHeight,
              ))
        ]),
  );
}

Widget getTwoRichText(
    String firstText,
    Color firstColor,
    FontWeight firstWeight,
    double firstSize,
    String secondText,
    Color secondColor,
    FontWeight secondWeight,
    double secondSize,
    {TextAlign textAlign = TextAlign.center,
    double? txtHeight,
    Function? function}) {
  return RichText(
    textAlign: textAlign,
    text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: firstColor,
          fontWeight: firstWeight,
          fontFamily: Constant.fontsFamily,
          fontSize: firstSize,
          height: txtHeight,
        ),
        children: [
          TextSpan(
              text: secondText,
              style: TextStyle(
                  color: secondColor,
                  fontWeight: secondWeight,
                  fontFamily: Constant.fontsFamily,
                  fontSize: secondSize,
                  height: txtHeight),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  function!();
                }),
        ]),
  );
}

Widget getButton(BuildContext context, Color bgColor, String text,
    Color textColor, Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    bool isIcon = false,
    String? image,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        bgColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon)
              ? getSvgImage(image!, width: 24.h, height: 24.h)
              : getHorSpace(0),
          (isIcon) ? getHorSpace(20.h) : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center,
              fontWeight: weight,
              fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

BoxDecoration getButtonDecoration(Color bgColor,
    {BorderRadius? borderRadius,
    Border? border,
    List<BoxShadow> shadow = const [],
    DecorationImage? image}) {
  return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadow,
      image: image);
}

Widget getDivider(
    {double dividerHeight = 0,
    Color setColor = Colors.grey,
    double endIndent = 0,
    double indent = 0,
    double thickness = 1}) {
  return Divider(
    height: dividerHeight.h,
    color: setColor,
    endIndent: endIndent.w,
    indent: indent.w,
    thickness: thickness,
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget getDefaultTextFiledWithLabel(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    FocusNode? focus1,
    TextInputType? keyboardType}) {
  FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;
  Color color = borderColor;

  return StatefulBuilder(
    builder: (context, setState) {
      return Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              myFocusNode.canRequestFocus = true;
              color = buttonColor;
            });
          } else {
            setState(() {
              myFocusNode.canRequestFocus = false;
              color = borderColor;
            });
          }
        },
        focusNode: myFocusNode,
        child: Container(
          height: height,
          margin: margin,
          decoration: BoxDecoration(
              color: fieldBg,
              border: Border.all(color: color, width: 1.h),
              borderRadius: BorderRadius.circular(22.h)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (!withprefix)
                  ? getHorSpace(12.h)
                  : Padding(
                      padding: EdgeInsets.only(right: 18.h, left: 16.h),
                      child: getSvgImage(image!, height: 24.h, width: 24.h),
                    ),
              Expanded(
                flex: 1,
                child: TextField(
                  keyboardType: keyboardType,
                  enabled: true,
                  inputFormatters: inputFormatters,
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  obscureText: isPass,
                  showCursor: false,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontFamily: Constant.fontsFamily),
                  decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          color: hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: Constant.fontsFamily)),
                ),
              ),
              (!withSufix)
                  ? getHorSpace(12.h)
                  : Padding(
                      padding: EdgeInsets.only(right: 16.h, left: 18.h),
                      child: InkWell(
                        onTap: () {
                          if (imagefunction != null) {
                            imagefunction();
                          }
                        },
                        child: getSvgImage(suffiximage!,
                            height: 24.h, width: 24.h),
                      ),
                    ),
            ],
          ),
        ),
      );
    },
  );
}

Widget getMultiLineTextField(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    FocusNode? focus1,
    TextInputType? keyboardType}) {
  FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;

  return StatefulBuilder(
    builder: (context, setState) {
      return Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              myFocusNode.canRequestFocus = true;
            });
          } else {
            setState(() {
              myFocusNode.canRequestFocus = false;
            });
          }
        },
        focusNode: myFocusNode,
        child: TextField(
          keyboardType: keyboardType,
          enabled: true,
          inputFormatters: inputFormatters,
          maxLines: (minLines) ? 5 : 1,
          controller: textEditingController,
          obscuringCharacter: "*",
          autofocus: false,
          obscureText: isPass,
          showCursor: false,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              fontFamily: Constant.fontsFamily),
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: fieldBg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h),
              ),
              hintText: s,
              hintStyle: TextStyle(
                  color: hintColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontFamily: Constant.fontsFamily)),
        ),
      );
    },
  );
}

Widget getSearchTextField(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    String? suffiximage,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    FocusNode? focus1,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
    bool isBorder = true}) {
  FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;
  Color color = borderColor;

  return StatefulBuilder(
    builder: (context, setState) {
      return Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              myFocusNode.canRequestFocus = true;
              color = buttonColor;
            });
          } else {
            setState(() {
              myFocusNode.canRequestFocus = false;
              color = borderColor;
            });
          }
        },
        focusNode: myFocusNode,
        child: Container(
          height: height,
          margin: margin,
          decoration: BoxDecoration(
              color: Colors.white,
              border: isBorder ? Border.all(color: color, width: 1.h) : null,
              boxShadow: !isBorder
                  ? [
                      BoxShadow(
                          color: "#12000000".toColor(),
                          blurRadius: 23,
                          offset: const Offset(0, 6))
                    ]
                  : null,
              borderRadius: BorderRadius.circular(22.h)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (!withprefix)
                  ? getHorSpace(12.h)
                  : Padding(
                      padding: EdgeInsets.only(right: 18.h, left: 16.h),
                      child: getSvgImage(image!, height: 24.h, width: 24.h),
                    ),
              Expanded(
                flex: 1,
                child: TextField(
                  keyboardType: keyboardType,
                  enabled: true,
                  inputFormatters: inputFormatters,
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  obscureText: isPass,
                  showCursor: false,
                  onChanged: onChanged,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontFamily: Constant.fontsFamily),
                  decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          color: "#A5A4AA".toColor(),
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: Constant.fontsFamily)),
                ),
              ),
              (!withSufix)
                  ? getHorSpace(12.h)
                  : Padding(
                      padding: EdgeInsets.only(right: 16.h, left: 18.h),
                      child: InkWell(
                        onTap: () {
                          if (imagefunction != null) {
                            imagefunction();
                          }
                        },
                        child: getSvgImage(suffiximage!,
                            height: 24.h, width: 24.h),
                      ),
                    ),
            ],
          ),
        ),
      );
    },
  );
}

Widget getAppBar(String title, Function function,
    {bool suffix = false, Widget? suffixIcon}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
              onTap: () {
                function();
              },
              child: getSvgImage("arrow_left.svg", height: 24.h, width: 24.h))),
      getCustomFont(title, 22.sp, Colors.black, 1, fontWeight: FontWeight.w700),
      suffix
          ? Align(alignment: Alignment.centerRight, child: suffixIcon!)
          : const SizedBox()
    ],
  );
}

Widget getPhoneTextField(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    double? height,
    double? imageHeight,
    double? imageWidth,
    Widget? image,
    String? suffiximage,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    FocusNode? focus1,
    TextInputType? keyboardType}) {
  FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;
  Color color = borderColor;

  return StatefulBuilder(
    builder: (context, setState) {
      return Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              myFocusNode.canRequestFocus = true;
              color = buttonColor;
            });
          } else {
            setState(() {
              myFocusNode.canRequestFocus = false;
              color = borderColor;
            });
          }
        },
        focusNode: myFocusNode,
        child: Container(
          height: height,
          margin: margin,
          decoration: BoxDecoration(
              color: fieldBg,
              border: Border.all(color: color, width: 1.h),
              borderRadius: BorderRadius.circular(22.h)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (!withprefix)
                  ? getHorSpace(12.h)
                  : Padding(
                      padding: EdgeInsets.only(right: 18.h, left: 16.h),
                      child: image,
                    ),
              Expanded(
                flex: 1,
                child: TextField(
                  keyboardType: keyboardType,
                  enabled: true,
                  inputFormatters: inputFormatters,
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  obscureText: isPass,
                  showCursor: false,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontFamily: Constant.fontsFamily),
                  decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          color: hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: Constant.fontsFamily)),
                ),
              ),
              (!withSufix)
                  ? getHorSpace(12.h)
                  : Padding(
                      padding: EdgeInsets.only(right: 16.h, left: 18.h),
                      child: InkWell(
                        onTap: () {
                          if (imagefunction != null) {
                            imagefunction();
                          }
                        },
                        child: getSvgImage(suffiximage!,
                            height: 24.h, width: 24.h),
                      ),
                    ),
            ],
          ),
        ),
      );
    },
  );
}
