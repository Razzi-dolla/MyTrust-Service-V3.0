import 'package:get/get_connect/http/src/response/response.dart';
import 'package:MyTrust/utils/core_export.dart';

class BannerRepo {
  final ApiClient apiClient;
  BannerRepo({required this.apiClient});

  Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.bannerUri);
  }

}