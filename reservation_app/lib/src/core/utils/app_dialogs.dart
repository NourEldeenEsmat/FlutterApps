import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../features/auth/login/providers/login_provider.dart';

class AppDialog {
  static Future<void> showLoadingDialog(BuildContext context, String message) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Center(
            child: Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showLogoutDialog(
      BuildContext context, String title, String message) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          surfaceTintColor: AppColors.scaffoldBackgroundColor,
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            message,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "No",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            TextButton(
              onPressed: () async {
                AppDialog.showLoadingDialog(context, "Logging out...");
                await Future.delayed(const Duration(seconds: 1), () {
                  Provider.of<LoginProvider>(context, listen: false)
                      .logoutUser(context);
                });
                GoRouter.of(context).go('/login_screen');
              },
              child: Text(
                "Yes",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showErrorDialog(
      BuildContext context, String errorMessage, VoidCallback onTapClose) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          surfaceTintColor: AppColors.scaffoldBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Text(
                "Error",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Increased font size for emphasis
                ),
              ),
            ],
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16, // Adjusted font size for better readability
            ),
          ),
          actions: [
            TextButton(
              onPressed: onTapClose,
              child: Text(
                "Close",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Adjusted font size for consistency
                ),
              ),
            ),
          ],
        );
      },
    );
  }

// static Future<dynamic> generalDialog(BuildContext context, String title,
//     String message, void Function() ontapClose) {
//   return showDialog(
//     barrierDismissible: true,
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: AppColors.whiteColor,
//         actionsPadding:
//             const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         title: Customtext(
//           text: title,
//           style: AppTextStyles.circularStdBold(
//             color: AppColors.greenColor,
//             fontSize: 18,
//           ),
//         ),
//         content: Customtext(
//           text: message,
//           maxLine: 3,
//           style: AppTextStyles.circularStdRegular(
//             fontSize: 14,
//           ),
//         ),
//         actions: [],
//       );
//     },
//   );
}
