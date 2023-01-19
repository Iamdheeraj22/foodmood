import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/*Lottie.asset(
      LottieFiles.loader,
      //width: SizeConfig.size_100,
      height: SizeConfig.size_150,
      //fit: BoxFit.fill,
    )*/
