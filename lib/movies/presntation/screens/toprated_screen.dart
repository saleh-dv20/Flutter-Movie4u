import 'package:cima_movies_clean/movies/presntation/controller/details_controller.dart';
import 'package:cima_movies_clean/movies/presntation/controller/top_rated_controller.dart';
import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/strings_manager.dart';
import 'package:cima_movies_clean/movies/presntation/widgets/see_more_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecase/get_details_movie.dart';
import '../../domain/usecase/get_recommendation_use_case.dart';
import '../../../core/manager/values_manager.dart';
import 'details_screen.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsController = Get.find<DetailsController>();
    return GetX<TopRatedController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            StringManager.topRatedMovies,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          backgroundColor: ColorManager.black,
          centerTitle: true,
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSize.s10),
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            final movie = controller.list[index];
            return InkWell(
              onTap: (){
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
      ),
    );
  }
}
