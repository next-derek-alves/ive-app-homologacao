import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ivedigital/features/home/data/datasource/get_all_courses_datasource_implementation.dart';
import 'package:ivedigital/features/home/data/models/course_model.dart';
import 'package:ivedigital/features/home/data/repositories/get_all_courses_repository_implementation.dart';
import 'package:ivedigital/features/home/presenter/home_controller.dart';
import '../../../core/core.dart';

class HomePage extends GetView<HomeController> {
  final datasouce = Get.put(GetallCoursesDatasourceImplementation(Get.find()));
  final repository = Get.put(GetAllCoursesRepositoryImplementation(Get.find()));
  final controller = Get.put(HomeController(Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetStorage().read("token") == null
              ? TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.LOGIN);
                  },
                  child: Text(
                    "Entrar",
                    style: AppTextStyles.greyHeading,
                  ),
                )
              : Container(),
          SizedBox(width: 15)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.iveBanner),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.lightOrange),
                  child: Text(
                    "Assista a primeira aula gratuitamente",
                    style: AppTextStyles.whiteHeading,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Destaques",
                style: AppTextStyles.heading,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: 280, maxWidth: double.infinity),
                child: controller.obx((state) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.length,
                      itemBuilder: (_, index) {
                        final CourseModel item = state[index];
                        return CourseCard(
                            slug: item.slug,
                            videoTitle: item.name,
                            price: item.price.toString());
                      });
                }),
              ),
              Text(
                "Depoimentos",
                style: AppTextStyles.heading,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: 170, maxWidth: double.infinity),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    VideoCard(
                      videoUrl:
                          'https://player.vimeo.com/external/524408759.m3u8?s=dc0fa9898a598d3473d2940226aaea9eb83ac3d1',
                    ),
                    VideoCard(
                      videoUrl:
                          'https://player.vimeo.com/external/524408759.m3u8?s=dc0fa9898a598d3473d2940226aaea9eb83ac3d1',
                    ),
                    VideoCard(
                      videoUrl:
                          'https://player.vimeo.com/external/524408759.m3u8?s=dc0fa9898a598d3473d2940226aaea9eb83ac3d1',
                    ),
                    VideoCard(
                      videoUrl:
                          'https://player.vimeo.com/external/524408759.m3u8?s=dc0fa9898a598d3473d2940226aaea9eb83ac3d1',
                    ),
                    VideoCard(
                      videoUrl:
                          'https://player.vimeo.com/external/524408759.m3u8?s=dc0fa9898a598d3473d2940226aaea9eb83ac3d1',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.blueOpacity,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Cursos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: "Forum",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Conta",
          ),
        ],
      ),
    );
  }
}
