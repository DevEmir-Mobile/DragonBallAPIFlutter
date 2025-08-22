import 'package:conexion_a_api_provider/provider/character_provider.dart';
import 'package:conexion_a_api_provider/screens/screen_detail_character.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSearchDragonBall extends StatefulWidget {
  const ScreenSearchDragonBall({super.key});
  @override
  State<ScreenSearchDragonBall> createState() => _ScreenSearchDragonBallState();
}
class _ScreenSearchDragonBallState extends State<ScreenSearchDragonBall> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharacterProvider>().loadCharacters();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<CharacterProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Buscar Personaje')
        ),
      body: Column(
        children: [
          // 1) Campo de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Escribe el nombre del personaje",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: prov.search, 
            ),
          ),

          // 2) Lista o mensaje vacío, envuelto DIRECTAMENTE en Expanded
          Expanded(
            child: bodyResult(prov),
          ),
        ],
      ),
    );
  }

  /// Ahora solo devuelve el contenido, sin Expanded ni GestureDetector envolvente
  Widget bodyResult(CharacterProvider prov) {
    if (prov.characters.isEmpty) {
      return Center(child: Text('No hay resultados'));
    }

    return ListView.builder(
      itemCount: prov.characters.length,
      itemBuilder: (_, i) {
        final c = prov.characters[i];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ScreenDetailCharacter(character: c),
              ),
            );
          },
          child: ListTile(
            leading: Image.network(c.image),
            title: Text(c.name),
          ),
        );
      },
    );
  }
}
