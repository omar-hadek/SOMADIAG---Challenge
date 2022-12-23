import 'package:flutter/material.dart';

class CharacterModel {
  final String name;
  final String path;
  final Color color;
  CharacterModel({
    required this.name,
    required this.path,
    required this.color,
  });

  static List<CharacterModel> caracters = [
    CharacterModel(
        name: 'Fiendly Bee',
        path: '${lottiePath}ceras_bee.json',
        color: Colors.teal),
    CharacterModel(
        name: 'Canejo', path: '${lottiePath}conejo.json', color: Colors.pink),
    CharacterModel(
        name: 'earkick',
        path: '${lottiePath}earkick.json',
        color: Colors.orange),
    CharacterModel(
        name: 'Elephant',
        path: '${lottiePath}elephant.json',
        color: Colors.red),
    CharacterModel(
        name: 'Flying bat',
        path: '${lottiePath}flying-bat.json',
        color: Colors.amber),
    CharacterModel(
        name: 'Cute Tiger',
        path: '${lottiePath}cute-tiger.json',
        color: Colors.lightGreen),
    CharacterModel(
        name: 'Jumping Frog',
        path: '${lottiePath}jumping-frog.json',
        color: Colors.brown),
    CharacterModel(
        name: 'Cute Caterpillar',
        path: '${lottiePath}cute-caterpillar.json',
        color: Colors.purple),
    CharacterModel(
        name: 'Jumping Chicken',
        path: '${lottiePath}jumping-chicken.json',
        color: Colors.blueAccent),
  ];
}

String lottiePath = 'assets/animation/lottie/';
