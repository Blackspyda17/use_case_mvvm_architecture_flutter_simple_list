import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ingenio_test/features/team_members/data/model/person.dart';
import 'package:ingenio_test/features/team_members/domain/repository/team_member_repository.dart';

import '../../../../core/resources/data_state.dart';

class TeamMemberImpl implements TeamMemberRepository {
  @override
  Future<DataState<List<PersonModel>>> getTeamMembers() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final String response =
          await rootBundle.loadString('assets/json/team.json');
      final data = await json.decode(response);
      return DataSuccess(PersonModel.fromList(data));
    } catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<List<PersonModel>>> removeMember(
      PersonModel person, List<PersonModel> currentTeam) async {
    try {
      final updatedTeam = currentTeam;
      updatedTeam.removeWhere((item) => item.id == person.id);
      return DataSuccess(updatedTeam);
    } catch (error) {
      return DataFailed(error);
    }
  }
}
