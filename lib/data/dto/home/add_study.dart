import '../../model/study/subjects.dart';
import '../../repository/user_repository.dart';

class AddStudyDTO{
  AddStudyDTO({required this.childId, required this.subjects});

  final String childId;
  List<Subject> subjects;

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map['child'] = childId;
    map['familyUserName'] = UserRepository.getUser?.familyName;
    map['subjects'] = subjects.map((e) => e.toJson()).toList();
    return map;
  }
}