import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';
import 'dart:developer' as dev;

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      dev.log('Lista de categorias obtidas com sucesso.');
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromJson)
              .toList();
      return HomeResult<CategoryModel>.success(data);
      //Lista
    } else {
      //Erro
      dev.log('GG-100 Ocorreu um erro ao tentar obter a lista de categorias.');
      // print(result['result']);
      return HomeResult.error(
          'Ocorreu um erro inesperado ao recuperar as categorias.');
    }
  }
}
