import 'package:cima_movies_clean/core/getx/routes/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/manager/colors_manager.dart';
import '../../../core/manager/strings_manager.dart';
import '../../../core/manager/values_manager.dart';
import '../widgets/nowplaying_widget.dart';
import '../widgets/popular_widget.dart';
import '../widgets/torated_widget.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingWidget(),
            //
            Container(
              margin: const EdgeInsets.fromLTRB(
                AppSize.s16,
                AppSize.s24,
                AppSize.s16,
                AppSize.s8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.popular,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.popularScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.s8),
                      child: Row(
                        children: [
                          Text(
                            StringManager.seeMore,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Icon(
                            IconManager.arrowForward,
                            size: AppSize.s16,
                            color: ColorManager.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //
            const PopularWidget(),
            //
            Container(
              margin: const EdgeInsets.fromLTRB(
                AppSize.s16,
                AppSize.s24,
                AppSize.s16,
                AppSize.s8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.topReated,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.topRateScreen);
                      // : NAVIGATION TO Top Rated Movies Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.s8),
                      child: Row(
                        children: [
                          Text(
                            StringManager.seeMore,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Icon(
                            IconManager.arrowForward,
                            size: AppSize.s16,
                            color: ColorManager.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //
            const TopRatedWidget(),
          ],
        ),
      ),
    );
  }
}
