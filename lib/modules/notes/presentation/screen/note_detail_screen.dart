import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/modules/notes/application/blocs/note_bloc.dart';
import 'package:bex_notes/modules/notes/application/blocs/note_event.dart';
import 'package:bex_notes/modules/notes/domain/entities/note.dart';
import 'package:bex_notes/modules/notes/presentation/widgets/confirm_delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de nota'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ConfirmDeleteDialog(
                    onConfirm: () {
                      context.read<NoteBloc>().add(
                        DeleteNoteEvent(note.id!, note.userId),
                      );
                      Future.delayed(const Duration(milliseconds: 100), () {
                        if (context.mounted) {
                          context.go(
                            AppRoutesNames.homeScreen,
                          ); 
                        }
                      });
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.r),
            Text(note.content, style: TextStyle(fontSize: 16.sp)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
