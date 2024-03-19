part of 'team_members_bloc.dart';


abstract class TeamMembersState  {
  final List<PersonModel> ? teamMembers;
  final Object ? error;

  const TeamMembersState({this.teamMembers,this.error});

}

class TeamMembersLoading extends TeamMembersState {
  const TeamMembersLoading();
}

class TeamMembersDone extends TeamMembersState {
  const TeamMembersDone(List<PersonModel> members) : super(teamMembers: members);
}


class TeamMembersError extends TeamMembersState {
  const TeamMembersError(Object error) : super(error: error);
}

