import 'package:get/get.dart';

class BaseController extends GetxController {

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) => _isLoading.value = value;
}