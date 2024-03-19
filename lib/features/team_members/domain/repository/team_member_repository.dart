import 'package:ingenio_test/core/resources/data_state.dart';
import 'package:ingenio_test/features/team_members/data/model/person.dart';

abstract class TeamMemberRepository {
  // API methods
  Future<DataState<List<PersonModel>>> getTeamMembers();

  Future<DataState<List<PersonModel>>>removeMember(
      PersonModel person, List<PersonModel> currentTeam);
}
