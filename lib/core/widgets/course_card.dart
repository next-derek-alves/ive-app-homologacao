import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:ivedigital/core/app_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivedigital/core/app_routes.dart';

import '../app_colors.dart';

class CourseCard extends StatelessWidget {
  final String videoTitle;
  final String slug;
  final String price;

  const CourseCard(
      {Key? key,
      required this.videoTitle,
      required this.price,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      // GetStorage().read("token") == null
      //     ? Get.toNamed(AppRoutes.CREATE_ACCOUNT)
      //     : Get.toNamed(AppRoutes.COURSE, arguments: slug),
      child: Container(
        margin: EdgeInsets.only(right: 15),
        width: 280,
        height: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                SizedBox(height: 10),
                Text(
                  videoTitle,
                  style: GoogleFonts.k2d(
                    color: AppColors.grey,
                    fontSize: 20,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "R\$ $price",
              style: GoogleFonts.k2d(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
