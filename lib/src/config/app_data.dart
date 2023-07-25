import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
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
