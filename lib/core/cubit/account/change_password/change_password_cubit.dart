import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_family/data/dto/account/edit_family_password.dart';
import 'package:my_family/data/repository/user_repository.dart';

import '../../../../ui/helper/navigator.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final passwordKey = GlobalKey<FormState>();
  final passwordConfKey = GlobalKey<FormState>();

  changePassword(context) async{
    emit(Loading());
    if(!(passwordKey.currentState?.validate()??false) || !(passwordConfKey.currentState?.validate()??false)) {
      emit(Done());
      return;
    }
    final success = await UserRepository.changePassword(
      EditPasswordDTO(
        password: passwordController.text,
        passwordConf: passwordConfirmController.text,
      ),
    );
    emit(Done());
    if(success) pop(context);
  }

}
