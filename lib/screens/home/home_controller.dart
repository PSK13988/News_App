import 'package:get/get.dart';
import 'package:styli/apis/repository/api_repository.dart';

import '../../configs/app_assets.dart';
import '../../models/news.dart';

class HomeController extends GetxController {
  ApiRepository apiRepository;

  RxList<News> news = <News>[].obs;

  HomeController(this.apiRepository) {
    getTopNews();
  }

  Future<void> getTopNews() async {
    final response = await apiRepository.getTopNews(token: token);
    updateNews(response);
  }

  void updateNews(List<News> response) {
    news.addAll(response);
    update();
  }
}
