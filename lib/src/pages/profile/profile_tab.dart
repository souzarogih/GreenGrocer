import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/services/utils.services.dart';
import 'package:greengrocer/src/services/validators.dart';
import 'dart:developer' as dev;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final authController = Get.find<AuthController>();
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //Email
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.email,
            icon: Icons.email,
            label: 'Email',
          ),

          //Nome
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),

          //Celular
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),

          //cpf
          CustomTextField(
            readOnly: true,
            initialValue: authController.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),

          //botão para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Título
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Senha atual
                      CustomTextField(
                        controller: currentPasswordController,
                        isSecret: true,
                        icon: Icons.lock,
                        label: 'Senha atual',
                        validator: passwordValidator,
                      ),
                      // Nova Senha
                      CustomTextField(
                        controller: newPasswordController,
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: 'Nova senha',
                        validator: passwordValidator,
                      ),
                      // Confirmação nova senha
                      CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: 'Confirmar nova senha',
                        validator: (password) {
                          final result = passwordValidator(password);
                          if (result != null) {
                            dev.log('A senha não é válida');
                            return result;
                          }
                          if (password != newPasswordController.text) {
                            dev.log('As senhas não são iguais');
                            return 'As senhas não são iguais.';
                          }
                          return null;
                        },
                      ),

                      // Botão de confirmação
                      SizedBox(
                        height: 45,
                        child: Obx(
                          () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: authController.isLoading.value
                                ? null
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      authController.changePassword(
                                        currentPassword:
                                            currentPasswordController.text,
                                        newPassword: newPasswordController.text,
                                      );
                                    }
                                    // utilsServices.showToast(
                                    //   message: 'Senha atualizada com sucesso',
                                    // );
                                  },
                            child: authController.isLoading.value
                                ? const CircularProgressIndicator()
                                : const Text('Atualizar'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
