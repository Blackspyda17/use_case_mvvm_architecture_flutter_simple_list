import 'package:get_it/get_it.dart';
import 'package:ingenio_test/features/team_members/data/repository/team_member_repository_impl.dart';
import 'package:ingenio_test/features/team_members/data/usecases/get_team_members.dart';
import 'package:ingenio_test/features/team_members/data/usecases/remove_team_member.dart';
import 'package:ingenio_test/features/team_members/domain/repository/team_member_repository.dart';
import 'package:ingenio_test/features/team_members/presentation/bloc/team_members/team_members_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Repository
  sl.registerSingleton<TeamMemberRepository>(
    TeamMemberImpl()
  );

  //UseCases
  sl.registerSingleton<GetTeamMembersUseCase>(
    GetTeamMembersUseCase(sl())
  );

  sl.registerSingleton<RemoveTeamMemberUseCase>(
    RemoveTeamMemberUseCase(sl())
  );

  //Blocs
  sl.registerFactory<TeamMembersBloc>(
    ()=> TeamMembersBloc(sl(),sl())
  );

}