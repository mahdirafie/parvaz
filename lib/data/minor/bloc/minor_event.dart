part of 'minor_bloc.dart';

@immutable
sealed class MinorEvent {}

class GetPopularSkills implements MinorEvent{
}

class SetSkillStudent implements MinorEvent{
  final String codeMeli;
  final String skill;

  SetSkillStudent({required this.codeMeli, required this.skill});
}
