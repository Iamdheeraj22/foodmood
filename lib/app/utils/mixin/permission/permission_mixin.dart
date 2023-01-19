import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmood/app/utils/mixin/permission/permission_util.dart';
import 'package:permission_handler/permission_handler.dart';


mixin PermissionMixin {
  //perform action with permission - Safe operation with permission
  performActionWithPermission(
      {BuildContext? context,
      Function? performAction,
      Permission? permissionType,
      String? permissionDesc,
      String title = ''}) async {
    final PermissionStatus? permissionStatus =
        await PermissionUtil.getPermission(permissionType!);
    if (permissionStatus == PermissionStatus.granted ||
        permissionStatus == PermissionStatus.limited) {
      performAction!();
    } else {
      PermissionUtil.showActionDialog(
          permissionType: permissionType,
          context: context,
          description: permissionDesc,
          title: title);
    }
  }
}
