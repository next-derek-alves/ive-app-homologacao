import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivedigital/core/app_colors.dart';
import 'package:get/get.dart';

class ButtonLandingPage extends StatelessWidget {
  final String title;
  final Color color;
  final String route;

  const ButtonLandingPage({
    Key? key,
    required this.title,
    required this.color,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: screenWidth * 0.9),
      child: ElevatedButton(
        onPressed: () {
          Get.offNamed(route);
        },
        child: Text(
          title,
          style: GoogleFonts.k2d(
            color: AppColors.black,
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
