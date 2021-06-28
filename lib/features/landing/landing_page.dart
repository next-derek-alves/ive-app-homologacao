import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivedigital/core/app_colors.dart';
import 'package:ivedigital/core/app_images.dart';
import 'package:ivedigital/core/app_routes.dart';
import 'package:ivedigital/features/landing/components/button_landing_widget.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      var screenWidth = constraints.maxWidth;
      return Material(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            color: AppColors.blue,
            child: Column(
              children: [
                Container(
                  child: Text.rich(
                    TextSpan(
                      text: "Conquiste ",
                      children: [
                        TextSpan(
                          text: "todos ",
                          style: TextStyle(color: AppColors.lightOrange),
                        ),
                        TextSpan(
                          text: "seus objetivos",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.k2d(
                      color: AppColors.white,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    AppImages.whiteLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonLandingPage(
                        title: "Conheça nossos cursos",
                        color: AppColors.lightOrange,
                        route: AppRoutes.HOME,
                      ),
                      // SizedBox(height: 10),
                      ButtonLandingPage(
                        title: "Entrar",
                        color: AppColors.white,
                        route: AppRoutes.LOGIN,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
