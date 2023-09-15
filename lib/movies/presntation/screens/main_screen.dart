import 'package:cima_movies_clean/core/manager/colors_manager.dart';
import 'package:cima_movies_clean/core/manager/values_manager.dart';
import 'package:cima_movies_clean/movies/presntation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: bottomNavigateWidget(controller),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.screens,
        ),
      );
    });
  }
}

Widget bottomNavigateWidget(MainController controller) {
  return BottomNavigationBar(
    backgroundColor: ColorManager.black,
    currentIndex: controller.currentIndex.value,
    iconSize: AppSize.s60,
    selectedItemColor: ColorManager.white,
    unselectedItemColor: ColorManager.lightGrey,
    elevation: 0,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.movie), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.tv), label: ''),
    ],
    onTap: (index) {
      controller.currentIndex.value = index;
    },
  );
}
