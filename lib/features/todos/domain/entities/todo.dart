import 'package:equatable/equatable.dart';
import 'package:tally_mobile/features/todos/domain/task_urgency.dart';

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.urgency,
    this.completed = false,
    required this.createdAt,
    this.completedAt,
  });

  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final TaskUrgency urgency;
  final bool completed;
  final DateTime createdAt;
  final DateTime? completedAt;

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    TaskUrgency? urgency,
    bool? completed,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      urgency: urgency ?? this.urgency,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    dueDate,
    urgency,
    completed,
    createdAt,
    completedAt,
  ];
}

extension TodoMapper on Todo {
  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'dueDate': dueDate.toIso8601String(),
    'urgency': urgency.index,
    'completed': completed,
    'createdAt': createdAt.toIso8601String(),
    'completedAt': completedAt?.toIso8601String(),
  };
}

Todo todoFromMap(Map<String, dynamic> map) => Todo(
  id: map['id'] as String,
  title: map['title'] as String,
  description: map['description'] as String,
  dueDate: DateTime.parse(map['dueDate'] as String),
  urgency: TaskUrgency.values[map['urgency'] as int],
  completed: map['completed'] as bool,
  createdAt: DateTime.parse(map['createdAt'] as String),
  completedAt: map['completedAt'] != null
      ? DateTime.parse(map['completedAt'] as String)
      : null,
);
