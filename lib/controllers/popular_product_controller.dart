import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductsList = [];
  List<dynamic> get popularProductsList => _popularProductsList;

  Future<void> getPopularProductsList() async {
    Response response = await popularProductRepo.getPopularProductsList();
    if (response.statusCode == 200) {
      _popularProductsList = [];
      _popularProductsList.addAll([]);
      update();
    } else {}
  }
}
