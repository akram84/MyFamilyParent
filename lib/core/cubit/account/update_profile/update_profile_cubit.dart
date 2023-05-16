import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:my_family/data/dto/account/update_profile.dart';
import 'package:my_family/data/repository/member/update_profile_repo.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/screens/home/pages/chat/add_group_chat/widgets/change_picture.dart';

import '../../../../data/repository/user_repository.dart';
import '../../../../ui/resources/app_images.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otherParentEmailController = TextEditingController();

  String? image = UserRepository.user?.image;

  changePhoto(context, update) async{
    // FileManager().showModelSheetForImage(
    //   context: context,
    //   getImages: (images) => image = images.isNotEmpty ? images[0] : null,
    // );

    await changePicture(context, update);

    emit(ChangePhoto());
  }
  int selectedPicIndex = 0;
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

  String get groupPic => groupPics[selectedPicIndex];
  void changeGroupPic(index) {
    selectedPicIndex = index;
    emit(ChangePhoto());
  }


  updateProfile(context) async{
    emit(Loading());
    final success = await UpdateProfileRepo.updateProfile(
      UpdateProfileDTO(
        name: nameController.text,
        email: emailController.text,
        otherEmail: otherParentEmailController.text,
        image: image,
      ),
    );
    emit(Done());
    if(success) pop(context);
  }
}
