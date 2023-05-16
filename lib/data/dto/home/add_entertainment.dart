import 'package:my_family/data/model/entertainment/suggestions.dart';

import '../../repository/user_repository.dart';

class AddEntertainmentDTO{
  AddEntertainmentDTO({required this.title, required this.suggestions});

  final String title;
  final List<Suggestions> suggestions;

  Map<String, dynamic> toJson() => {'title': title, 'familyUserName': UserRepository.getUser?.familyName, 'suggestions': suggestions.map((e) => e.toJson()).toList()};
}