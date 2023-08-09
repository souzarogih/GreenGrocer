import 'dart:developer' as dev;

class UtilLogServices {
  void logScreenPage(int page) {
    if (page == 0) {
      dev.log('Navegação para tela Home');
    } else if (page == 1) {
      dev.log('Navegação para tela de Carrinho');
    } else if (page == 2) {
      dev.log('Navegação para tela de Pedidos');
    } else if (page == 3) {
      dev.log('Navegação para tela Perfil');
    }
  }
}
