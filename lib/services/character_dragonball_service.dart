import 'dart:convert';
import 'package:conexion_a_api_provider/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterDragonballService {
  static const _baseUrl = "https://dragonball-api.com/api/characters";

  Future<List<Character>> getCharacter({int limit = 20}) async {
    final uri = Uri.parse("$_baseUrl?limit=$limit");
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Error al cargar personajes (status ${response.statusCode})');
    }

    // Decodifica la respuesta
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;

    // Extrae sólo el array de "items"
    final rawList = decoded['items'] as List<dynamic>?;

    if (rawList == null) {
      // Esto ya no debería suceder
      throw Exception('La respuesta no contiene "items"');
    }

    // Mapea cada entrada al modelo Character
    return rawList
        .map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
