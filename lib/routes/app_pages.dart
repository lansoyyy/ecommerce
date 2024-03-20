import 'package:flutter/material.dart';
import 'package:tailor_app/view/alteration/alteration_screen.dart';
import 'package:tailor_app/view/best_selling/best_selling_list_screen.dart';
import 'package:tailor_app/view/cart/add_card_screen.dart';
import 'package:tailor_app/view/cart/cart_screen.dart';
import 'package:tailor_app/view/cart/checkout_screen.dart';
import 'package:tailor_app/view/cart/payment_screen.dart';
import 'package:tailor_app/view/customize_clothes/customize_clothes_screen.dart';
import 'package:tailor_app/view/fabric_collection/fabric_collection_screen.dart';
import 'package:tailor_app/view/fabric_collection/fabric_detail.dart';
import 'package:tailor_app/view/fabric_collection/upload_fabric.dart';
import 'package:tailor_app/view/favourite/favourite_screen.dart';
import 'package:tailor_app/view/home/home_screen.dart';
import 'package:tailor_app/view/intro/intro_screen.dart';
import 'package:tailor_app/view/login/forgot_screen.dart';
import 'package:tailor_app/view/login/login_screen.dart';
import 'package:tailor_app/view/login/reset_screen.dart';
import 'package:tailor_app/view/measurement/ar_measurement.dart';
import 'package:tailor_app/view/measurement/give_measurement_screen.dart';
import 'package:tailor_app/view/measurement/home_measurement.dart';
import 'package:tailor_app/view/measurement/manual_measurement.dart';
import 'package:tailor_app/view/most_selling/most_selling_detail.dart';
import 'package:tailor_app/view/most_selling/most_selling_list.dart';
import 'package:tailor_app/view/notification/notification_screen.dart';
import 'package:tailor_app/view/order/order_detail_screen.dart';
import 'package:tailor_app/view/order/order_history.dart';
import 'package:tailor_app/view/profile/edit_profile_screen.dart';
import 'package:tailor_app/view/profile/help_screen.dart';
import 'package:tailor_app/view/profile/my_profile_screen.dart';
import 'package:tailor_app/view/profile/privacy_screen.dart';
import 'package:tailor_app/view/setting/setting_screen.dart';
import 'package:tailor_app/view/sign_up/sign_up_screen.dart';
import 'package:tailor_app/view/sign_up/verify_screen.dart';
import 'package:tailor_app/view/trending_product/trending_product_list.dart';

import '../splash_screen.dart';
import '../view/measurement_profile/measurements_profile.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.homeRoute: (context) => const SplashScreen(),
    Routes.introRoute: (context) => const IntroScreen(),
    Routes.loginRoute: (context) => const LoginScreen(),
    Routes.homeScreenRoute: (context) => const HomeScreen(),
    Routes.forgotScreenRoute: (context) => const ForgotScreen(),
    Routes.resetScreenRoute: (context) => const ResetScreen(),
    Routes.signUpScreenRoute: (context) => const SignUpScreen(),
    Routes.verifyScreenRoute: (context) => const VerifyScreen(),
    Routes.giveMeasurementScreenRoute: (context) =>
        const GiveMeasurementScreen(),
    Routes.homeMeasurementRoute: (context) => const HomeMeasurement(),
    Routes.arMeasurementRoute: (context) => const ArMeasurement(),
    Routes.manualMeasurementRoute: (context) => const ManualMeasurement(),
    Routes.fabricCollectionRoute: (context) => const FabricCollectionScreen(),
    Routes.uploadFabricRoute: (context) => const UploadFabric(),
    Routes.alterationRoute: (context) => const AlterationScreen(),
    Routes.customizeClothRoute: (context) => const CustomizeClotheScreen(),
    Routes.cartScreenRoute: (context) => const CartScreen(),
    Routes.checkoutScreenRoute: (context) => const CheckoutScreen(),
    Routes.paymentScreenRoute: (context) => const PaymentScreen(),
    Routes.addCardScreenRoute: (context) => const AddCardScreen(),
    Routes.bestSellingListRoute: (context) => const BestSellingListScreen(),
    Routes.trendingProductListRoute: (context) => const TrendingProductList(),
    Routes.mostSellingListRoute: (context) => const MostSellingList(),
    Routes.mostSellingDetailRoute: (context) => const MostSellingDetail(),
    Routes.myProfileScreenRoute: (context) => const MyProfileScreen(),
    Routes.editProfileScreenRoute: (context) => const EditProfileScreen(),
    Routes.settingScreenRoute: (context) => const SettingScreen(),
    Routes.notificationScreenRoute: (context) => const NotificationScreen(),
    Routes.orderDetailRoute: (context) => const OrderDetail(),
    Routes.orderHistoryRoute: (context) => const OrderHistory(),
    Routes.favouriteRoute: (context) => const FavouriteScreen(),
    Routes.measurementProfileRoute: (context) => const MeasurementsProfile(),
    Routes.helpScreenRoute: (context) => const HelpScreen(),
    Routes.privacyRoute: (context) => const PrivacyScreen(),
    Routes.fabricDetailRoute: (context) => const FabricDetail()
  };
}
