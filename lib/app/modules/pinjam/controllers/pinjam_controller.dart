import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenzone/app/data/constans/endpoint.dart';
import 'package:zenzone/app/data/provider/api_provider.dart';
import 'package:zenzone/app/data/provider/storage_provider.dart';
import 'package:zenzone/app/modules/detailbook/controllers/detailbook_controller.dart';

class PinjamController extends GetxController {
  //TODO: Implement PinjamController
  final DetailbookController detailbookController =
      Get.put(DetailbookController());
  int get day => DateTime.now().day;
  int get month => DateTime.now().month;
  int get year => DateTime.now().year;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime get oneWeekFromNow => DateTime.now().add(Duration(days: 7));
  int get dayAfter => oneWeekFromNow.day;
  int get monthAfter => oneWeekFromNow.month;
  int get yearAfter => oneWeekFromNow.year;
  final loading = false.obs;
  final sucsesPeminjaman = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  addPinjam() async {
    loading(true);

    try {
       final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      String data =
          jsonEncode({"BukuID": detailbookController.detailBuku.value.bukuID});
      FocusScope.of(Get.context!).unfocus();
      final response =
          await ApiProvider.instance().post(Endpoint.pinjam, data: data, options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (response.statusCode == 200) {
        sucsesPeminjaman(true);
        Get.snackbar("Information", "Peminjaman Succes",
            backgroundColor: Colors.green);
        // Get.offAllNamed(Routes.LOGIN);
      } else {
        sucsesPeminjaman(false);
        Get.snackbar("Sorry", "Peminjaman Gagal", backgroundColor: Colors.red);
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
