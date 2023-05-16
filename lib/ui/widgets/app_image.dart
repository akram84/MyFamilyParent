import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

import '../resources/app_color.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key,
    this.image,
    this.imagePath,
    this.hideIfNotFound = false,
    this.width,
    this.height,
    this.radius,
    this.border,
    this.padding,
    this.boxFit = BoxFit.cover,
    this.placeholder = 'assets/images/default_avatar.png',
    this.color,
    this.backgroundColor = Colors.transparent,
    this.hasColor = true,
    this.reSize = true,
    this.icon = false,
    this.onTap,
    this.matchTextDirection,
  });
  final String? image;
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final double? radius;
  final bool hideIfNotFound;
  final bool reSize;
  final EdgeInsetsGeometry? padding;
  final String placeholder;
  final Color? color;
  final BoxBorder? border;
  final Color backgroundColor;
  final bool hasColor;
  final bool icon;
  final void Function()? onTap;
  final bool? matchTextDirection;

  @override
  Widget build(BuildContext context) {
    if (image == null && imagePath == null) return errorImage();
    return Container(
      width: reSize ? width?.w : width,
      height: reSize ? height?.h : height??width,
      padding: padding,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: backgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: image != null ? buildNetworkImage() : InkWell(
          onTap: onTap, child: buildAssetsImage()
        ),
      ),
    );
  }

  Widget buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: image!,
      width: width,
      height: height,
      fit: boxFit,
      errorWidget: (
        BuildContext context,
        __,
        ___,
      ) {
        print('error');
        return errorImage();
      },
    );
  }

  dynamic buildAssetsImage() {
    return icon
        ? ImageIcon(
        svg_provider.Svg(
            imagePath!,
            color: color ?? Colors.transparent,
            size: Size(width?.w??48, height?.h??48),
        ),
    ) : imagePath!.endsWith('.png') ? Image.asset(imagePath!, matchTextDirection: matchTextDirection??false, width: width, height: height, fit: boxFit,) : SvgPicture.asset(
      imagePath!,
      matchTextDirection: matchTextDirection??false,
      width: width,
      height: height??width,
      // color: hasColor ? color ?? AppColors.blackText : null,
      fit: boxFit,
    );
  }

  Widget errorImage() {
    if (hideIfNotFound) return Container();
    return Container(
      width: width?.w,
      height: height?.w,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.white, width: radius != null ? 0 : 3),
          borderRadius: BorderRadius.circular(radius ?? width??48 / 2)),
      child: Center(
        child: placeholder.isNotEmpty
            ? placeholder.endsWith('.svg') ? SvgPicture.asset(
                placeholder,
                width: width??48 / 2,
                height: width??48 / 2,
                color: hasColor ? color ?? AppColors.black900 : null,
                fit: boxFit,
              ) : Image.asset(placeholder, width: width, height: height, fit: boxFit)
            : Container(),
      ),
    );
  }
}
