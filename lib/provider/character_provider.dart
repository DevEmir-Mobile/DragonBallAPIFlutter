import 'package:conexion_a_api_provider/models/character.dart';
import 'package:conexion_a_api_provider/services/character_dragonball_service.dart';
import 'package:flutter/material.dart';

class CharacterProvider with ChangeNotifier {
  final CharacterDragonballService _service = CharacterDragonballService();

  List<Character> _allCharacters = [];
  List<Character> _filteredCharacters = [];

  List<Character> get characters => _filteredCharacters;

  /// Llama a la API y guarda ambas listas
  Future<void> loadCharacters() async {
    _allCharacters = await _service.getCharacter();
    // al inicio, muestro todo
    _filteredCharacters = List.from(_allCharacters);
    notifyListeners();
  }

  /// Filtra la lista según el query (case‑insensitive)
  void search(String query) {
    if (query.isEmpty) {
      _filteredCharacters = List.from(_allCharacters);
    } else {
      final q = query.toLowerCase();
      _filteredCharacters = _allCharacters
          .where((character) => character.name.toLowerCase().contains(q))
          .toList();
    }
    notifyListeners();
  }
}
