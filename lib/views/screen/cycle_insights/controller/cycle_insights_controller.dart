import 'package:fertie_application/data/api_constants.dart';
import 'package:fertie_application/service/api_client.dart';
import 'package:fertie_application/views/screen/cycle_insights/models/cycle_insights_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CycleInsightsController extends GetxController {
  Rx<CycleInsightsModel> cycleInsights = CycleInsightsModel().obs;
  RxList<CycleInsightsModel> allCycleInsights = <CycleInsightsModel>[].obs;
  final Logger _logger = Logger();
  RxBool isLoading = false.obs;

  Future<void> getCycleInsights() async {
    isLoading.value = true;
    update();

    final response = await ApiClient.getRequest(ApiConstants.cycleInsightUrl);

    if (response.statusCode == 200) {
      cycleInsights.value = CycleInsightsModel.fromJson(response.body);
      _logger.i('${response.statusCode}${response.body}');
    } else {
      print('failed');
    }
    isLoading.value = false;
  }
}