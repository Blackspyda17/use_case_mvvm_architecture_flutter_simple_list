import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingenio_test/features/team_members/data/model/person.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../data/usecases/get_team_members.dart';
import '../../../data/usecases/remove_team_member.dart';

part 'team_members_event.dart';

part 'team_members_state.dart';

class TeamMembersBloc extends Bloc<TeamMembersEvent, TeamMembersState> {
  final GetTeamMembersUseCase _getTeamMembersUseCase;
  final RemoveTeamMemberUseCase _removeTeamMemberUseCase;

  TeamMembersBloc(
    this._getTeamMembersUseCase,
    this._removeTeamMemberUseCase,
  ) : super(const TeamMembersLoading()) {
    on<GetTeamMembers>(onGetTeamMembers);
    on<RemoveTeamMember>(onRemoveTeamMember);
  }

  void onGetTeamMembers(
      GetTeamMembers event, Emitter<TeamMembersState> emit) async {
    final dataState = await _getTeamMembersUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(TeamMembersDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(TeamMembersError(dataState.error!));
    }
  }

  void onRemoveTeamMember(
      RemoveTeamMember event, Emitter<TeamMembersState> emit) async {
    final dataState  = await _removeTeamMemberUseCase(
        params: event.member, members: event.currentTeam);
    if (dataState is DataSuccess) {
      emit(TeamMembersDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(TeamMembersError(dataState.error!));
    }
  }
}
