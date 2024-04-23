import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zenzone/app/data/constans/endpoint.dart';
import 'package:zenzone/app/data/models/response_kategori.dart';
import 'package:zenzone/app/data/provider/api_provider.dart';
import 'package:zenzone/app/data/provider/storage_provider.dart';

class KategoriController extends GetxController with StateMixin<List<DataKategori>>{
  //TODO: Implement KategoriController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDataKategori();
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

  Future<void> getDataKategori() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseKategori = await ApiProvider.instance().get(
          Endpoint.kategori,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (responseKategori.statusCode == 200) {
        final ResponseKategori responseDataKategori = ResponseKategori.fromJson(responseKategori.data);
        if(responseDataKategori.data!.isEmpty ) {
            change(responseDataKategori.data, status: RxStatus.empty());
          } else {
            change(responseDataKategori.data, status: RxStatus.success());
          }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['Message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
