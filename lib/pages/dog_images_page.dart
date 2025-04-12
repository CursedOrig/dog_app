import 'package:dogapp/pages/dog_images_provider.dart';
import 'package:dogapp/tools/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../res/app_res.dart';

class DogImagesPage extends StatelessWidget {
  const DogImagesPage({super.key, required this.breed, this.subBreed});

  final String breed;
  final String? subBreed;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return DogImagesProvider(breed: breed, subBreed: subBreed)..fetchImages();
      },
      child: Scaffold(
        backgroundColor: AppColors.mainBg,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back, size: 32),
                style: AppBtnStyles.mainIconButtonStyle,
              ),
              Expanded(
                child: Text(
                  subBreed == null ? breed.capFirst : '${subBreed!.capFirst} ${breed.capFirst}',
                  textAlign: TextAlign.center,
                  style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(width: 44),
            ],
          ),
          backgroundColor: AppColors.mainBg,
        ),
        body: Consumer<DogImagesProvider>(
          builder: (BuildContext context, dogImgProv, Widget? child) {
            return ListView.builder(
                itemCount: dogImgProv.dogImages.length,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: AppDeco.mainDeco,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Image.network(
                            dogImgProv.dogImages[index],
                            fit: BoxFit.fill,
                            errorBuilder: (_, __, ___) => Stack(
                              fit: StackFit.passthrough,
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  AppImages.preloaderImg,
                                  height: 250,
                                ),
                                const Center(
                                  child: OutlinedText(
                                    text: 'Error loading image',
                                    textColor: AppColors.mainBg,
                                    borderColor: AppColors.layer1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.layer4,
                          border: Border.all(color: AppColors.mainBg),
                        ),
                        height: 40,
                        width: 40,
                        child: Text(
                          '${index + 1}',
                          style: AppTypo.body1.copyWith(color: AppColors.layer1),
                        ),
                      )
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}

class OutlinedText extends StatelessWidget {
  const OutlinedText({
    super.key,
    required this.text,
    required this.textColor,
    required this.borderColor,
  });

  final String text;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = borderColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
