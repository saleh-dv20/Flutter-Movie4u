import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:cima_movies_clean/core/networking/apis_constance.dart';
import 'package:cima_movies_clean/core/utils/is_loading.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_recommendations_entiti.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/details_tv_controller.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsTvScreen extends StatelessWidget {
  final int id;
  const DetailsTvScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // TabController _abController = TabController(length: 3, vsync: this,);

    return GetX<DetailsTvController>(builder: (controller) {
      return controller.isLo.value
          ? isLoading()
          : detailsWidget(context, controller, id);
    });
  }
}

Scaffold detailsWidget(
    BuildContext context, DetailsTvController controller, int tvId) {
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
                  Rect.fromLTRB(
                      AppSize.s0, AppSize.s0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                imageUrl: ApisConstance.imagUlr(
                  controller.details.backdropPath!,
                ),
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
                  controller.details.name,
                  style: Theme.of(context).textTheme.headlineMedium,
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
                        borderRadius: BorderRadius.circular(AppSize.s4),
                      ),
                      child: Text(
                        controller.details.firstAirDate.split('-')[0],
                        style: Theme.of(context).textTheme.bodySmall,
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
                          (controller.details.voteAverage / 2)
                              .toStringAsFixed(1),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: AppSize.s4),
                        //!  No theme here ...
                        Text(
                          '(${controller.details.voteAverage})',
                          style: const TextStyle(
                            fontSize: 1.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: AppSize.s12),
                    Text(
                      '${controller.details.seasonNumber} Season',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: AppSize.s10),
                    Text(
                      controller.moveiTime(controller.details.runtime!),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                // all more like this is downblew
                const SizedBox(height: AppSize.s20),
                Text(
                  controller.details.overView,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSize.s8),
                Text(
                  'Genres: ${controller.showGenres(controller.details.genres)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),

                const SizedBox(
                  height: AppSize.s8,
                ),
                // Top Tab bar
                SizedBox(
                  child: TabBar(
                    controller: controller.controller,
                    labelColor: ColorManager.white,
                    unselectedLabelColor: ColorManager.lightGrey,
                    indicatorColor: ColorManager.red,
                    isScrollable: false,
                    onTap: (value) {
                      //! To get Episode Items...
                      controller.getEpisodes(
                        tvId,
                        controller.details.seasonNumber,
                      );
                    },
                    tabs: controller.list,
                  ),
                ),
                // Items Episodes and more like this..
                const SizedBox(
                  height: AppSize.s8,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: AppSize.s400,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.controller,
                    children: [
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.episodes.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: AppSize.s18,
                        ),
                        itemBuilder: (context, index) {
                          final items = controller.episodes[index];
                          return controller.isEpLo.value
                              ? isLoading()
                              : episodesWidget(
                                  context,
                                  image: items.stillPath!,
                                  name: items.name,
                                  date: items.airDate,
                                  overview: items.overView,
                                  episodeNumber: items.episodeNumber,
                                );
                        },
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: AppSize.s8,
                          crossAxisSpacing: AppSize.s8,
                          childAspectRatio: AppSize.s0_7,
                          crossAxisCount: AppSize.s3.toInt(),
                        ),
                        itemCount: controller.recommendations.length,
                        itemBuilder: (context, index) {
                          final recommendation =
                              controller.recommendations[index];
                          return tvMore(recommendation);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // More Like this...
      // SliverGrid(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     mainAxisSpacing: AppSize.s8,
      //     crossAxisSpacing: AppSize.s8,
      //     childAspectRatio: AppSize.s0_7,
      //     crossAxisCount: AppSize.s3.toInt(),
      //   ),
      //   delegate: SliverChildBuilderDelegate(
      //     childCount: controller.recommendations.length,
      //     (context, index) {
      //       final recommendation = controller.recommendations[index];
      //       return FadeInUp(
      //         from: AppSize.s20,
      //         duration: const Duration(milliseconds: AppSize.s500),
      //         child: ClipRRect(
      //           borderRadius:
      //               const BorderRadius.all(Radius.circular(AppSize.s8)),
      //           child: CachedNetworkImage(
      //             imageUrl: ApisConstance.imagUlr(recommendation.backdropPath!),
      //             placeholder: (context, url) => Shimmer.fromColors(
      //               baseColor: ColorManager.grey,
      //               highlightColor: ColorManager.lightGrey,
      //               child: Container(
      //                 height: AppSize.s170,
      //                 width: AppSize.s120,
      //                 decoration: BoxDecoration(
      //                   color: Colors.black,
      //                   borderRadius: BorderRadius.circular(AppSize.s8),
      //                 ),
      //               ),
      //             ),
      //             errorWidget: (context, url, error) =>
      //                 const Icon(IconManager.erorr),
      //             height: AppSize.s190,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      // )

      //
    ],
  ));
}

//! All widgets of Details Screen are here... 
FadeInUp tvMore(RecommendationsEntiti recommendation) {
  return FadeInUp(
    from: AppSize.s20,
    duration: const Duration(milliseconds: AppSize.s500),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      child: CachedNetworkImage(
        imageUrl: ApisConstance.imagUlr(recommendation.backdropPath!),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: ColorManager.grey,
          highlightColor: ColorManager.lightGrey,
          child: Container(
            height: AppSize.s170,
            width: AppSize.s120,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(IconManager.erorr),
        height: AppSize.s190,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget episodesWidget(
  BuildContext context, {
  required String image,
  required String name,
  required String date,
  required String overview,
  required int episodeNumber,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SizedBox(
            width: AppSize.s140,
            height: AppSize.s100,
            child: FadeInUp(
              from: AppSize.s20,
              duration: const Duration(milliseconds: AppSize.s500),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppSize.s8)),
                child: CachedNetworkImage(
                  imageUrl: ApisConstance.imagUlr(image),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: ColorManager.grey,
                    highlightColor: ColorManager.lightGrey,
                    child: Container(
                      height: AppSize.s170,
                      width: AppSize.s120,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(IconManager.erorr),
                  height: AppSize.s190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //
          Column(children: [
            Row(
              children: [
                const SizedBox(
                  width: AppSize.s15,
                ),
                Text(
                  '$episodeNumber. ',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  width: AppSize.s145,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ])
        ],
      ),
      //
      const SizedBox(height: AppSize.s8),
      Text(
        overview,
        style: Theme.of(context).textTheme.bodySmall,
      )
    ],
  );
}
