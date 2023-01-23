import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/app/utils/mixin/permission/permission_util.dart';
import 'package:permission_handler/permission_handler.dart';

extension FileExtension on String {
  String? get getExtension => split('.').last;
  String? get getName => split('/').last;
}

mixin FilePickerMixin {
  //_showFilesDialog
  Future filePicker(BuildContext context, int fileType) async {
    try {
      if (fileType == 1) {
        await FilePicker.platform.pickFiles(type: FileType.image);
        final FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          final PlatformFile file = result.files.first;

          if (kDebugMode) {
            print(file.name);
            print(file.bytes);
            print(file.size);
            print(file.extension);
            print(file.path);
          }

          return file;
        } else {
          // User canceled the picker
        }
      }

      if (fileType == 2) {
        await FilePicker.platform.pickFiles(type: FileType.video);
        final FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          final PlatformFile file = result.files.first;
          if (kDebugMode) {
            print(file.name);
            print(file.bytes);
            print(file.size);
            print(file.extension);
            print(file.path);
          }
        } else {}
      }

      if (fileType == 3) {
        final file = await FilePicker.platform
            .pickFiles(type: FileType.custom, allowedExtensions: ['docx']);
        return file;
      }

      if (fileType == 4) {
        final file = await FilePicker.platform
            .pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);
        return file;
      }

      if (fileType == 5) {
        final file = await FilePicker.platform.pickFiles();
        return file;
      }
      if (fileType == 6) {
        final file = await FilePicker.platform
            .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
        return file;
      }
    } on PlatformException catch (e) {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sorry'),
              content: Text('Unsupported exception: $e'),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  Future<FilePickerResult?> getVideoFromGallery() async {
    final file = await FilePicker.platform.pickFiles(type: FileType.video);

    return file;
  }

  Future<FilePickerResult?> getDocumentFromFiles(context) async {
    final PermissionStatus? permissionStatus =
        await PermissionUtil.getPermission(Permission.storage);
    if (permissionStatus == PermissionStatus.granted ||
        permissionStatus == PermissionStatus.limited) {
      final file = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png']);

      return file;
    } else {
      PermissionUtil.showActionDialog(
          context: context,
          description: Strings.txtStoragePermission,
          title: Platform.isIOS
              ? Strings.txtThisAppNeedsGalleryAccess
              : Strings.txtThisAppNeedsStorageAccess);
    }
    return null;
  }
}
