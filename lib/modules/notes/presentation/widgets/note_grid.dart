import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/modules/notes/domain/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NoteGrid extends StatelessWidget {
  final List<Note> notes;
  const NoteGrid({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: notes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.r,
        crossAxisSpacing: 12.r,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        final note = notes[index];
        return GestureDetector(
          onTap: () {
            context.push(
              AppRoutesNames.noteDetailScreen,
              extra: note, 
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.note, size: 48),
                  SizedBox(height: 8.r),
                  Text(
                    note.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.r),
                  Text(
                    note.content,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
