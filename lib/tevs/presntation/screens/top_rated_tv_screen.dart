import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/strings_manager.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:cima_movies_clean/movies/presntation/widgets/see_more_widget.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/details_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/top_rated_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/screens/details_tv_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopRatedTvScreen extends StatelessWidget {
  const TopRatedTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsDontroller = Get.find<DetailsTvController>();
    return GetX<TopRatedTvController>(
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
              onTap: () {
                //  To Details Screen.....
                // !ALSO HERE...
                Get.to(DetailsTvScreen(id: movie.id,),);
                detailsDontroller.getDetails(movie.id);

                // recommendation data...
                detailsDontroller.getRecommendations(movie.id);
              },
              child: SeeMoreWidget(
                title: movie.name,
                backdropPath: movie.backdropPath!,
                releaseDate: movie.firstAirDate,
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
