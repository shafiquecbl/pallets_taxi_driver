import 'package:get/get.dart';

class DashboardController extends GetxController implements GetxService {
  static DashboardController get find => Get.find<DashboardController>();
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
