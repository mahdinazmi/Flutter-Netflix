class KeywordModel {
  KeywordModel({
    required this.name,
    required this.id,
  });

  final String ? name;
  final int ? id;

  factory KeywordModel.fromJson(Map < String, dynamic > json) {
    return KeywordModel(
      name: json["name"],
      id: json["id"],
    );
  }

}