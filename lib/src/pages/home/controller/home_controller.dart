import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils.services.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilServices = UtilsServices();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();
    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);
        print('Todas as categorias: $allCategories');
      },
      error: (message) {
        utilServices.showToast(message: message, isError: true);
      },
    );
  }
}
