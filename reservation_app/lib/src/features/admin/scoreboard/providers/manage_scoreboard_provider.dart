import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import 'package:reservation_app/src/features/admin/scoreboard/data%20sources/scoreboard_data_source.dart';
import 'package:reservation_app/src/features/admin/scoreboard/models/scoreboard_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/search_club_model.dart';
import '../models/search_user_model.dart';

class AdminManageScoreboardProvider extends ChangeNotifier {
  List<ScoreboardModel> scoreboards = [];
  ScoreboardDataSource scoreboardDataSource =
      ScoreboardDataSource(scoreboards: []);

  TextEditingController userIdController = TextEditingController();
  TextEditingController clubIdController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController scoreController = TextEditingController();

  DioClient dioClient = DioClient();

  List<SearchClubModel> searchClubs = <SearchClubModel>[];
  List<SearchUserModel> searchUsers = <SearchUserModel>[];

  void init() async {
    await getAllScores();
    await getAllSearchClubs();
    await getSearchUsers();
    scoreboardDataSource = ScoreboardDataSource(scoreboards: scoreboards);
  }

  void updateDataGridSource() {
    scoreboardDataSource = ScoreboardDataSource(scoreboards: scoreboards);

    notifyListeners();
  }

  void setUser(String userId) {
    userIdController.text = userId;
    notifyListeners();
  }

  Future<void> getSearchUsers() async {
    //get users
    Response response = await dioClient
        .init()
        .get('/users')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Users fetched successfully");
      print(response.data);
      searchUsers = (response.data as List)
          .map((e) => SearchUserModel.fromJson(e))
          .toList();
    } else {
      print("Error fetching users");
    }
    notifyListeners();
  }

  Future<void> getAllSearchClubs() async {
    var adminId = await SharedPrefs.getUserId();

    Response response = await dioClient
        .init()
        .get('/clubs/admin/$adminId')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });

    if (response.statusCode == 200) {
      searchClubs = (response.data as List)
          .map((e) => SearchClubModel.fromJson(e as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } else {
      print('Error fetching data');
    }
  }

  void setClubId(String clubId) {
    clubIdController.text = clubId;
    notifyListeners();
  }

  Future<void> getAllScores() async {
    Response response = await dioClient
        .init()
        .get('/scoreboard')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Scores fetched successfully");
      print(response.data);
      scoreboards = (response.data as List)
          .map((e) => ScoreboardModel.fromJson(e))
          .toList();
    } else {
      print("Error fetching scores");
    }
    updateDataGridSource();
    notifyListeners();
  }

  Future<void> createScore() async {
    Response response = await dioClient.init().post('/scoreboard', data: {
      'userId': userIdController.text,
      'score': scoreController.text,
      'clubId': clubIdController.text,
      'region': "Local"
    }).then((value) => value);

    if (response.statusCode == 200) {
      print("Score created successfully");
      getAllScores();
      updateDataGridSource();
    } else {
      print("Error creating score");
    }
    notifyListeners();
  }

  Future<void> updateScore(String scoreId) async {
    Response response =
        await dioClient.init().put('/scoreboard/$scoreId', data: {
      'userId': userIdController.text,
      'score': scoreController.text,
      'clubId': clubIdController.text,
      'region': regionController.text
    }).then((value) => value);

    if (response.statusCode == 200) {
      print("Score updated successfully");
      getAllScores();

      updateDataGridSource();
    } else {
      print("Error updating score");
    }
    notifyListeners();
  }

//get columns

  Future<void> deleteScore(String scoreId) async {
    Response response = await dioClient
        .init()
        .delete('/scoreboard/$scoreId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Score deleted successfully");
      getAllScores();
      updateDataGridSource();
    } else {
      print("Error deleting score");
    }
    notifyListeners();
  }

  Future<void> getScoreById(String scoreId) async {
    Response response = await dioClient
        .init()
        .get('/scoreboard/$scoreId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Score fetched successfully");
      print(response.data);
      userIdController.text = response.data['userId'];
      scoreController.text = response.data['score'].toString();
      clubIdController.text = response.data['clubId'];
      regionController.text = response.data['region'];
    } else {
      print("Error fetching score");
    }
  }

//data grid columns
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'scoreboardId',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Scoreboard ID',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'score',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Score',
              overflow: TextOverflow.ellipsis,
            ),
          )),
    ];
  }
}
