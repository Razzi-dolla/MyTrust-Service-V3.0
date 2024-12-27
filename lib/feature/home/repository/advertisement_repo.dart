import 'package:get/get_connect/http/src/response/response.dart';
import 'package:MyTrust/utils/core_export.dart';

class AdvertisementRepo {
  final ApiClient apiClient;
  AdvertisementRepo({required this.apiClient});

  Future<Response> getAdvertisementList() async {
    return await apiClient.getData(AppConstants.advertisementList);
  }

}