import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:somadiac_challenge/src/data/caracters_data.dart';

import '../playground/playground_screen.dart';

class CharacterSelectorScreen extends StatefulWidget {
  const CharacterSelectorScreen({super.key});

  @override
  State<CharacterSelectorScreen> createState() =>
      _CharacterSelectorScreenState();
}

class _CharacterSelectorScreenState extends State<CharacterSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    final isWebScreen = MediaQuery.of(context).size.width >= 600;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Select your player'),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: CharacterModel.caracters.length,
          gridDelegate: isWebScreen
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, crossAxisSpacing: 20, mainAxisSpacing: 20)
              : const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) {
            final charater = CharacterModel.caracters[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PlayGroundScreen(
                      character: charater,
                    );
                  },
                ));
              },
              child: Container(
                color: charater.color.withAlpha(25),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Lottie.asset(
                  charater.path,
                  fit: BoxFit.cover,
                  // repeat: false,
                  animate: false,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
