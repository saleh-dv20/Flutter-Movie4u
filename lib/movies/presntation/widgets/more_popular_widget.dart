import 'package:cima_movies_clean/movies/presntation/controller/details_controller.dart';
import 'package:cima_movies_clean/movies/presntation/controller/popular_controller.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:cima_movies_clean/movies/presntation/widgets/see_more_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecase/get_details_movie.dart';
import '../../domain/usecase/get_recommendation_use_case.dart';
import '../screens/details_screen.dart';

class MorePopularWidger extends StatelessWidget {
  const MorePopularWidger({super.key});
  @override
  Widget build(BuildContext context) {
    final detailsController = Get.find<DetailsController>();
    final controller = Get.find<PopularController>();
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSize.s15),
        itemCount: controller.populaList.length,
        itemBuilder: (constex, index) {
          final movie = controller.populaList[index];
          return InkWell(
            onTap: () {
              // To Details Screen.....
              Get.to(const DetailsScreen());
              detailsController
                  .getDetailsMovie(DetailsPrammetrs(detailsId: movie.id));
              // recommendation data...
              detailsController
                  .getRecommendationData(RecommndationPrammetrs(id: movie.id));
            },
            child: SeeMoreWidget(
              title: movie.title,
              backdropPath: movie.backdropPath,
              releaseDate: movie.releaseDate,
              overview: movie.overview,
              voteAverage: movie.voteAverage,
            ),
          );
        },
      ),
    );
  }
}
