import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils.services.dart';
import 'dart:developer' as dev;

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilServices = UtilsServices();

  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;
  List<ItemModel> get allProducts => currentCategory?.items ?? [];

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    if (currentCategory!.items.isNotEmpty) return;

    getAllProducts();
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();
    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        if (allCategories.isEmpty) return;
        selectCategory(allCategories.first);
      },
      error: (message) {
        utilServices.showToast(message: message, isError: true);
      },
    );
  }

  Future<void> getAllProducts() async {
    setLoading(true, isProduct: true);

    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'itemsPerPage': itemsPerPage,
    };

    HomeResult<ItemModel> result = await homeRepository.getAllProducts(body);

    setLoading(false, isProduct: true);

    result.when(
      success: (data) {
        currentCategory!.items = data;
        dev.log('Obtendo as categórias do app: $data');
        // update();
      },
      error: (message) {
        utilServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
