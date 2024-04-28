// profile_provider.dart
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  String? fullName;
  String? nationality;
  String? facebookAccount;
  String? instagramAccount;
  String? emailAccount;

  String imageUrl = "";

  final DioClient dioClient = DioClient();



  Future<void> getProfileImage() async {
    String userId = await SharedPrefs.getUserId();
    final Response response = await dioClient.init().get('/users/$userId/getProfilePicture');

    if (response.statusCode == 200) {
      // Decode image data and handle any exceptions
      try {
        final imageData = response.data;
        imageUrl = 'data:image/png;base64, ${base64Encode(imageData)}';
        print("Profile picture retrieved successfully");
      } catch (e) {
        print("Error decoding image data: $e");
        // Handle error by displaying a placeholder image or showing an error message
        // Example: userPicture = Image.asset('assets/placeholder_image.png');
      }
    } else {
      print("Failed to get profile picture. Status code: ${response.statusCode}");
    }
  }


  Future<void> init() async {
    await getUserData();
  }

  Future<void> getUserData() async {
    try {
      String userId = await SharedPrefs.getUserId();

      Response response = await dioClient.init().get('/users/$userId');

      if (response.statusCode == 200) {
        fullName = response.data['fullName'];
        nationality = response.data['nationality'];
        facebookAccount = response.data['socialAccounts']['facebook'];
        instagramAccount = response.data['socialAccounts']['instagram'];
        emailAccount = response.data['socialAccounts']['email'];

        print(
            "Social Accounts: $facebookAccount, $instagramAccount, $emailAccount");
        notifyListeners();
      } else {
        print("Failed to get user data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error getting user data: $error");
      // Handle error appropriately
    }
  }

// final ImagePicker imagePicker = ImagePicker();
// File? profilePicture;
// Image? userPicture;

//   Future<void> uploadImage() async {
//     final XFile? pickedFile =
//     await imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       profilePicture = File(pickedFile.path);
//
//       String userId = await SharedPrefs.getUserId();
//       FormData formData = FormData.fromMap({
//         "profileImage": await MultipartFile.fromFile(profilePicture!.path),
//       });
//
//       try {
//         Response response =
//         await dioClient.init().put('/users/$userId/uploadProfilePicture', data: formData);
//
//         if (response.statusCode == 200) {
//           print("Profile picture uploaded successfully");
//           // Update userPicture if necessary
//         } else {
//           print("Failed to upload profile picture. Status code: ${response.statusCode}");
//         }
//       } catch (error) {
//         print("Error uploading profile picture: $error");
//         // Handle error appropriately
//       }
//     } else {
//       print('No image selected.');
//     }
//     notifyListeners();
//   }
//
// // profile_provider.dart
//   Future<void> getProfilePicture() async {
//     try {
//       String userId = await SharedPrefs.getUserId();
//
//       Response response = await dioClient
//           .init()
//           .get('/users/$userId/getProfilePicture');
//
//       if (response.statusCode == 200) {
//         List<int> imageData;
//         if (response.data is String) {
//           imageData = response.data.codeUnits;
//         } else {
//           imageData = List<int>.from(response.data);
//         }
//
//         // Decode image data and handle any exceptions
//         try {
//           userPicture = Image.memory(Uint8List.fromList(imageData));
//           print("Profile picture retrieved successfully");
//         } catch (e) {
//           print("Error decoding image data: $e");
//           // Handle error by displaying a placeholder image or showing an error message
//           // Example: userPicture = Image.asset('assets/placeholder_image.png');
//         }
//
//         notifyListeners();
//       } else {
//         print("Failed to get profile picture. Status code: ${response.statusCode}");
//       }
//     } catch (error) {
//       print("Error getting profile picture: $error");
//       // Handle error appropriately
//     }
//   }
//
}
