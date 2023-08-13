import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/orders/orders_result/orders_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';
import 'dart:developer' as dev;

class OrdersRepository {
  final _httpManager = HttpManager();

  Future<OrdersResult<List<OrderModel>>> getAllOrders(
      {required String userId, required String token}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllOrders,
      method: HttpMethods.post,
      body: {'user': userId},
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    if (result['result'] != null) {
      List<OrderModel> orders =
          List<Map<String, dynamic>>.from(result['result'])
              .map(OrderModel.fromJson)
              .toList();

      dev.log('Pedidos recuperados com sucesso.');
      return OrdersResult<List<OrderModel>>.success(orders);
    } else {
      dev.log('Não foi possível recuperar os pedidos.');
      return OrdersResult.error('Não foi possível recuperar os pedidos.');
    }
  }
}