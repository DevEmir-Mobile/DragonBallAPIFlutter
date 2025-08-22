import 'package:conexion_a_api_provider/models/character.dart';
import 'package:flutter/material.dart';
class ScreenDetailCharacter extends StatelessWidget {
  final Character character;
  const ScreenDetailCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name,style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipRect(child: SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.network(character.image))),
            SizedBox(height: 30),
          Center(
            child: Text(character.name, style: const TextStyle(fontSize: 30, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(character.description, style: const TextStyle( fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}