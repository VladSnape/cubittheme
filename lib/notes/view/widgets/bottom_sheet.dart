import 'package:cubittheme/notes/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:cubittheme/notes/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:cubittheme/notes/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatefulWidget {
  final dynamic thekey;

  const AddNoteBottomSheet({super.key, required this.thekey});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Note',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle adding the note to your data source
                final title = _titleController.text;
                final content = _contentController.text;
                // Call your Cubit/Bloc to add the note
                if (widget.thekey == '') {
                  BlocProvider.of<AddPostCubit>(context).addNote(
                    NoteModel(title: title, content: content),
                  );
                } else {
                  BlocProvider.of<AddPostCubit>(context).updateNote(
                      NoteModel(title: title, content: content), widget.thekey);
                }

                Navigator.pop(context);
                BlocProvider.of<ReadNotesCubit>(context).readNotes();
                // Close the bottom sheet
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
