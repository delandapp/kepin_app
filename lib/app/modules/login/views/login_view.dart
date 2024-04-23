import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenzone/app/modules/register/views/register_view.dart';
import 'package:zenzone/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';
import '../../../data/constans/validation.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
  ValidationBuilder confirmPassword(TextEditingController controller) {
    return this
      ..add((value) {
        if (value != controller.text.toString()) {
          return 'Passwords do not match';
        }
        return null;
      });
  }
}

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: controller.formKey,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(45, 46, 46, 1),
                Color.fromRGBO(0, 0, 0, 1)
              ])),
          width: double.infinity,
          height: heightBody,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SizedBox(), flex: 2),
              Text('Masuk',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                      fontWeight: FontWeight.w900,
                      fontSize: 45,
                      fontFamily: GoogleFonts.audiowide().fontFamily)),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text('Email',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  fontFamily:
                                      GoogleFonts.audiowide().fontFamily)),
                        ),
                        TextFormField(
                            validator: validator,
                            controller: controller.email,
                            autocorrect: false,
                            autofocus: true,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontFamily:
                                      GoogleFonts.audiowide().fontFamily),
                              filled: true,
                              fillColor: Colors.grey,
                              // border: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text('Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  fontFamily:
                                      GoogleFonts.audiowide().fontFamily)),
                        ),
                        TextFormField(
                            validator: validatorPassword,
                            controller: controller.password,
                            obscureText: true,
                            autocorrect: false,
                            autofocus: true,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontFamily:
                                      GoogleFonts.audiowide().fontFamily),
                              filled: true,
                              fillColor: Colors.grey,
                              // border: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {controller.login();},
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 5),
                        child: controller.loading.value
                            ? CircularProgressIndicator()
                            : Text('Masuk',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    fontFamily:
                                        GoogleFonts.audiowide().fontFamily)),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 138, 147, 0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Belum punya akun ?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: GoogleFonts.audiowide().fontFamily)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 5),
                      child: Text('Daftar',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: GoogleFonts.audiowide().fontFamily)),
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(), flex: 2),
              Image(
                image: AssetImage('assets/images/LOGO.png'),
                width: MediaQuery.of(context).size.width * 0.2,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
