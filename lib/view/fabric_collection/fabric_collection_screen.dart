import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/routes/app_routes.dart';
import 'package:tailor_app/util/constant_widget.dart';

import '../../dataFile/data_file.dart';
import '../../model/fabric_model.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/device_util.dart';

class FabricCollectionScreen extends StatefulWidget {
  const FabricCollectionScreen({Key? key}) : super(key: key);

  @override
  State<FabricCollectionScreen> createState() => _FabricCollectionScreenState();
}

class _FabricCollectionScreenState extends State<FabricCollectionScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  List<ModelFabric> fabricLists = DataFile.fabricList;

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
              getAppBar("Fabric Collection", () {
                backClick();
              },
                  suffix: true,
                  suffixIcon: GestureDetector(
                    onTap: (){
                      Constant.sendToNext(context, Routes.uploadFabricRoute);
                    },
                    child: Container(
                      height: 34.h,
                      width: 34.h,
                      decoration: BoxDecoration(
                          color: "#FFE7E7".toColor(),
                          borderRadius: BorderRadius.circular(10.h)),
                      padding: EdgeInsets.all(5.h),
                      child: getSvgImage("add.svg", height: 24.h, width: 24.h),
                    ),
                  )).paddingSymmetric(horizontal: 20.h),
              getVerSpace(30.h),
              buildFabricList()
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildFabricList() {
    var height = 173.h;
    var margin = 20.h;
    var crossAxisCount = DeviceUtil.isTablet ? 4 : 2;
    var screenWidth =
        ((context.width - (margin * crossAxisCount)) / crossAxisCount) - margin;

    return Expanded(
        child: GridView.builder(
          itemCount: fabricLists.length,
          shrinkWrap: false,
          primary: true,
          padding: EdgeInsets.symmetric(horizontal: 20.h),
      itemBuilder: (context, index) {
        ModelFabric modelFabric = fabricLists[index];
        return GestureDetector(
          onTap: (){
            Constant.sendToNext(context, Routes.fabricDetailRoute);
          },
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(6.h),
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.h),
                      image: DecorationImage(
                          image: AssetImage(
                              Constant.assetImagePath + modelFabric.image),
                          fit: BoxFit.fill)),
                ).paddingSymmetric(horizontal: 6.h),
                getVerSpace(8.h),
                getCustomFont(modelFabric.name, 16.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5)
                    .paddingSymmetric(horizontal: 12.h),
                getVerSpace(2.h),
                getCustomFont(modelFabric.price, 14.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400, txtHeight: 1.5)
                    .paddingSymmetric(horizontal: 12.h)
              ],
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: margin,
        childAspectRatio: screenWidth / height,
        crossAxisSpacing: margin,
      ),
    ));
  }
}
