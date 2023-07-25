import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'Kg',
);

ItemModel grape = ItemModel(
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'Kg',
);

ItemModel guava = ItemModel(
  description:
      'A melhor Goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'Kg',
);

ItemModel kiwi = ItemModel(
  description:
      'O melhor Kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 11.5,
  unit: 'un',
);

ItemModel mango = ItemModel(
  description:
      'A melhor Manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
);

ItemModel papaya = ItemModel(
  description:
      'O melhor Mamão papaya da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão Papaya',
  price: 2.5,
  unit: 'un',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 2,
  ),
  CartItemModel(
    item: mango,
    quantity: 1,
  ),
  CartItemModel(
    item: guava,
    quantity: 3,
  ),
  CartItemModel(
    item: grape,
    quantity: 4,
  ),
  CartItemModel(
    item: kiwi,
    quantity: 1,
  ),
  CartItemModel(
    item: papaya,
    quantity: 7,
  ),
];

UserModel user = UserModel(
  phone: '83 9 8858-9659',
  cpf: '064.650.094-55',
  email: 'higor.andrade@hotmail.com',
  name: 'Higor',
  password: '****',
);

List<OrderModel> orders = [
  //Pedido 1
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2023-07-25 09:12:01.305',
    ),
    overdueDateTime: DateTime.parse(
      '2023-07-25 11:02:10.305',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 3,
      ),
      CartItemModel(
        item: papaya,
        quantity: 1,
      ),
    ],
  ),
  //Pedido 2
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5b3',
    createdDateTime: DateTime.parse(
      '2023-07-24 21:12:10.205',
    ),
    overdueDateTime: DateTime.parse(
      '2023-07-26 12:02:10.401',
    ),
    id: 'asd6a54da6s2fh',
    status: 'refounded',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 3,
      ),
      CartItemModel(
        item: mango,
        quantity: 4,
      ),
      CartItemModel(
        item: grape,
        quantity: 1,
      ),
      CartItemModel(
        item: kiwi,
        quantity: 8,
      ),
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
      CartItemModel(
        item: papaya,
        quantity: 8,
      ),
    ],
  ),

  //Pedido 3
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5C5',
    createdDateTime: DateTime.parse(
      '2023-07-25 09:22:12.095',
    ),
    overdueDateTime: DateTime.parse(
      '2023-07-26 12:10:21.120',
    ),
    id: 'asd6a54da6s2CD',
    status: 'pending_payment',
    total: 101.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 3,
      ),
      CartItemModel(
        item: mango,
        quantity: 4,
      ),
      CartItemModel(
        item: grape,
        quantity: 1,
      ),
      CartItemModel(
        item: kiwi,
        quantity: 8,
      ),
    ],
  ),
];
