import 'package:dogapp/pages/dog_breeds_provider.dart';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/widgets/preloader_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tools/extensions.dart';

class DogBreedsPage extends StatelessWidget {
  const DogBreedsPage({super.key});

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
            builder: (cont, dbp, p2) => dbp.breeds.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: dbp.breeds.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        height: 48,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: AppDeco.mainDeco,
                        child: Text(
                          dbp.breeds[index].capFirst,
                          style: AppTypo.body1,
                        ),
                      );
                    },
                  )),
      ),
    );
  }


}
