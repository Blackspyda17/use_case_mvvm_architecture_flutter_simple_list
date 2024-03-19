import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingenio_test/features/team_members/presentation/bloc/team_members/team_members_bloc.dart';
import 'package:ingenio_test/features/team_members/presentation/pages/team_members/team_members_list.dart';

import 'config/app_themes.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TeamMembersBloc>(
      create: (context) =>
      sl()
        ..add(const GetTeamMembers()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const TeamMembers()
      ),
    );
  }

}