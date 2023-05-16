import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_family/data/repository/member/children_repo.dart';
import 'package:my_family/data/repository/member/helpers_repository.dart';
import 'package:my_family/ui/helper/app_size_boxes.dart';
import 'package:my_family/ui/resources/app_box_decoration.dart';
import 'package:my_family/ui/resources/app_strings.dart';
import 'package:my_family/ui/widgets/app_bar.dart';
import 'package:my_family/ui/widgets/index.dart';
import 'package:my_family/ui/widgets/components.dart';

import '../../../../../../core/cubit/chat/add_chat/add_chat_cubit.dart';
import '../../../../../resources/app_images.dart';
import 'widgets/change_picture.dart';
import 'widgets/group_member_checkout.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key, required this.chat});

  final AddChatCubit chat;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: chat,
      child: BlocBuilder<AddChatCubit, AddChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(title: AppStrings.createGroup),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    35.heightBox,
                    SizedBox(
                      height: 120.h,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          AppImage(
                            imagePath: chat.groupPic,
                            height: 100.h,
                            width: 100.w,
                          ),
                          InkWell(
                            onTap: () => changePicture(context, chat),
                            child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: AppBoxDecoration.outlineGray1007f
                                  .copyWith(shape: BoxShape.circle),
                              child: const Center(
                                  child:
                                      AppImage(imagePath: AppImages.editPhoto)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    38.heightBox,
                    AppFormField(
                      fromKey: chat.groupNameKey,
                      textInputAction: TextInputAction.next,
                      controller: chat.groupNameController,
                      keyboardType: TextInputType.name,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 10.w),
                      hint: 'group_name',
                      radius: 8.r,
                      borderColor: const Color(0xFFEDF1F7),
                      validate: (val) =>
                          val!.isEmpty ? 'Group Name cannot be empty' : null,
                    ),
                    10.heightBox,
                    AppFormField(
                      textInputAction: TextInputAction.done,
                      controller: chat.descriptionController,
                      keyboardType: TextInputType.name,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 10.w),
                      hint: 'description',
                      radius: 8.r,
                      borderColor: const Color(0xFFEDF1F7),
                    ),
                    28.heightBox,
                    Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: AppText(
                            text:
                                '${chat.selectedChildren.where((element) => element).length + chat.selectedHelpers.where((element) => element).length} OF ${chat.selectedHelpers.length + chat.selectedChildren.length}')),
                    10.heightBox,
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: chat.selectedHelpers.length +
                              chat.selectedChildren.length,
                          itemBuilder: (context, index) {
                            if (index < chat.selectedHelpers.length) {
                              if (!chat.selectedHelpers[index]) {
                                return const SizedBox.shrink();
                              }
                              final helper = HelpersRepo.helpers[index];
                              return GroupMemberCheckout(
                                name: helper.name,
                                image: helper.image,
                                onRemove: () => chat.toggleHelpers(index),
                              );
                            }
                            final helpSz = chat.selectedHelpers.length;
                            if (!chat.selectedChildren[index - helpSz]) {
                              return const SizedBox.shrink();
                            }
                            final child = ChildrenRepo.children[index - helpSz];
                            return GroupMemberCheckout(
                              name: child.name,
                              image: child.image,
                              onRemove: () =>
                                  chat.toggleChildren(index - helpSz),
                            );
                          }),
                    ),
                    87.heightBox,
                    AppWidgets.CustomButton(
                        text: 'save', click: () => chat.createGroup(context)),
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
