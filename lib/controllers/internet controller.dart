import 'package:grenta_store/widgets/ToastWidget.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class InternetController extends GetxController {
  bool internetLastStatus = false;
  bool internetCurrentStatus = false;
  bool isOnline = false;

  @override
  void onInit() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _changeConnectionStatus();
      } else {
        internetLastStatus = internetCurrentStatus;
        internetCurrentStatus = false;
        setInternetToggleMessage();
        update();
      }
    });
    super.onInit();
  }

  Future checkInternet() async {
    try {
      final result = await http.get(Uri.parse("https://www.google.com/"));
      if (result.statusCode == 200) {
        return true;
      }
    } catch (_) {
      return false;
    }
  }

  void _changeConnectionStatus() async {
    for (int i = 0; i < 7; i++) {
      await Future.delayed(const Duration(seconds: 1));
      bool isOnline = await checkInternet();
      if (isOnline) {
        internetLastStatus = internetCurrentStatus;
        internetCurrentStatus = true;
        setInternetToggleMessage();
        update();
        return;
      }
    }
  }

  void setInternetToggleMessage() {
    setToast(internetCurrentStatus ? "يوجد بالانتر نت" : "لا انترنت");
  }
}
