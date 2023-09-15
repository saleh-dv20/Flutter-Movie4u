import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/networking/apis_constance.dart';
import 'package:cima_movies_clean/core/utils/is_loading.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_details_movie.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:cima_movies_clean/movies/presntation/controller/details_controller.dart';
import 'package:cima_movies_clean/movies/presntation/screens/details_screen.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/details_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/screens/details_tv_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/manager/strings_manager.dart';
import '../../../core/manager/values_manager.dart';

class OnTheAirWidget extends StatelessWidget {
  const OnTheAirWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TvController>();
    final detailsController = Get.find<DetailsTvController>();

    return Obx(() {
      return controller.isOnLoading.value
          ? isLoading()
          : FadeIn(
              duration: const Duration(milliseconds: AppSize.s500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: AppSize.s400,
                  viewportFraction: AppSize.s1_0,
                  onPageChanged: (index, reason) {},
                ),
                items: controller.onTheAir.map((listItem) {
                  return InkWell(
                    onTap: () {
                      // To details Screen .....
                      Get.to(
                        DetailsTvScreen(
                          id: listItem.id,
                        ),
                      );
                      detailsController.getDetails(listItem.id);

                      // recommendation data...
                      detailsController.getRecommendations(listItem.id);
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                ColorManager.transparent,
                                ColorManager.black,
                                ColorManager.black,
                                ColorManager.transparent,
                              ],
                              stops: [
                                AppSize.s0,
                                AppSize.s0_3,
                                AppSize.s0_5,
                                AppSize.s1_0
                              ],
                            ).createShader(
                              Rect.fromLTRB(AppSize.s0, AppSize.s0, rect.width,
                                  rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: AppSize.s560,
                            imageUrl:
                                ApisConstance.imagUlr(listItem.backdropPath!),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: ColorManager.grey,
                              highlightColor: ColorManager.lightGrey,
                              child: Container(
                                height: AppSize.s170,
                                width: AppSize.s120,
                                decoration: BoxDecoration(
                                  color: ColorManager.black,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s8),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(IconManager.erorr),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: PaddingSize.s16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      IconManager.circle,
                                      color: ColorManager.red,
                                      size: AppSize.s16,
                                    ),
                                    const SizedBox(width: AppSize.s4),
                                    Text(
                                      StringManager.onTheAir.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: PaddingSize.s16),
                                child: Text(
                                  listItem.name,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
    });
  }
}
