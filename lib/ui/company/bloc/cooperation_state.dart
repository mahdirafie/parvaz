part of 'cooperation_bloc.dart';

@immutable
sealed class CooperationState {}

final class CooperationInitial extends CooperationState {}

final class CooperationSuccess extends CooperationState {
  final String message;

  CooperationSuccess({required this.message});
}

final class CooperationFailure extends CooperationState {
  final String message;

  CooperationFailure({required this.message});
}

final class CooperationLoading extends CooperationState {}


final class SaveForCooperationSuccess extends CooperationState {
  final String message;

  SaveForCooperationSuccess({required this.message});
}

final class SaveForCooperationFailure extends CooperationState {
  final String message;

  SaveForCooperationFailure({required this.message});
}

final class SaveForCooperationLoading extends CooperationState {}