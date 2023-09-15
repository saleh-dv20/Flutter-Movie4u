import 'package:cima_movies_clean/core/getx/routes/routs.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:cima_movies_clean/tevs/presntation/widgets/on_the_air_widget.dart';
import 'package:cima_movies_clean/tevs/presntation/widgets/popular_tv_widget.dart';
import 'package:cima_movies_clean/tevs/presntation/widgets/top_rated_tv_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/manager/colors_manager.dart';
import '../../../core/manager/strings_manager.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // On The Air Tv Items ...........
            const OnTheAirWidget(),
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
                      Get.toNamed(RouteName.tvPopularScreen);
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
            const PopularTvWidget(),
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
                      Get.toNamed(RouteName.tvTopRatedScreen);
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
            const TopRatedTvWidget(),
          ],
        ),
      ),
    );
  }
}
