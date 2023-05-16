import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_family/core/cubit/account/change_password/change_password_cubit.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/widgets/app_bar.dart';

import '../../../resources/index.dart';
import '../../../widgets/index.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
          ChangePasswordCubit change = BlocProvider.of(context);
          return Scaffold(
            appBar: MyAppBar(title: AppStrings.editFamilyPassword),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    38.heightBox,
                    AppText(translation: AppStrings.createNewPass, style: AppTextStyles.txtRobotoMedium18),
                    23.heightBox,
                    AppText(translation: AppStrings.createNewPassMsg, style: AppTextStyles.txtRobotoRegular18, maxLines: 5,),
                    47.heightBox,

                    ChangeController(
                      formKey: change.passwordKey,
                      controller: change.passwordController,
                      title: AppStrings.newPass,
                      hint: 'enter_password',
                      validate: (val) => val!.isEmpty ? 'password can\'t be empty' : val.length < 8 ? 'password must be at least 8 characters' : null,
                    ),
                    14.heightBox,
                    ChangeController(
                      formKey: change.passwordConfKey,
                      controller: change.passwordConfirmController,
                      title: AppStrings.passConf,
                      hint: 'enter_password',
                      validate: (val) => val!.isEmpty ? 'password can\'t be empty' : val.length < 8 ? 'password must be at least 8 characters' : val != change.passwordController.text ? AppStrings.mustMatch.tr : null,
                    ),

                    60.heightBox,
                    AppButton(
                      isLoading: state is Loading,
                      translation: 'save',
                      onTap: () => change.changePassword(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChangeController extends StatefulWidget {
  const ChangeController({
    super.key,
      required this.controller,
      required this.title,
      required this.hint, required this.formKey, this.validate,
      });

  final String title;
  final String hint;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? validate;

  @override
  State<ChangeController> createState() => _ChangeControllerState();
}

class _ChangeControllerState extends State<ChangeController> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            translation: widget.title,
            style: AppTextStyles.txtRobotoRomanRegular16Black900),
        7.heightBox,
        Align(
          alignment: Alignment.centerLeft,
          child: AppFormField(
            fromKey: widget.formKey,
            hint: widget.hint,
            obscureText: obscure,
            hintStyle: AppTextStyles.txtRobotoRomanRegular14Bluegray300,
            controller: widget.controller,
            borderColor: AppColors.colorInputBorder,
            maxLines: 1,
            validate: widget.validate,
            sufIcon: obscure ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
            onSufTap: () => setState(() => obscure = !obscure),
          ),
        ),
      ],
    );
  }
}
