import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_family/core/enums/member_type.dart';
import 'package:my_family/data/repository/member/children_repo.dart';
import 'package:my_family/data/repository/member/helpers_repository.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../../data/dto/account/add_member.dart';
import '../../../../data/repository/member/add_member.dart';
import '../../../../ui/helper/app_toast.dart';

part 'add_member_state.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit() : super(AddMemberInitial());


  init(){
    membersCounts = ChildrenRepo.children.length > 8 ? [] : List.generate(8 - ChildrenRepo.children.length, (index) => index + 1);
    emit(AddMemberInitial());
  }

  MemberType memberType = MemberType.child;
  changeType(MemberType? value) {
    memberType = value??MemberType.child;
    if(memberType == MemberType.child){
      membersCounts = ChildrenRepo.children.length > 8 ? [] : List.generate(8 - ChildrenRepo.children.length, (index) => index + 1);
    } else {
      membersCounts = HelpersRepo.helpers.length > 4 ? [] : List.generate(4 - HelpersRepo.helpers.length, (index) => index + 1);
      if(membersCount > membersCounts.length) membersCount = membersCounts.length;
    }
    emit(ChangeType());
  }

  int membersCount = 1;
  List<int> membersCounts = [];
  changeMembersCount(int count){
    membersCount = count;
    emit(ChangeMembersCount());
  }

  List<TextEditingController> membersControllers = List.generate(8, (index) => TextEditingController());
  List<GlobalKey<FormState>> membersKeys = List.generate(8, (index) => GlobalKey<FormState>());

  /// Helpers
  List<List<int>> selectedPermissions = List.generate(4, (index) => []);

  addMember(context) async {
    emit(Loading());
    final isChild = memberType == MemberType.child;
    List<Member> members = membersControllers.sublist(0, membersCount).asMap().map((i, e) => MapEntry(i, Member(email: e.text, permissions: selectedPermissions[i]))).values.toList();

    bool ret = false;
    for (int i = 0; i < members.length; i++) {
      var member = members[i];
      if(!(membersKeys[i].currentState?.validate()??false)){
        ret = true;
        break;
      } if(!isChild && member.permissions.isEmpty){
        AppToast.toast(msg: 'Select at least one permission');
        ret = true;
        break;
      }
    }
    if(ret) {
      emit(Done());
      return;
    }

    final success = await AddMemberRepo.addMember(AddMemberDTO(memberType: memberType, members: members));
    if(success) {
      if(isChild) {
        ChildrenRepo.getChildren();
      } else{
        HelpersRepo.getHelpers();
      }
      emit(Done());
      pop(context);
    }
  }
}
