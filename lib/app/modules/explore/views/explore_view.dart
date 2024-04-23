import 'package:zenzone/app/components/bookSearch.dart';
import 'package:zenzone/app/components/buildSearch.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zenzone/app/components/searchInput.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final heightFullBody = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (state) => Container(
            color: const Color(0xFF000000),
            width: width,
            height: heightFullBody,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyInputSearch(
                    prefixIcon: Icons.search,
                    validator: controller.validator,
                    controller: controller,
                    controllerField: controller.search,
                    height: 10,
                    width: 10,
                    hintText: "Apa yang ingin kamu baca",
                    autoFocus: false,
                  ),
                ),
                Obx(
                  () => Expanded(
                    child: controller.searchLenght.value == 1
                        ? controller.loading.value == false ? controller.listDataBuku.isEmpty ? const Center(child: Text("Tidak Ada Buku",style: TextStyle(color: Colors.white),)) : BookSearch(data: controller.listDataBuku) : const Center(child: CircularProgressIndicator())
                        : buildSearch(data: state!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  }
}
