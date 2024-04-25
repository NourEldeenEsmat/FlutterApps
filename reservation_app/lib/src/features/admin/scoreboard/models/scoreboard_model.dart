class ScoreboardModel {
  final String scoreId;
  final String userId;
  final String clubId;
  final String region;
  final String score;

  ScoreboardModel({
    required this.scoreId,
    required this.userId,
    required this.clubId,
    required this.region,
    required this.score,
  });

  factory ScoreboardModel.fromJson(Map<String, dynamic> json) {
    return ScoreboardModel(
      scoreId: json['_id'],
      userId: json['userId'],
      clubId: json['clubId'],
      region: json['region'],
      score: json['score'].toString(),
    );
  }
}
