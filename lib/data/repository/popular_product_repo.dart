import '../../data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductsList() async {
    return await apiClient.getPopularProductsList("");
  }
}
