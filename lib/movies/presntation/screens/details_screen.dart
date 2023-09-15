import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cima_movies_clean/core/utils/is_loading.dart';
import 'package:cima_movies_clean/core/manager/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/networking/apis_constance.dart';
import '../controller/details_controller.dart';
import '../../../core/manager/colors_manager.dart';
import '../../../core/manager/values_manager.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DetailsController>(builder: (controller) {
      return controller.isLoading.value
          ? isLoading()
          : detailsWidget(context, controller);
    });
  }

  Scaffold detailsWidget(BuildContext context, DetailsController controller) {
    return Scaffold(
            // appBar: AppBar(),
            body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: AppSize.s250,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: AppSize.s500),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorManager.transparent,
                            ColorManager.black,
                            ColorManager.black,
                            ColorManager.transparent,
                          ],
                          stops: [
                            AppSize.s0,
                            AppSize.s0_5,
                            AppSize.s1,
                            AppSize.s1,
                          ],
                        ).createShader(
                          Rect.fromLTRB(AppSize.s0, AppSize.s0, rect.width,
                              rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl: ApisConstance.imagUlr(
                            controller.detailsData.backdropPath,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  from: AppSize.s20,
                  duration: const Duration(milliseconds: AppSize.s500),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSize.s16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.detailsData.title,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: AppSize.s8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSize.s2,
                                horizontal: AppSize.s8,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.lightGrey,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s4),
                              ),
                              child: Text(
                                controller.detailsData.releaseDate
                                    .split('-')[0],
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            const SizedBox(width: AppSize.s16),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: ColorManager.yellow,
                                  size: AppSize.s20,
                                ),
                                const SizedBox(width: AppSize.s4),
                                Text(
                                  (controller.detailsData.voteAverage / 2)
                                      .toStringAsFixed(1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall,
                                ),
                                const SizedBox(width: AppSize.s4),
                                //!  No theme here ...
                                Text(
                                  '(${controller.detailsData.voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              controller
                                  .moveiTime(controller.detailsData.runtime),
                              style:
                                  Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s20),
                        Text(
                          controller.detailsData.overview,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppSize.s8),
                        Text(
                          'Genres: ${controller.showGenres(controller.detailsData.genres)}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: AppSize.s30,
                        ),
                        Text(
                          StringManager.moreLikeThis,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: AppSize.s8,
                  crossAxisSpacing: AppSize.s8,
                  childAspectRatio: AppSize.s0_7,
                  crossAxisCount: AppSize.s3.toInt(),
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: controller.list.length,
                  (context, index) {
                    final recommendation = controller.list[index];
                    return FadeInUp(
                      from: AppSize.s20,
                      duration: const Duration(milliseconds: AppSize.s500),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s8)),
                        child: CachedNetworkImage(
                          imageUrl: ApisConstance.imagUlr(
                              recommendation.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: ColorManager.grey,
                            highlightColor: ColorManager.lightGrey,
                            child: Container(
                              height: AppSize.s170,
                              width: AppSize.s120,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s8),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(IconManager.erorr),
                          height: AppSize.s190,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ));
  }

}
