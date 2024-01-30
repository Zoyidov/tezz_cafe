import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';

class CustomDialog {
  static void showLoadingDialog(BuildContext context, [bool cancelable = true]) {
    showDialog(
      context: context,
      builder: (context) {
        return _buildLoadingDialog(context, cancelable);
      },
    );
  }

  static Widget _buildLoadingDialog(BuildContext context, bool cancelable) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: AppColors.white,
      child: PopScope(
        canPop: cancelable,

        child: LoadingAnimationWidget.threeArchedCircle(
            color: AppColors.primaryColor, size: MediaQuery.of(context).size.width * 0.2),
      ),
    );
  }
}
