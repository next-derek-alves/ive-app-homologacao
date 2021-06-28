import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ivedigital/core/app_colors.dart';
import 'package:ivedigital/core/app_images.dart';
import 'package:ivedigital/core/app_routes.dart';
import 'package:ivedigital/core/app_text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivedigital/features/login/presenter/login_page_controller.dart';

import 'login_state.dart';

class LoginPage extends GetView<LoginPageController> {
  final _formKey = GlobalKey<FormBuilderState>();
  final controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            color: AppColors.blue,
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: AppTextStyles.heading36,
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          controller.state is LoginLoading
                              ? Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Image.asset(AppImages.logo),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              if (controller.state is LoginFailure)
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    (controller.state as LoginFailure).error!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Get.theme.errorColor,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              FormBuilderTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                name: "email",
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10),
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.email(context,
                                      errorText: "Email inválido"),
                                  FormBuilderValidators.required(context,
                                      errorText: "Campo obrigatório")
                                ]),
                              ),
                              SizedBox(height: 20),
                              FormBuilderTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: true,
                                name: "password",
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10),
                                    ),
                                  ),
                                  hintText: "Senha",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(context,
                                        errorText: "Campo obrigatório"),
                                    FormBuilderValidators.minLength(context, 5,
                                        errorText: "Minimo 5 caracteres"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: double.infinity, height: 35),
                            child: ElevatedButton(
                              child: Text("Entrar"),
                              onPressed: () {
                                _formKey.currentState?.save();
                                final data = _formKey.currentState!.value;
                                controller.login(data);
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Esqueceu a senha",
                                  style: GoogleFonts.k2d(
                                    color: AppColors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.toNamed(AppRoutes.CREATE_ACCOUNT),
                                child: Text(
                                  "Cadastrar",
                                  style: GoogleFonts.k2d(
                                    color: AppColors.darkOrange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
