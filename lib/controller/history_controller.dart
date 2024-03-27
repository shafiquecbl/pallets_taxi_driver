import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:pallets_taxi_driver_pannel/data/repository/history_repo.dart';

class HistoryController extends GetxController implements GetxService {
  final HistoryRepo historyRepo;
  HistoryController({required this.historyRepo});
  static HistoryController get find => Get.find<HistoryController>();

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    update();
  }
}
