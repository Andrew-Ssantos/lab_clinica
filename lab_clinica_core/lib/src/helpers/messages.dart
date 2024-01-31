import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final class Messages {
  static void showError(String errorMessage, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: errorMessage),
    );
  }

  static void showInfo(String infoMessage, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: infoMessage),
    );
  }

  static void showSuccess(String successMessage, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: successMessage),
    );
  }
}
