import 'package:cached_network_image/cached_network_image.dart';
import 'package:cima_movies_clean/core/networking/apis_constance.dart';
import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SeeMoreWidget extends StatelessWidget {
  final String title, backdropPath, releaseDate, overview;
  final double voteAverage;
  const SeeMoreWidget({
    super.key,
    required this.title,
    required this.backdropPath,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
  
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: Container(
        height: AppSize.s190,
        decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Row(
          children: [
            // image ....
            seemoreImagewidgt(backdropPath: backdropPath ),
            // Right side details..
            Padding(
              padding: const EdgeInsets.all(AppSize.s10),
              child: seeMoreRightSideWidget(context, title: title, releaseDate: releaseDate, overview: overview, voteAverage: voteAverage)
            )
          ],
        ),
      ),
    );
  }
  //
  Column seeMoreRightSideWidget( BuildContext context,
    {required String title,required String releaseDate,required String overview , required double voteAverage}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: AppSize.s190,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      //
      const SizedBox(height: AppSize.s10),
      Row(
        children: [
          Container(
            height: AppSize.s40,
            width: AppSize.s80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s4),
              color: ColorManager.red,
            ),
            child: Center(
              child: Text(
                releaseDate,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(width: AppSize.s10),
          const Icon(
            IconManager.star,
            color: ColorManager.yellow,
            size: AppSize.s30,
          ),
          const SizedBox(width: AppSize.s4),
          Text(
            '$voteAverage',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s30),
      // Discrption ....
      SizedBox(
        width: AppSize.s190,
        child: Text(
          overview,
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: true,
        ),
      )
    ],
  );
}
 Padding seemoreImagewidgt( {required String backdropPath,}) {
    return Padding(
                  padding: const EdgeInsets.all(AppSize.s4),
                  child: CachedNetworkImage(
                    imageUrl: ApisConstance.imagUlr(backdropPath),
                    imageBuilder: (context, imageProvider) => Container(
                      height: AppSize.s560,
                      width: AppSize.s120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: ColorManager.grey,
                      highlightColor: ColorManager.lightGrey,
                      child: Container(
                        height: AppSize.s170,
                        width: AppSize.s120,
                        decoration: BoxDecoration(
                          color: ColorManager.black,
                          borderRadius: BorderRadius.circular(AppSize.s8),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(IconManager.erorr),
                  ),
                );
  }

}
