
import 'package:dogapp/pages/dog_breeds_provider.dart';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/widgets/preloader_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 40,
                ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: dbp.breeds.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        height: 48,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: AppDeco.mainDeco,
                        child: Text(
                          _capitalizeFirstLetter(dbp.breeds[index]),
                          style: AppTypo.body1,
                        ),
                      );
                    },
                  )),
      ),
    );
  }

  String _capitalizeFirstLetter(String text) {
    // todo extract
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
