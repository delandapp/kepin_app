import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_validator/form_validator.dart';
import '../../../data/constans/validation.dart';
import '../controllers/register_controller.dart';

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

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final myAppBar = AppBar(
      title: const Text('LoginView'),
      centerTitle: true,
    );
    final heightOnlyBody = heightBody -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Form(
          key: controller.formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(45, 46, 46, 1),
                  Color.fromRGBO(0, 0, 0, 1)
                ])),
            width: double.infinity,
            height: heightBody,
            child: Padding(
              padding: EdgeInsets.only(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox(),flex: 1,),
                  Text('Register',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                          fontFamily: GoogleFonts.audiowide().fontFamily)),
                  SizedBox(
                    height: heightOnlyBody * 0.1,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text('Username',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.audiowide().fontFamily)),
                            ),
                            TextFormField(
                                controller: controller.username,
                                validator:
                                    ValidationBuilder().minLength(5).build(),
                                autocorrect: false,
                                autofocus: true,
                                enableInteractiveSelection: false,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontFamily:
                                          GoogleFonts.audiowide().fontFamily),
                                  filled: true,
                                  fillColor: Colors.grey,
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
                                  // border: OutlineInputBorder(),
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
                              child: Text('Email',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.audiowide().fontFamily)),
                            ),
                            TextFormField(
                                controller: controller.email,
                                validator: validator,
                                autocorrect: false,
                                autofocus: false,
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
                                  // border: OutlineInputBorder(),
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
                                controller: controller.password,
                                validator: validatorPassword,
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
                                  // border: OutlineInputBorder(),
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
                              child: Text('Confirm Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.audiowide().fontFamily)),
                            ),
                            TextFormField(
                                validator: ValidationBuilder()
                                    .confirmPassword(controller.password)
                                    .build(),
                                obscureText: true,
                                autocorrect: false,
                                autofocus: true,
                                enableInteractiveSelection: false,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontFamily:
                                          GoogleFonts.audiowide().fontFamily),
                                  filled: true,
                                  fillColor: Colors.grey,
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
                                  // border: OutlineInputBorder(),
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
                        onPressed: () {controller.postRegister();},
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 5),
                            child: controller.loading.value
                                ? CircularProgressIndicator()
                                : Text('Daftar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        fontFamily: GoogleFonts.audiowide()
                                            .fontFamily)),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 138, 147, 0.7),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Sudah punya akun ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: GoogleFonts.audiowide().fontFamily)),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 5),
                          child: Text('Masuk',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily:
                                      GoogleFonts.audiowide().fontFamily)),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox(),flex: 1,),
                  Image(
                    image: AssetImage('assets/images/LOGO.png'),
                    width: MediaQuery.of(context).size.width * 0.3,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
