import 'dart:math';
import 'package:dogapp/pages/dog_breeds_provider.dart';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/tools/extensions.dart';
import 'package:dogapp/widgets/preloader_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogBreedsPage extends StatefulWidget {
  const DogBreedsPage({super.key});

  @override
  State<DogBreedsPage> createState() => _DogBreedsPageState();
}

class _DogBreedsPageState extends State<DogBreedsPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInCirc,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DogBreedsProvider()..fetchBreeds(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const SizedBox(width: 44),
              const Expanded(
                child: Hero(
                  tag: 'hero1',
                  child: PreloaderSubtitle(),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings, size: 32),
                style: AppBtnStyles.mainIconButtonStyle,
              ),
            ],
          ),
          backgroundColor: AppColors.mainBg,
        ),
        backgroundColor: AppColors.mainBg,
        body: Consumer<DogBreedsProvider>(
            builder: (context, breedProv, widget) => breedProv.breeds.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: breedProv.breeds.length,
                    itemBuilder: (context, index) {
                      final currentBreed = breedProv.breeds[index];
                      controller.forward(); /// start anim

                      return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget? child) {
                          final animValue = animation.value * 3.0 - index / breedProv.breeds.length;
                          final safeOpacityValue = min(max(animValue, 0.0), 1.0);

                          return Opacity(
                            opacity: safeOpacityValue,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: AppDeco.mainDeco,
                              child: currentBreed.subBreeds.isEmpty
                                  ? _BreedTile(title: currentBreed.breed)
                                  : ListTileTheme.merge(
                                      minVerticalPadding: 0,
                                      minTileHeight: 0,
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        shape: LinearBorder.none,
                                        collapsedShape: LinearBorder.none,
                                        tilePadding: EdgeInsets.zero,
                                        childrenPadding: const EdgeInsets.only(left: 16),
                                        iconColor: AppColors.layer5,
                                        collapsedIconColor: AppColors.layer5,
                                        title: _BreedTile(title: currentBreed.breed),
                                        children: currentBreed.subBreeds.map((s) => _BreedTile(title: s)).toList(),
                                      ),
                                    ),
                            ),
                          );
                        },
                      );
                    },
                  )),
      ),
    );
  }
}

class _BreedTile extends StatelessWidget {
  const _BreedTile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      // color: Colors.yellowAccent.withValues(alpha: 0.2),
      height: 44,
      child: Text(
        title.capFirst,
        style: AppTypo.body1.copyWith(color: AppColors.layer1),
      ),
    );
  }
}
