import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailor_app/view/alteration/tab/tab_alter_order.dart';
import 'package:tailor_app/view/alteration/tab/tab_alter_product.dart';

import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';

class AlterationScreen extends StatefulWidget {
  const AlterationScreen({Key? key}) : super(key: key);

  @override
  State<AlterationScreen> createState() => _AlterationScreenState();
}

class _AlterationScreenState extends State<AlterationScreen>
    with TickerProviderStateMixin {
  void backClick() {
    Constant.backToPrev(context);
  }

  late TabController _tabController;
  late PageController _pController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pController = PageController();
    super.initState();
  }

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
                "Alteration",
                () {
                  backClick();
                },
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(40.h),
              buildTabBar(),
              getVerSpace(30.h),
              buildPageView(),
              getButton(context, buttonColor, "Alter It", Colors.white, () {
                backClick();
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

  Widget buildTabBar() {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: "#D9D9D9".toColor(), width: 1.h),
            ),
          ),
        ),
        TabBar(
          controller: _tabController,
          labelColor: buttonColor,
          unselectedLabelColor: hintColor,
          indicatorColor: buttonColor,
          indicatorWeight: 3.h,
          labelPadding: EdgeInsets.only(bottom: 8.h),
          labelStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontFamily: Constant.fontsFamily,
              height: 1.5),
          unselectedLabelStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontsFamily,
              height: 1.5),
          tabs: const <Widget>[
            Tab(
              text: "Alter Your Product",
            ),
            Tab(
              text: "Alter Your Order",
            ),
          ],
          onTap: (value) {
            _pController.animateToPage(value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        ),
      ],
    ).paddingSymmetric(horizontal: 20.h);
  }

  Expanded buildPageView() {
    return Expanded(
      flex: 1,
      child: PageView(
        controller: _pController,
        onPageChanged: (value) {
          _tabController.animateTo(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        children: const [TabAlterProduct(), TabAlterOrder()],
      ),
    );
  }
}
