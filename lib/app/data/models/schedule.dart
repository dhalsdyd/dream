import 'package:json_annotation/json_annotation.dart';
part 'schedule.g.dart';

@JsonSerializable()
class Schedule {
  int id;
  int userId;
  int? parentScheduleId;
  String name;
  String content;
  DateTime startingAt;
  DateTime endingAt;
  bool isSuccess;
  DateTime createdAt;
  List<String> categories;
  //List<dynamic> childSchedules;
  List<DateTime> repetitions;
  Schedule({
    required this.id,
    required this.userId,
    required this.parentScheduleId,
    required this.name,
    required this.content,
    required this.startingAt,
    required this.endingAt,
    required this.isSuccess,
    required this.createdAt,
    required this.categories,
    //required this.childSchedules,
    required this.repetitions,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
