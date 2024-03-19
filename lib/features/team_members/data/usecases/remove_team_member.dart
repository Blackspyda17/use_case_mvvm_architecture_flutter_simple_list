import 'package:ingenio_test/features/team_members/data/model/person.dart';
import 'package:ingenio_test/features/team_members/domain/repository/team_member_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class RemoveTeamMemberUseCase
    extends UseCase<DataState<List<PersonModel>>, PersonModel> {
  final TeamMemberRepository _teamMembersRepository;

  RemoveTeamMemberUseCase(this._teamMembersRepository);

  @override
  Future<DataState<List<PersonModel>>> call(
      {List<PersonModel>? members, PersonModel? params}) {
    return _teamMembersRepository.removeMember(params!, members!);
  }
}
