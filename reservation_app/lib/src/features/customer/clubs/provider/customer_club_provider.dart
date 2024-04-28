import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_strings.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/features/admin/clubs/models/club_model.dart';

import '../model/club_model.dart';

class CustomerClubsProvider extends ChangeNotifier {
  DioClient dioClient = DioClient();
  List<CustomerClubModel> clubs = [];

  CustomerClubModel? selectedClub;

  void setSelectedClubs(CustomerClubModel club) {
    selectedClub = club;
    notifyListeners();
  }

  Future<void> initClubs() async {
    await getAllClubs();
  }

  // Get all tables
  Future<void> getAllClubs() async {
    try {
      Response response = await dioClient.init().get('/clubs',options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },));

      if (response.statusCode == 200) {
        clubs = (response.data as List)
            .map((clubs) => CustomerClubModel.fromJson(clubs))
            .toList();
      } else {
        print('a7a');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
