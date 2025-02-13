import 'package:MyTrust/utils/core_export.dart';
import 'package:get/get.dart';


class CouponRepo {
  final ApiClient apiClient;
  CouponRepo({required this.apiClient});

  Future<Response> getCouponList() async {
    return await apiClient.getData(AppConstants.couponUri);
  }

  Future<Response> applyCoupon(String couponCode, String couponId) async {
    return await apiClient.postData(AppConstants.applyCoupon,
        {'coupon_code':couponCode,
          "guest_id" : Get.find<SplashController>().getGuestId(),
          "coupon_id": couponId
        }
    );
  }

  Future<Response> removeCoupon() async {
    return await apiClient.getData("${AppConstants.removeCoupon}?guest_id=${Get.find<SplashController>().getGuestId()}");
  }
}