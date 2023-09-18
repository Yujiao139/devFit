import 'dart:convert';

class ActivityLog {
  String userId;
  String userName;
  List<TrainingResult> trainingResults;

  ActivityLog({
    required this.userId,
    required this.userName,
    required this.trainingResults,
  });

  factory ActivityLog.fromRawJson(String str) => ActivityLog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivityLog.fromJson(Map<String, dynamic> json) => ActivityLog(
    userId: json["userId"],
    userName: json["userName"],
    trainingResults: List<TrainingResult>.from(json["trainingResults"].map((x) => TrainingResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userName": userName,
    "trainingResults": List<dynamic>.from(trainingResults.map((x) => x.toJson())),
  };
}

class TrainingResult {
  String activityType;
  List<TrainingLog> trainingLog;

  TrainingResult({
    required this.activityType,
    required this.trainingLog,
  });

  factory TrainingResult.fromRawJson(String str) => TrainingResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrainingResult.fromJson(Map<String, dynamic> json) => TrainingResult(
    activityType: json["activityType"],
    trainingLog: List<TrainingLog>.from(json["trainingLog"].map((x) => TrainingLog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "activityType": activityType,
    "trainingLog": List<dynamic>.from(trainingLog.map((x) => x.toJson())),
  };
}

class TrainingLog {
  String timestamp;
  String activityTime;
  String trainingAspect;
  String score;

  TrainingLog({
    required this.timestamp,
    required this.activityTime,
    required this.trainingAspect,
    required this.score,
  });

  factory TrainingLog.fromRawJson(String str) => TrainingLog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrainingLog.fromJson(Map<String, dynamic> json) => TrainingLog(
    timestamp: json["timestamp"],
    activityTime: json["activityTime"],
    trainingAspect: json["trainingAspect"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "activityTime": activityTime,
    "trainingAspect": trainingAspect,
    "score": score,
  };
}
