import 'package:cubittheme/core/consts.dart';
import 'package:cubittheme/notes/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:cubittheme/notes/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:cubittheme/notes/model/note_model.dart';
import 'package:cubittheme/notes/view/widgets/bottom_sheet.dart';
import 'package:cubittheme/notes/view/widgets/note_widget.dart';
import 'package:cubittheme/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('khati Note v2'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<ReadNotesCubit>(context).readNotes();
                },
                child: const Text(
                  'get notes',
                ),
              ),
              TextButton(
                onPressed: () {
                  _showAddNoteBottomSheet(context, '');
                },
                child: const Text(
                  'add notes',
                ),
              ),
              TextButton(
                onPressed: () async {
                  var notesBox = Hive.box<NoteModel>(knotesBox);
                  await notesBox.clear();
                  BlocProvider.of<ReadNotesCubit>(context).readNotes();
                },
                child: const Text(
                  'delete notes',
                ),
              ),
            ],
          ),
          BlocBuilder<ReadNotesCubit, ReadNotesState>(
            builder: (context, state) {
              if (state is ReadNotessuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      NoteModel note = state.notes[index];
                      return Dismissible(
                        key: Key(note.key.toString()),
                        onDismissed: (direction) {
                          BlocProvider.of<AddPostCubit>(context)
                              .deleteNote(note.key);
                          BlocProvider.of<ReadNotesCubit>(context).readNotes();
                        },
                        child: NoteWidgte(
                            longDoublePress: () {
                              _showAddNoteBottomSheet(context, note.key);
                            },
                            checkOnpressed: () {
                              note.isDone = !note.isDone;
                              BlocProvider.of<AddPostCubit>(context)
                                  .updateNote(note, note.key);
                              BlocProvider.of<ReadNotesCubit>(context)
                                  .readNotes();
                            },
                            isDone: note.isDone,
                            title: note.title,
                            content: note.content),
                      );
                    },
                  ),
                );
              } else if (state is ReadNotesFailed) {
                return Text('failed : ${state.message}');
              } else if (state is ReadNotesInitial) {
                return const Text('initial state ');
              }
              return const Text('no idea ');
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('add note'),
        onPressed: () {
          _showAddNoteBottomSheet(context, '');
        },
      ),
    );
  }
}

void _showAddNoteBottomSheet(BuildContext context, dynamic theKey) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return AddNoteBottomSheet(
        thekey: theKey,
      ); // Replace with your bottom sheet widget
    },
  );
}
