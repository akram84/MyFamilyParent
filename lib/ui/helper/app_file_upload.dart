// import 'package:flutter/material.dart';
// import 'package:images_picker/images_picker.dart';
// import 'package:my_family/ui/helper/app_toast.dart';
// import 'package:my_family/ui/helper/size_extension.dart';
//
// import '../resources/index.dart';
// import '../widgets/index.dart';
// import 'app_size_boxes.dart';
// import 'navigator.dart';
//
//
// class FileManager {
//   showModelSheetForImage({
//       int maxFileSize = 10 * 1024,
//       List<String> allowedExtensions = const [],
//       void Function(List<String?>)? getImages,
//       required BuildContext context,
//   }) async {
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
//       builder: (BuildContext context) => Container(
//         decoration: AppBoxDecoration.fillWhiteA700,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 14.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               16.heightBox,
//               Center(
//                 child: Container(
//                   height: 5.h,
//                   width: 83.w,
//                   decoration: BoxDecoration(
//                     color: AppColors.colorDark,
//                     borderRadius: BorderRadius.circular(2.50.r),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 25.h),
//                 child: InkWell(
//                   onTap: () async{
//                     List<String?> imageList = await _imgFromCamera(maxFileSize, allowedExtensions, context);
//                     if (getImages != null) {
//                       getImages(imageList);
//                     }
//                     if(context.mounted)pop(context);
//                   },
//                   child: Row(
//                     children: [
//                       AppImage(imagePath: AppImages.camera, width: 22.w, height: 18,),
//                       15.widthBox,
//                       AppText(
//                           translation: AppStrings.takePicture,
//                           style: AppTextStyles.txtRobotoRegular16.copyWith())
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () async{
//                   List<String?> imageList = await _imgFromGallery(maxFileSize, allowedExtensions, context);
//                   if (getImages != null) {
//                     getImages(imageList);
//                   }
//                   if(context.mounted)pop(context);
//                 },
//                 child: Row(
//                   children: [
//                     AppImage(imagePath: AppImages.gallery, width: 18.w),
//                     15.widthBox,
//                     AppText(
//                       translation: AppStrings.chooseFromGallery,
//                       style: AppTextStyles.txtRobotoRegular16.copyWith(),
//                     ),
//                   ],
//                 ),
//               ),
//               35.heightBox,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<List<String?>> _imgFromGallery(int maxFileSize, List<String>? allowedExtensions, context) async{
//     List<String?> files = [];
//     List<Media>? res1 = await ImagesPicker.pick(
//       pickType: PickType.image,
//       maxSize: maxFileSize,
//     );
//     res1?.forEach((element) {
//       var extension = element.path.split('.');
//       print('########$extension########');
//       if (allowedExtensions != null && allowedExtensions.isNotEmpty) {
//         if (allowedExtensions.contains(extension.last)) {
//           files.add(element.path);
//         } else {
//           AppToast.toast(msg: 'only $allowedExtensions images are allowed');
//         }
//       } else {
//         files.add(element.path);
//       }
//     });
//     return files;
//   }
//
//   Future<List<String?>> _imgFromCamera(int maxFileSize, List<String>? allowedExtensions, context) async {
//     List<String?> files = [];
//     List<Media>? res1 = await ImagesPicker.openCamera(
//       pickType: PickType.image,
//       maxSize: maxFileSize,
//     );
//     res1?.forEach((element) {
//       var extension = element.path.split('.');
//       print('########$extension########');
//       if (allowedExtensions != null && allowedExtensions.isNotEmpty) {
//         if (allowedExtensions.contains(extension.last)) {
//           files.add(element.path);
//         } else {
//           AppToast.toast(msg: 'only $allowedExtensions images are allowed');
//         }
//       } else {
//         files.add(element.path);
//       }
//     });
//     return files;
//   }
// }
