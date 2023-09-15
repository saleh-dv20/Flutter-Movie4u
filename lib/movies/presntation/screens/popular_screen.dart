import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/strings_manager.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:cima_movies_clean/movies/presntation/widgets/more_popular_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: AppSize.s20),
        child: Stack(
          children: [
            const MorePopularWidger(),
            // AppBar in stack ......
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: AppSize.s120,
                width: AppSize.s400,
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          IconManager.backArrowForward,
                          color: ColorManager.white,
                          size: AppSize.s30,
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s100,
                      ),
                      Text(
                        StringManager.popularMovies,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
