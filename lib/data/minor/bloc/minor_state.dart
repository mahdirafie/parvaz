part of 'minor_bloc.dart';

@immutable
sealed class MinorState {}

final class MinorInitial extends MinorState {}

final class PopularSkillSuccess extends MinorState {
  final Map<String, int> list;

  PopularSkillSuccess({required this.list});
}

final class PopularSkillLoading extends MinorState {}

final class PopularSkillFailed extends MinorState {
  final String message;

  PopularSkillFailed({required this.message});
}

final class SetSkillLoading extends MinorState {}

final class SetSkillSuccess extends MinorState {}

final class SetSkillFailed extends MinorState {
  final String message;

  SetSkillFailed({required this.message});
}
