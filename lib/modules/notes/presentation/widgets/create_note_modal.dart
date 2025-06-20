import 'package:bex_notes/global_widgets/atoms/button_filled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNoteModal extends StatefulWidget {
  final void Function(String title, String content) onSave;

  const CreateNoteModal({super.key, required this.onSave});

  @override
  State<CreateNoteModal> createState() => _CreateNoteModalState();
}

class _CreateNoteModalState extends State<CreateNoteModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El título no puede estar vacío')),
      );
      return;
    }

    widget.onSave(title, content);
    Navigator.of(context).pop(); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 32.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Crea tu nota',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.r),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 12.r),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Contenido'),
            ),
            SizedBox(height: 20.r),
           ButtonFilled(
              onPressed: _handleSave,
              icon: const Icon(Icons.save),
              text: 'Guardar',
            ),
          ],
        ),
      ),
    );
  }
}
