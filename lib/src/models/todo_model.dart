import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter {
  all,
  active,
  completed,
}

Uuid uid = Uuid();

class Todo extends Equatable {
  final String id;
  final String desc;
  final DateTime time;
  final String place;
  final int reminder;
  final bool completed;

  Todo({
    String? id,
    required this.desc,
    required this.time,
    required this.place,
    required this.reminder,
    this.completed = false,
  }) : this.id = id ?? uid.v4();

  @override
  List<Object?> get props => [id, desc, completed, time, place, reminder];
}
