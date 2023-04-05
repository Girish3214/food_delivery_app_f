import 'package:get/get.dart';

import '../../data/api/api_client.dart';
import '../../utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductsList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCTS_URL);
  }
}
