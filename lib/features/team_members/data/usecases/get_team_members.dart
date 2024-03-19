import 'package:ingenio_test/core/resources/data_state.dart';
import 'package:ingenio_test/features/team_members/data/model/person.dart';
import 'package:ingenio_test/features/team_members/domain/repository/team_member_repository.dart';

import '../../../../core/usecase/usecase.dart';

class GetTeamMembersUseCase
    implements UseCase<DataState<List<PersonModel>>, void> {
  final TeamMemberRepository _teamMembersRepository;

  GetTeamMembersUseCase(this._teamMembersRepository);

  @override
  Future<DataState<List<PersonModel>>> call({void params}) {
    return _teamMembersRepository.getTeamMembers();
  }
}
