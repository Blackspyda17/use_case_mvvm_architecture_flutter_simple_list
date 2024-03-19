part of 'team_members_bloc.dart';

@immutable
abstract class TeamMembersEvent {
  final PersonModel? member;
  final List<PersonModel>? currentTeam;

  const TeamMembersEvent({this.member, this.currentTeam});
}

class GetTeamMembers extends TeamMembersEvent {
  const GetTeamMembers();
}

class RemoveTeamMember extends TeamMembersEvent {
  const RemoveTeamMember(PersonModel personModel, List<PersonModel> currentTeam)
      : super(member: personModel, currentTeam: currentTeam);
}
