import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class InternetController extends GetxController {
  bool internetLastStatus = false;
  bool internetCurrentStatus = false;

  @override
  void onInit() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _changeInternetStatus(true);
      } else {
        _changeInternetStatus(false);
      }
    });
    super.onInit();
  }

  void _changeInternetStatus(bool newState) {
    internetLastStatus = internetCurrentStatus;
    internetCurrentStatus = newState;

    if (internetCurrentStatus && !internetLastStatus) {
      update();
    }
  }
}
