import 'dart:convert';
import 'package:dogapp/widgets/preloader_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogBreedsPage extends StatefulWidget {
  const DogBreedsPage({super.key});

  @override
  State<DogBreedsPage> createState() => _DogBreedsPageState();
}

class _DogBreedsPageState extends State<DogBreedsPage> {
  List<String> breeds = [];

  String _capitalizeFirstLetter(String text) { // todo extract
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void initState() {
    super.initState();
    fetchBreeds();
  }

  Future<void> fetchBreeds() async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final Map<String, dynamic> breedMap = data['message'];

        setState(() {
          breeds = breedMap.keys.toList();
        });
      } else {
        setState(() {
          breeds = ['Server error'];
        });
      }
    } catch (e) {
      setState(() {
        breeds = ['No internet'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Hero(
          tag: 'hero1',
          child: PreloaderSubtitle(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: breeds.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: breeds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _capitalizeFirstLetter(breeds[index]),
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
    );
  }
}
