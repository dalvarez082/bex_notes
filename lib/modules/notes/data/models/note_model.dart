

import 'package:bex_notes/modules/notes/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    super.id,
    required super.userId,
    required super.title,
    required super.content,
    required super.createdAt,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['note_id'],
      userId: map['user_id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'note_id': id,
      'user_id': userId,
      'title': title,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
