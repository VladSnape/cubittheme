import 'package:cubittheme/settings/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 50,
          width: 100,
          child: InkWell(
            onTap: () {
              BlocProvider.of<SettingsCubit>(context).toggleTheme();
            },
            child: Center(
              child: Text(
                'change theme',
                style: textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
