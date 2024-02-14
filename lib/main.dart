import 'package:cubittheme/core/consts.dart';
import 'package:cubittheme/core/home_page.dart';
import 'package:cubittheme/notes/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:cubittheme/notes/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:cubittheme/notes/model/note_model.dart';
import 'package:cubittheme/settings/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (BuildContext context) => SettingsCubit(),
        ),
        BlocProvider<ReadNotesCubit>(
          create: (BuildContext context) => ReadNotesCubit(),
        ),
        BlocProvider<AddPostCubit>(
          create: (BuildContext context) => AddPostCubit(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: ThemeMode.system,
            theme: state.themeData,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
