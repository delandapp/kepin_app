import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/custom_toast.dart';
import '../../../data/constans/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../style/app_colors.dart';

class ProfileController extends GetxController with StateMixin{

  final loading = false.obs;
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

  logout() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      var response = await ApiProvider.instance().get(
          Endpoint.logout,options: Options(headers: {"Authorization": "Bearer $bearerToken"})
      );

      if (response.statusCode == 200) {
        CustomToast.ShowToast("Logout Berhasil, silakan login kembali", AppColors.whiteColor, AppColors.primaryColor);
        StorageProvider.clearAll();
        Get.offAllNamed(Routes.LOGIN);
      } else {
        CustomToast.ShowToast("Logout gagal, silakan coba lagi", AppColors.blackColor, AppColors.whiteColor);
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          CustomToast.ShowToast("${e.response?.data['message']}", AppColors.blackColor, AppColors.whiteColor);
        }
      } else {
        CustomToast.ShowToast(e.message ?? "", AppColors.blackColor, AppColors.whiteColor);
      }
    } catch (e) {
      loading(false);
      CustomToast.ShowToast(e.toString(), AppColors.blackColor, AppColors.whiteColor);
    }
  }
}
