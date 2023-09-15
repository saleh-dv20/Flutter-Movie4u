import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/strings_manager.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/details_tv_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/manager/values_manager.dart';
import '../../../movies/presntation/widgets/see_more_widget.dart';
import '../controller/popular_tv_controller.dart';
import 'details_tv_screen.dart';

class PopularTvScreen extends StatelessWidget {
  const PopularTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsDontroller = Get.find<DetailsTvController>();
    final controller = Get.find<PopularTvController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            StringManager.popularTV,
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
                //!ALSO HERE...
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
