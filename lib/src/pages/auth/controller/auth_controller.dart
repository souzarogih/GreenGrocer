import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/utils.services.dart';
import 'dart:developer' as dev;

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsService = UtilsServices();

  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    //recuperar o token salvo localmente
    String? token = await utilsService.getLocalData(key: StorageKeys.token);

    if (token == null) {
      dev.log('Fazendo o roteamento para login');
      Get.offAllNamed(PagesRoutes.sigInRoute);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        dev.log('Token inválido');
        signOut();
      },
    );
  }

  Future signOut() async {
    // Zerar o user
    user = UserModel();

    // Remover o token localmente
    await utilsService.remoteLocalData(key: StorageKeys.token);

    // Ir para o login
    Get.offAllNamed(PagesRoutes.sigInRoute);
  }

  void saveTokenAndProceedToBase() {
    //Salvar o token
    utilsService.saveLocalData(key: StorageKeys.token, data: user.token!);
    dev.log('Token do usuário salvo localmente.');
    dev.log('Redirecionando para tela principal.');

    //Ir para tela base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signUp() async {
    dev.log('Enviando requisição de cadastro de usuário.');
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsService.showToast(message: message, isError: true);
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsService.showToast(message: message, isError: true);
      },
    );
  }
}
