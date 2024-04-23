import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zenzone/app/data/constans/endpoint.dart';
import 'package:zenzone/app/data/models/response_koleksi.dart';
import 'package:zenzone/app/data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../data/models/response_book_popular.dart';
import '../../../data/models/response_kategori.dart';

class MyState<T1, T2, T3> {
  T1? state1;
  T2? state2;
  T3? state3;
  MyState({this.state1, this.state2, this.state3});
}
class HomeController extends GetxController with StateMixin<MyState<List<DataBookPopular>, List<DataKoleksi>, List<DataKategori>>>{
  //TODO: Implement HomeController
    final RxString username = StorageProvider.read(StorageKey.username).obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
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

   Future<void> getData() async{
    change(null, status: RxStatus.loading());

    try {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        final idUser = StorageProvider.read(StorageKey.idUser);
        final response = await ApiProvider.instance().get('${Endpoint.popular}/buku',options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        final responseKoleksiData = await ApiProvider.instance().get('${Endpoint.koleksi}/${idUser}',options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        final responseKategoriBuku = await ApiProvider.instance().get(Endpoint.kategori,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        if (response.statusCode == 200) {
          final ResponseBookPopular responseBookPopular = ResponseBookPopular.fromJson(response.data);
          final ResponseKoleksi responseKoleksi = ResponseKoleksi.fromJson(responseKoleksiData.data);
          final ResponseKategori responseKategori = ResponseKategori.fromJson(responseKategoriBuku.data);
          print(responseBookPopular);
          if(responseBookPopular.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            final newData = MyState(state1: responseBookPopular.data, state2: responseKoleksi.data, state3: responseKategori.data);
            change(newData, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error("Gagal mengambil data"));
        }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
