import 'package:MyTrust/feature/home/controller/banner_controller.dart';
import 'package:MyTrust/feature/home/repository/banner_repo.dart';
import 'package:MyTrust/feature/wallet/controller/wallet_controller.dart';
import 'package:MyTrust/feature/wallet/repository/wallet_repo.dart';
import 'package:get/get.dart';

class WalletBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController(walletRepo: WalletRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
    Get.lazyPut(() => BannerController(bannerRepo: BannerRepo(apiClient: Get.find())));
  }
}