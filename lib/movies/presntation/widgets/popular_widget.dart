import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cima_movies_clean/core/networking/apis_constance.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/is_loading.dart';
import '../../domain/usecase/get_details_movie.dart';
import '../controller/details_controller.dart';
import '../controller/popular_controller.dart';
import '../../../core/manager/values_manager.dart';
import '../screens/details_screen.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PopularController>();
    final detailsController = Get.find<DetailsController>();

    return Obx(() {
      return controller.isLoading.value
          ? isLoading()
          : FadeIn(
              duration: const Duration(milliseconds: AppSize.s500),
              child: SizedBox(
                height: AppSize.s170,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                  itemCount: controller.populaList.length,
                  itemBuilder: (context, index) {
                    final movie = controller.populaList[index];
                    return Container(
                      padding: const EdgeInsets.only(right: AppSize.s8),
                      child: InkWell(
                        onTap: () {
                          //  To Details Screen.....
                          Get.to(const DetailsScreen());
                          detailsController.getDetailsMovie(
                            DetailsPrammetrs(detailsId: movie.id),
                          );
                          // recommendation data...
                          detailsController.getRecommendationData(
                            RecommndationPrammetrs(id: movie.id),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s8)),
                          child: CachedNetworkImage(
                            width: AppSize.s120,
                            fit: BoxFit.cover,
                            imageUrl: ApisConstance.imagUlr(
                              movie.backdropPath,
                            ),
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
                      ),
                    );
                  },
                ),
              ),
            );
      //;
    });
  }
}
