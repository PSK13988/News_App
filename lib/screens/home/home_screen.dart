import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styli/apis/repository/api_repository.dart';
import 'package:styli/screens/detail/detail_screen.dart';
import 'package:styli/screens/home/home_controller.dart';

import '../../apis/api_service.dart';
import '../../configs/app_assets.dart';
import '../../models/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(
    HomeController(
      ApiRepositoryImpl(
        ApiServiceImpl(Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(homeTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => controller.news.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                  ),
                  itemCount: controller.news.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () => navigateToNewsDetail(controller.news[index]),
                      child: CachedNetworkImage(
                        imageUrl: controller.news[index].imageUrl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  void navigateToNewsDetail(News news) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(news: news),
        ),
      );
}
