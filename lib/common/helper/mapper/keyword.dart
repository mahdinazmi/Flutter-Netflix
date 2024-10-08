import 'package:netflix/core/entity/keyword.dart';
import 'package:netflix/core/models/keyword.dart';

class KeywordMapper {

  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(
      name: keywordModel.name,
      id: keywordModel.id
    );
  }
}