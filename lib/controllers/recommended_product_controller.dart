import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';
import '../modals/product_modal.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductsList = [];
  List<dynamic> get recommendedProductsList => _recommendedProductsList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecommendedProductsList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductsList();
    if (response.statusCode == 200) {
      _recommendedProductsList = [];
      _recommendedProductsList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      _isLoaded = true;
    }
  }
}
