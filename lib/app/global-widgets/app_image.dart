import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinefinder_user/app/core/values/image_paths.dart';
import 'package:dinefinder_user/app/global-widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  final bool isFileImage;

  const AppImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.color,
    this.isFileImage = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isFileImage) {
      return Image.file(File(path), fit: fit, height: height, width: width);
    }

    final bool isLocalImage = !path.contains("http") && !path.contains(".svg");
    final bool isNetworkImage = path.contains("http") && !path.contains(".svg");
    final bool isLocalSVG = !path.contains("http") && path.contains(".svg");
    final bool isNetworkSVG = path.contains("http") && path.contains(".svg");

    if (isLocalImage) {
      return Image.asset(path, fit: fit, height: height, width: width);
    } else if (isNetworkImage) {
      return Image.network(path, fit: fit, height: height, width: width);
    } else if (isLocalSVG) {
      return SvgPicture.asset(
        path,
        fit: fit,
        height: height,
        width: width,
        color: color,
      );
    } else if (isNetworkSVG) {
      return SvgPicture.network(path, fit: fit, height: height, width: width);
    } else {
      return Image.asset(
        ImagePaths.splash,
        fit: fit,
        height: height,
        width: width,
      );
    }
  }
}

class ProfileImageDisplay extends StatelessWidget {
  const ProfileImageDisplay({
    super.key,
    this.imgUrl,
    this.imagFile,
    this.height,
    this.width,
    this.loader,
    this.fit,
  });
  final String? imgUrl;
  final File? imagFile;
  final double? height;
  final double? width;
  final Widget? loader;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imagFile == null) {
      if (imgUrl == null || imgUrl == "") {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(
            Icons.person,
            size: 32.w,
          ),
          // Image.asset(
          //   'assets/profile.png',
          //   fit: BoxFit.cover,
          // ),
        );
      } else {
        return SizedBox(
          height: height,
          width: width,
          child: CachedNetworkImage(
            imageUrl: "$imgUrl",
            fit: fit ?? BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Center(
                child: SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: const LoadingIndicator(),
                ),
              );
            },
            errorWidget: (context, url, error) => SizedBox(
              height: height,
              width: width,
              child: loader != null
                  ? const Text(
                      "OOps! Something went wrong.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                    )
                  : Icon(
                      Icons.person,
                      size: 32.w,
                    ),
            ),
          ),
        );
        // Image.asset(
        //   'assets/profile.png',
        //   fit: BoxFit.cover,
        // ),
      }
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: Image.file(
          imagFile!,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
