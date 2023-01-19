import 'package:flutter/material.dart';
import 'package:foodmood/app/data/network/api_msg_strings.dart';
import 'package:foodmood/app/res/strings/strings.dart';


class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {Key? key, this.message, this.retryCallback, this.retryMessage})
      : super(key: key);
  final String? message;
  final VoidCallback? retryCallback;
  final String? retryMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message ?? ApiMsgStrings.txtSomethingWentWrong),
          if (retryCallback != null)
            OutlinedButton(
                onPressed: retryCallback,
                child: Text(retryMessage ?? AppStrings.retry))
        ],
      ),
    );
  }
}
