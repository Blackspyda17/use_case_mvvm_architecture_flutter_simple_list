import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingenio_test/features/team_members/data/model/person.dart';
import 'package:ingenio_test/features/team_members/presentation/bloc/team_members/team_members_bloc.dart';
import 'package:ingenio_test/features/team_members/presentation/widget/person_tile.dart';

import '../../../../../injection_container.dart';

class TeamMembers extends StatelessWidget {
  const TeamMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TeamMembersBloc>()..add(const GetTeamMembers()),
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text(
        'Team Members Ingenio',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<TeamMembersBloc, TeamMembersState>(
      builder: (context, state) {
        if (state is TeamMembersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TeamMembersDone) {
          return _buildMembersList(state.teamMembers!);
        }
        return Container();
      },
    );
  }

  Widget _buildMembersList(List<PersonModel> teamMembers) {
    if (teamMembers.isEmpty) {
      return const Center(
          child: Text(
        'NO MORE TEAM MEMBERS',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: teamMembers.length,
      itemBuilder: (context, index) {
        return PersonWidget(
            person: teamMembers[index],
            onRemove: (person) =>
                _onRemoveArticle(context, person, teamMembers));
      },
    );
  }

  void _onRemoveArticle(
      BuildContext context, PersonModel person, List<PersonModel> members) {
    BlocProvider.of<TeamMembersBloc>(context)
        .add(RemoveTeamMember(person, members));
  }
}
