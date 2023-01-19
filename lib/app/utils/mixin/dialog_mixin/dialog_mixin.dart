import 'package:flutter/material.dart';

class DialogMixin {
/*  showRequestToAdminDialog(context) {
    showSimpleDialog(context,
        Consumer<SendToAdminNotifier>(builder: (context, notifier, child) {
      return RequestToAdminDialog(
        onTap: () async {
          await notifier.completeMyProfile();
        },
        description:
            "${AppStrings.filledAllDetails}\n\n${AppStrings.shouldSendForReview}",
        positiveButtonText: AppStrings.submitForReview,
        negativeButtonText: AppStrings.close,
        title: AppStrings.wellDone,
        imagePath: AppIcons.icDoneCheck,
        isLoading: notifier.response?.apiCallState == ApiCallState.loading,
      );
    }));
  }*/
  showSimpleDialog(context, dismissible, child) {
    showDialog(
        context: context,
        barrierDismissible: dismissible ?? true,
        builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)), //this right here
              child: child,
            ));
  }
}
