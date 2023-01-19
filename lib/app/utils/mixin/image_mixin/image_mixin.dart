import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/app/utils/debug_utils/debug_utils.dart';

import 'package:permission_handler/permission_handler.dart';

mixin ImageMixin {
  final ImagePicker _imagePicker = ImagePicker();
  bool hasPopped = false;

  //camera dialog
  Future<File?> openImagePicker(BuildContext context, int size) async {
    hasPopped = false;
    final imageFile = await showCupertinoModalPopup<File>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: TextWidget(
            text: AppStrings.txtSelectPhoto,
            textAlign: TextAlign.center,
            textSize: 18.sp,
            color: AppColors.colorPrimary,
            fontWeight: FontStyles.bold,
          ),
          message: TextWidget(
            text: AppStrings.txtPleaseSelectImage,
            textSize: 14.sp,
            textAlign: TextAlign.center,
            color: AppColors.colorPrimary,
            fontWeight: FontStyles.regular,
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: TextWidget(
                text: AppStrings.txtCamera,
                textSize: 18.sp,
                textAlign: TextAlign.center,
                color: AppColors.colorPrimary,
                fontWeight: FontStyles.regular,
              ),
              onPressed: () async {
                try {
                  final File? image = await getImage(
                      context, ImageType.camera, Permission.camera, size);
                  Navigator.pop(context, image);
                } catch (e) {
                  DebugUtils.showLog(e.toString());
                  if (!hasPopped) {
                    Navigator.pop(context);
                    hasPopped = true;
                  }
                }
              },
            ),
            CupertinoActionSheetAction(
              child: TextWidget(
                text: AppStrings.txtGallery,
                textSize: 18.sp,
                textAlign: TextAlign.center,
                color: AppColors.colorPrimary,
                fontWeight: FontStyles.regular,
              ),
              onPressed: () async {
                try {
                  final File? image = await getImage(
                      context,
                      ImageType.gallery,
                      Platform.isIOS ? Permission.photos : Permission.storage,
                      size);
                  Navigator.pop(context, image);
                } catch (e) {
                  DebugUtils.showLog(e.toString());
                  if (!hasPopped) {
                    Navigator.pop(context);
                    hasPopped = true;
                  }
                }
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: TextWidget(
              text: AppStrings.txtCancel,
              textSize: 18.sp,
              textAlign: TextAlign.center,
              color: AppColors.colorPrimary,
              fontWeight: FontStyles.medium,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
    return imageFile;
  }

  //getImageFromGallery question
  Future<File?> getImageFromGallery(size) async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: size);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  //getImageFromCamera question
  Future<File?> getImageFromCamera(size) async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: size);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  //get image file from camera / gallery
  Future<File?> getImage(BuildContext context, ImageType getImageType,
      Permission permissionType, int size) async {
    final PermissionStatus? permissionStatus =
        await PermissionUtil.getPermission(permissionType);
    if (permissionStatus == PermissionStatus.granted ||
        permissionStatus == PermissionStatus.limited) {
      if (getImageType == ImageType.camera) {
        final file = await getImageFromCamera(size);
        if (file != null) {
          return file;
        }
      } else {
        final file = await getImageFromGallery(size);
        if (file != null) {
          return file;
        }
      }
    } else {
      if (!hasPopped) {
        Navigator.pop(context);
        hasPopped = true;
      }
      await Future.delayed(const Duration(milliseconds: 500), () {
        PermissionUtil.showActionDialog(
            context: NavigationService.navigatorKey.currentContext!,
            description: permissionType == Permission.camera
                ? AppStrings.txtCameraPermission
                : AppStrings.txtGalleryPermission,
            title: permissionType == Permission.camera
                ? AppStrings.txtThisAppNeedsCameraAccess
                : Platform.isIOS
                    ? AppStrings.txtThisAppNeedsGalleryAccess
                    : AppStrings.txtThisAppNeedsStorageAccess);
      });
    }
    return null;
  }

//getCroppedImage

/*cropImage(BuildContext context, File image, int size) async {
    File? croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
      maxWidth: size,
      maxHeight: size,
    );
     if (image != null) {
      Navigator.pop(context, image);
    }
  } */

}

enum ImageType { camera, gallery }
