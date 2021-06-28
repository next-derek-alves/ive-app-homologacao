import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivedigital/core/app_colors.dart';
import 'package:ivedigital/core/app_text_style.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class InstitutionalVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InstitutionalVideoState();
  }
}

class _InstitutionalVideoState extends State<InstitutionalVideo> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(Get
                .arguments["url"] !=
            null
        ? Get.arguments["url"]
        : 'https://player.vimeo.com/external/524408759.m3u8?s=dc0fa9898a598d3473d2940226aaea9eb83ac3d1');
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments["title"] != null
              ? Get.arguments["title"]
              : "Video Institucional",
          style: AppTextStyles.whiteAppBarTitle,
        ),
        backgroundColor: AppColors.lightOrange,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Carregando'),
                      ],
                    ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Somos uma empresa de desenvolvimento humano, com a finalidade de oferecer a você cursos exclusivos e únicos no universo digital. Usamos uma metodologia própria que foi testada e aprovada por muitos alunos que utilizaram dessas ferramentas e conhecimento para obter os melhores resultados em suas vidas.",
                          style: GoogleFonts.k2d(
                            color: AppColors.blue,
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // SizedBox(height: 20),
                        // Container(
                        //   height: 190,
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(AppImages.bigLogo),
                        //         fit: BoxFit.fitHeight),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.lightOrange,
                    ),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("+ de 50.000 alunos",
                            style: AppTextStyles.whiteHeading24),
                        SizedBox(height: 10),
                        Text("+ de 500 empresas",
                            style: AppTextStyles.whiteHeading24),
                        SizedBox(height: 10),
                        Text("+ de 6 estados",
                            style: AppTextStyles.whiteHeading24),
                        SizedBox(height: 10),
                        Text("+ de 18 anos de história",
                            style: AppTextStyles.whiteHeading24),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
