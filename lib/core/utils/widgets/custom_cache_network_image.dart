import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit fit;
  final bool errorWidgetWithBorder;
  final BorderRadiusGeometry? borderRadius;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius = 5,
    this.borderRadius,
    this.errorWidgetWithBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(30),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: imageUrl != ''
            ? imageUrl
            : 'https://as1.ftcdn.net/v2/jpg/05/16/27/58/1000_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg',
        width: width,
        height: height,
        placeholder: (context, message) {
          return Skeletonizer(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius!),
              ),
            ),
          );
        },
        errorWidget: (context, message, error) {
          return Padding(
            padding: EdgeInsets.all(2.r),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius!),
                border: Border.all(
                  color: errorWidgetWithBorder
                      ? AppColors.lightGrey
                      : Colors.transparent,
                ),
              ),
              child: SvgPicture.asset('assets/images/svgs/error_image.svg'),
            ),
          );
        },
      ),
    );
  }
}
