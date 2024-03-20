import 'package:tailor_app/model/bottom_model.dart';
import 'package:tailor_app/model/category_model.dart';
import 'package:tailor_app/model/fabric_model.dart';
import 'package:tailor_app/model/my_cart_model.dart';
import 'package:tailor_app/model/notification_day_model.dart';
import 'package:tailor_app/model/notification_model.dart';
import 'package:tailor_app/model/order_model.dart';
import 'package:tailor_app/model/payment_model.dart';
import 'package:tailor_app/model/shop_category_model.dart';

import '../model/best_sell_model.dart';
import '../model/cart_model.dart';
import '../model/intro_model.dart';
import '../model/most_sell_model.dart';
import '../model/trending_model.dart';

class DataFile {
  static List<ModelIntro> introList = [
    ModelIntro(
        "intro1.png",
        "Customize your clothes",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        "#FDF1F3"),
    ModelIntro(
        "intro2.png",
        "Alter your clothes",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        "#EBF2FA"),
    ModelIntro(
        "intro3.png",
        "Get messured via AR ",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        "#EEECFF")
  ];

  static List<ModelBottom> bottomList = [
    ModelBottom("home.svg", "home_bold.svg", "Home"),
    ModelBottom("shop.svg", "shop_bold.svg", "Shop"),
    ModelBottom("cart.svg", "cart_bold.svg", "Cart"),
    ModelBottom("account.svg", "account_bold.svg", "Account")
  ];

  static List<ModelCategory> categoryList = [
    ModelCategory("category1.svg", '#F9F5D2', "Give Measurement"),
    ModelCategory("category2.svg", "#FFEEF6", "Fabric Collection"),
    ModelCategory("category3.svg", "#DAF9FF", "Alter Your Clothes"),
    ModelCategory("category4.svg", "#E0F6E2", "Customize Your Clothes"),
    ModelCategory("category5.svg", "#F7EEFF", "Tailor Made Clothes"),
    ModelCategory("category6.svg", "#FFE9E9", "More")
  ];

  static List<ModelFabric> fabricList = [
    ModelFabric("fabric1.png", "Floral Fabric", "\$20.00"),
    ModelFabric("fabric2.png", "Printed Fabric", "\$10.17"),
    ModelFabric("fabric3.png", "Cotton Fabric", "\$18.00"),
    ModelFabric("fabric4.png", "Chiffon fabric", "\$10.17"),
    ModelFabric("fabric5.png", "Viscose Fabric", "\$18.00"),
    ModelFabric("fabric6.png", "Polyester fabric", "\$10.17"),
    ModelFabric("fabric7.png", "Tactile Fabric", "\$18.00"),
    ModelFabric("fabric8.png", "Chiken fabric", "\$10.17")
  ];

  static List<ModelBestSell> bestSellList = [
    ModelBestSell(
        "best_sell1.png", "Floreal Printed Top", "\$20.00", "300", "122", true),
    ModelBestSell(
        "best_sell2.png", "Men Blue T-shirt", "\$18.00", "400", "180", false),
    ModelBestSell("best_sell3.png", "Short Cotton Kurti ", "\$16.00", "200",
        "150", false),
    ModelBestSell(
        "best_sell4.png", "Men’s Shirt", "\$19.00", "300", "122", true),
    ModelBestSell(
        "best_sell5.png", "Women Kurti ", "\$19.00", "500", "130", false)
  ];

  static List<ModelCart> cartList = [
    ModelCart("cart1.png", "Blue Men Shirt", "Fabric: Cotton", "\$20.00", 1),
    ModelCart("cart2.png", "Grey Men Shirt", "Fabric: Cotton", "\$14.00", 1)
  ];

  static List<ModelPayment> paymentLists = [
    ModelPayment("paypal.png", "Paypal", "XXXX XXXX XXXX 2563"),
    ModelPayment("master_card.png", "Master Card", "XXXX XXXX XXXX 2365"),
    ModelPayment("visa.png", "Visa", "XXXX XXXX XXXX 2100"),
    ModelPayment("cod.png", "Cash On Delivery", "")
  ];

  static List<ModelShopCategory> shopCategoryList = [
    ModelShopCategory("shop_cat1.png", "Women"),
    ModelShopCategory("shop_cat2.png", "Men"),
    ModelShopCategory("shop_cat3.png", "Kids")
  ];

  static List<ModelTrending> trendingList = [
    ModelTrending("shop_tre1.png", "Bandhni Print Top", "\$15.00", "5.4", true),
    ModelTrending(
        "shop_tre2.png", "Cotton Shirt for men", "\$28.00", "5.4", false),
    ModelTrending(
        "shop_tre3.png", "Embroidery Long Kurta", "\$28.00", "5.4", false),
    ModelTrending("shop_tre4.png", "Straight Kurta", "\$15.00", "5.4", false),
    ModelTrending("shop_tre5.png", "Cotton Kurti", "\$15.00", "5.4", false),
    ModelTrending("shop_tre6.png", "Girl Print Top", "\$10.00", "5.1", true)
  ];

  static List<ModelMostSell> mostSellList = [
    ModelMostSell(
        "most_sell1.png", "#FFD6D2", "Boy Red Kurta", "\$12.00", "5.0", false),
    ModelMostSell(
        "most_sell2.png", "#C6F7FF", "Shirt For Men", "\$22.00", "5.0", false),
    ModelMostSell("most_sell3.png", "#FFD4C7", "Floreal Printed Top", "\$19.00",
        "5.3", true),
    ModelMostSell("most_sell4.png", "#DAF5C0", "Solid Straight Kurta",
        '\$30.00', "5.3", true),
    ModelMostSell("most_sell5.png", "#FFDAE1", "Strappy Straight Kurta",
        "\$19.00", "5.0", false)
  ];

  static List<String> color = [
    "#F55A55",
    "#191F59",
    "#0EB9B5",
    "#A89665",
    "#517741"
  ];

  static List<String> sizeList = ["S", "M", "L", "XL", "XXL"];

  static List<ModelMyCart> myCartList = [
    ModelMyCart("mcart1.png", "Blue Men Shirt", "Fabric: Cotton", "\$20.00"),
    ModelMyCart("mcart2.png", "Grey Men Shirt", "Fabric: Cotton", "\$14.00"),
    ModelMyCart("mcart3.png", "Women Kurta ", "Fabric: Cotton", "\$12.00"),
    ModelMyCart(
        "mcart4.png", "Solid Straight Kurta", "Fabric: Cotton", "\$30.00")
  ];

  static List<ModelNotificationDay> notificationList = [
    ModelNotificationDay("Today", [
      ModelNotification("notifi1.png",
          "Here’s a surprise to help you alog the way", "1m ago"),
      ModelNotification("notifi2.png",
          "You order no.8745691 has been successfully deliverd", "4hrs ago")
    ]),
    ModelNotificationDay("Yesterday", [
      ModelNotification(
          "notifi3.png", "An Update of your cotton fabric ", "5:00 PM"),
      ModelNotification(
          "notifi4.png", "You order no.8745691 has been cancelled", "04:10 PM"),
      ModelNotification(
          "notifi5.png", "30% off on new upcoming chiken fabric", "10:10 PM"),
      ModelNotification(
          "notifi6.png", "30% off on new upcoming chiken fabric", "10:10 PM")
    ]),
  ];

  static List<ModelOrder> orderList = [
    ModelOrder(
        "order1.png", "Women Kurta ", "ID:7412589", "23-Aug-2022", "\$15.00"),
    ModelOrder(
        "order2.png", "Boy Red Kurta", "ID:4785210", "20-Aug-2022", "\$12.00"),
    ModelOrder("order3.png", "Solid Straight Kurta", "ID:7412589",
        "23-Aug-2022", "\$30.00"),
    ModelOrder("order4.png", "Cotton Shirt for men", "ID:4785210",
        "20-Aug-2022", "\$12.00")
  ];

  static List<ModelMostSell> favouriteList = [
    ModelMostSell("favourite1.png", "#FFD4C7", "Floreal Printed Top", "\$19.00",
        "5.3", true),
    ModelMostSell("favourite2.png", "#DAF5C0", "Solid Straight Kurta",
        "\$30.00", "5.3", true),
    ModelMostSell("favourite3.png", "#FDE6BA", "Floreal Printed Top", "\$20.00",
        "5.4", true),
    ModelMostSell(
        "favourite4.png", "#FEDEE4", "Men’s Shirt", "\$19.00", "5.4", true)
  ];
}
