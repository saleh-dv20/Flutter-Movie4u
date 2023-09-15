import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:cima_movies_clean/core/networking/apis_constance.dart';
import 'package:cima_movies_clean/core/utils/is_loading.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/details_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/popular_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/screens/details_tv_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PopularTvWidget extends StatelessWidget {
  const PopularTvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PopularTvController>();
    final detailsController = Get.find<DetailsTvController>();
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
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    final tv = controller.list[index];
                    return Container(
                      padding: const EdgeInsets.only(right: AppSize.s8),
                      child: InkWell(
                        onTap: () {
                          //  To Details Screen.....
                          //! ID ALSO PASED HERE
                          Get.to( DetailsTvScreen(id: tv.id,),);
                          detailsController.getDetails(tv.id);

                          // recommendation data...
                          detailsController.getRecommendations(tv.id);
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s8)),
                          child: CachedNetworkImage(
                            width: AppSize.s120,
                            fit: BoxFit.cover,
                            imageUrl: ApisConstance.imagUlr(
                              tv.backdropPath!,
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
