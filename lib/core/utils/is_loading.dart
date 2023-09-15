import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:flutter/material.dart';

import '../manager/colors_manager.dart';

Widget isLoading() {
  return const SizedBox(
    height: AppSize.s300,
    child: Center(
      child: CircularProgressIndicator(
        color: ColorManager.white,
      ),
    ),
  );
}
