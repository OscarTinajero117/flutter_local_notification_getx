import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString _message = ''.obs;
  String get message => _message.value;
  @override
  void onInit() {
    _message.value = Get.arguments;
    super.onInit();
  }
}
