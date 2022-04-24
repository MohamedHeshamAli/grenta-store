import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class InternetController extends GetxController {
  bool internetLastStatus = false;
  bool internetCurrentStatus = false;
  RxBool reBuild = false.obs;
  @override
  void onInit() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _statusChange(true);
      } else {
        _statusChange(false);
      }
    });
    super.onInit();
  }

  void _statusChange(bool newState) {
    internetLastStatus = internetCurrentStatus;
    internetCurrentStatus = newState;

    if (internetCurrentStatus && !internetLastStatus ||
        internetCurrentStatus && internetLastStatus) {
      reBuild.value = true;
    } else {
      reBuild.value = false;
    }
    print("reBuild.value:${reBuild.value}");
  }
}
