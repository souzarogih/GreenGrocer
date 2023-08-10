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
      dev.log('${DateTime.now()} - GG-102 Obtendo dados do carrinho.');
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

  Future<bool> changeItemQuantity({
    required String token,
    required cartItemId,
    required int quantity,
  }) async {
    dev.log('${DateTime.now()} - Alterando a quantidade do item {} .');
    final result = await _httpManager.restRequest(
      url: Endpoints.changeItemQuantity,
      method: HttpMethods.post,
      body: {
        'cartItemId': cartItemId,
        'quantity': quantity,
      },
      headers: {'X-Parse-Session-Token': token},
    );

    return result.isEmpty;
  }

  Future<CartResult<String>> addItemToCart({
    required String userId,
    required String token,
    required String productId,
    required int quantity,
  }) async {
    dev.log(
        '${DateTime.now()} - Adicionando itens ao carrinho do usuário $userId .');
    final result = await _httpManager.restRequest(
      url: Endpoints.addItemToCart,
      method: HttpMethods.post,
      body: {
        'user': userId,
        'quantity': quantity,
        'productId': productId,
      },
      headers: {'X-Parse-Session-Token': token},
    );

    if (result['result'] != null) {
      dev.log(
          '${DateTime.now()} - Itens do carrinho ${result['result']['id']} adicionados com sucesso.');
      return CartResult.success(result['result']['id']);
    } else {
      dev.log(
          '${DateTime.now()} - Não foi possível adicionar os itens no carrinho do usuário $userId.');
      return CartResult.error('Não foi possível adicionar o item no carrinho.');
    }
  }
}
