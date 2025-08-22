// Aca es donde se parsea los datos para despues ser usados en el provider
class Character {
  final int id;          // ahora un entero
  final String name;
  final String image;
  final String description;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.description
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"] as int,
      name: json["name"] as String,
      image: json["image"] as String,
      description: json["description"] as String,
    );
  }
}
