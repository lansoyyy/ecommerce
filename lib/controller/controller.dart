import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailor_app/model/best_sell_model.dart';
import 'package:tailor_app/model/most_sell_model.dart';

import '../dataFile/data_file.dart';
import '../model/cart_model.dart';
import '../model/trending_model.dart';

class IntroController extends GetxController {
  RxInt position = 0.obs;

  onChange(RxInt value) {
    position.value = value.value;
    update();
  }
}

class SignUpController extends GetxController {
  RxBool check = false.obs;

  onChange() {
    check.value = check.value ? false : true;
    update();
  }
}

class HomeController extends GetxController {
  RxInt index = 0.obs;
  List<ModelBestSell> bestSellLists = DataFile.bestSellList;

  selectChange(int index) {
    bestSellLists[index].select = bestSellLists[index].select ? false : true;
    update();
  }

  onChange(RxInt value) {
    index.value = value.value;
    update();
  }
}

class MeasurementController extends GetxController {
  RxInt gender = 0.obs;
  List<String> categoryList = [
    "Order Id:8745691",
    "category 1",
    "category 2",
    "category 3"
  ];

  onChange(int value) {
    gender.value = value;
    update();
  }
}

class FabricController extends GetxController {
  List<String> uploadFabricList = [];

  File? image;
  RxString imagePath = ''.obs;
  final _picker = ImagePicker();

  getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      uploadFabricList.add(image!.path);
      update();
    }
  }
}

class AlterationController extends GetxController {
  List<String> productList = [];

  File? image;
  RxString imagePath = ''.obs;
  final _picker = ImagePicker();

  getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      productList.add(image!.path);
      update();
    }
  }

  onRemove(int index) {
    productList.removeAt(index);
    update();
  }
}

class CustomizeController extends GetxController {
  RxInt color = 0.obs;

  changeColor(int value) {
    color.value = value;
    update();
  }
}

class CartController extends GetxController {
  List<ModelCart> cartLists = DataFile.cartList;
}

class PaymentController extends GetxController {
  RxInt select = 0.obs;
  RxBool save = false.obs;

  saveChange() {
    save.value = save.value ? false : true;
    update();
  }

  change(int value) {
    select.value = value;
    update();
  }
}

class ShopController extends GetxController {
  List<ModelTrending> shoptrendingLists = DataFile.trendingList;
  List<ModelMostSell> mostSellLists = DataFile.mostSellList;

  sellSelectChange(int index) {
    mostSellLists[index].favourite =
        mostSellLists[index].favourite ? false : true;
    update();
  }

  selectChange(int index) {
    shoptrendingLists[index].favourite =
        shoptrendingLists[index].favourite ? false : true;
    update();
  }
}

class MostSellDetailController extends GetxController {
  RxInt color = 0.obs;

  colorChange(int index) {
    color.value = index;
    update();
  }

  RxInt size = 0.obs;

  sizeChange(int index) {
    size.value = index;
    update();
  }

  RxInt quantity = 1.obs;

  onAdd() {
    quantity.value = quantity.value + 1;
    update();
  }

  onMinus() {
    if (quantity.value > 1) {
      quantity.value = quantity.value - 1;
      update();
    }
  }
}

class MyCartController extends GetxController {
  RxBool list = false.obs;

  onChange() {
    list.value = list.value ? false : true;
    update();
  }

  onFalse() {
    list.value = false;
    update();
  }
}

class ProfileController extends GetxController {
  File? image;
  RxString imagePath = ''.obs;
  final _picker = ImagePicker();

  getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath(pickedFile.path);
      update();
    } else {}
  }
}

class FavouriteController extends GetxController {
  List<ModelMostSell> favourite = DataFile.favouriteList;

  onRemove(int index) {
    favourite.removeAt(index);
    update();
  }
}
