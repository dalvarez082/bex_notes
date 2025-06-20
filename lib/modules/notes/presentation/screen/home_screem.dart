import 'package:bex_notes/core/services/session_service.dart';
import 'package:bex_notes/modules/notes/application/blocs/note_bloc.dart';
import 'package:bex_notes/modules/notes/application/blocs/note_event.dart';
import 'package:bex_notes/modules/notes/application/blocs/note_state.dart';
import 'package:bex_notes/modules/notes/domain/entities/note.dart';
import 'package:bex_notes/modules/notes/presentation/widgets/create_note_modal.dart';
import 'package:bex_notes/modules/notes/presentation/widgets/note_grid.dart';
import 'package:bex_notes/modules/notes/presentation/widgets/user_session_modal.dart';
import 'package:bex_notes/styles/typography/app_responsive_text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  String? token;
  String? userName;
  int? userId;

  @override
  void initState() {
    super.initState();
    _loadSession();
  }

  Future<void> _loadSession() async {
    final tokenResult = await SessionService.getToken();
    final idResult = await SessionService.getUserId();
    setState(() {
      token = tokenResult;
      userId = idResult;
      userName = 'Usuario';
    });
  }

  void _showUserModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return UserSessionModal(userName: userName, token: token);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Si no ha cargado el userId aún, mostramos loader
    if (userId == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return BlocProvider(
      create: (_) => NoteBloc()..add(LoadNotes(userId!)),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: colors.primary,
            title: Text(
              'Bex Notes',
              style: context.textresponsive.titleLarge.copyWith(
                color: colors.onPrimary,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.account_circle_outlined, color: colors.onPrimary),
                onPressed: () => _showUserModal(context),
              ),
            ],
          ),
          body: BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              if (state is NoteLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NoteLoaded) {
                return NoteGrid(notes: state.notes);
              } else if (state is NoteError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const SizedBox.shrink();
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final bloc = context.read<NoteBloc>();

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (modalContext) {
                  return CreateNoteModal(
                    onSave: (title, content) {
                      bloc.add(
                        AddNoteEvent(
                          Note(
                            userId: userId!,
                            title: title,
                            content: content,
                            createdAt: DateTime.now(),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
