import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_family/data/repository/user_repository.dart';

import '../../../../data/dto/home/add_group.dart';
import '../../../../data/repository/chat/group_repo.dart';
import '../../../../data/repository/member/children_repo.dart';
import '../../../../data/repository/member/helpers_repository.dart';
import '../../../../ui/helper/app_toast.dart';
import '../../../../ui/helper/navigator.dart';
import '../../../../ui/resources/app_images.dart';
import '../../../../ui/screens/home/home_screen.dart';

part 'add_chat_state.dart';

class AddChatCubit extends Cubit<AddChatState> {
  AddChatCubit() : super(AddChatInitial());

  /// SELECTORS:
  List<bool> selectedHelpers = List.generate(HelpersRepo.helpers.length, (index) => false);
  toggleHelpers(index){
    selectedHelpers[index] = !selectedHelpers[index];
    emit(ToggleHelpers());
  }

  List<bool> selectedChildren = List.generate(ChildrenRepo.children.length, (index) => false);
  toggleChildren(index){
    selectedChildren[index] = !selectedChildren[index];
    emit(ToggleChildren());
  }


  /// CREATE GROUP
  GlobalKey<FormState> groupNameKey = GlobalKey<FormState>();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  createGroup(context) async {
    if (groupNameKey.currentState?.validate() ?? false) {
      if (selectedChildren.where((element) => element).isEmpty &&
          selectedHelpers.where((element) => element).isEmpty) {
        AppToast.toast(msg: 'Add at least one member');
        return;
      }
      List<String> children = [];
      selectedChildren.asMap().forEach((i, value) {
        if(value)children.add(ChildrenRepo.children[i].id);
      });
      
      List<String> helpers = [];
      selectedHelpers.asMap().forEach((i, value) {
        if(value)helpers.add(HelpersRepo.helpers[i].id!);
      });

      final success = await GroupRepo().createGroup(CreateGroupDTO(
        parentID: UserRepository.getUser!.id!,
        groupName: groupNameController.text,
        groupDescription: descriptionController.text, children: children, helpers: helpers,
      ));
      if(success){
        await GroupRepo().getGroups();
        popALlAndPushPage(context, const HomeScreen());
      }
    }
  }

  int? selectedPicIndex;
  List<String> groupPics = [
    AppImages.groupOne,
    AppImages.groupTwo,
    AppImages.groupThree,
    AppImages.groupFour,
    AppImages.groupFive,
    AppImages.groupSix,
    AppImages.groupSeven,
    AppImages.groupEight
  ];

  String get groupPic => groupPics[selectedPicIndex??0];
  void changeGroupPic(index) {
    selectedPicIndex = index;
    emit(ChangeGroupPic());
  }
}
