import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/cart_result/cart_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';
import 'dart:developer' as dev;

class CartRepository {
  final _httpManager = HttpManager();

  Future<CartResult<List<CartItemModel>>> getCartItems(
      {required String token, required String userId}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {'user': userId},
    );

    if (result['result'] != null) {
      dev.log('GG-102 Obtendo dados do carrinho.');
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();
      dev.log('Item da lista: ${data[0].id}');
      return CartResult<List<CartItemModel>>.success(data);
    } else {
      dev.log('Ocorreu um erro ao recuperar os itens do carrinho.');
      return CartResult.error(
          'Ocorreu um erro ao recuperar os itens do carrinho.');
    }
  }
}
