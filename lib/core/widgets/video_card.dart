import 'package:flutter/material.dart';
import 'package:ivedigital/core/app_colors.dart';
import 'package:get/get.dart';
import 'package:ivedigital/core/app_routes.dart';

import '../app_images.dart';

class VideoCard extends StatelessWidget {
  final String videoUrl;

  const VideoCard({Key? key, required this.videoUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.INSTITUTIONAL_VIDEO,
        arguments: {"url": videoUrl, "title": "Depoimentos"},
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            height: 170,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.defaultImgVideo),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 100,
            child: IconButton(
              iconSize: 70,
              color: AppColors.lightOrange,
              icon: Icon(Icons.play_arrow_rounded),
              onPressed: () => Get.toNamed(
                AppRoutes.INSTITUTIONAL_VIDEO,
                arguments: {"url": videoUrl, "title": "Depoimentos"},
              ),
            ),
          )
        ],
      ),
    );
  }
}
