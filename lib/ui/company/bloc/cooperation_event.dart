part of 'cooperation_bloc.dart';

@immutable
sealed class CooperationEvent {}

class CooperationButtonClicked extends CooperationEvent {
  final String codeMeli;
  final String shenaseComp;
  final String explanation;
  final bool isConfirmed;

  CooperationButtonClicked({required this.codeMeli, required this.shenaseComp, required this.explanation, required this.isConfirmed});
}

class SaveForCooperationButtonClicked extends CooperationEvent {
  final String codeMeli;
  final String shenaseComp;
  final String explanation;
  final bool isConfirmed;

  SaveForCooperationButtonClicked({required this.codeMeli, required this.shenaseComp, required this.explanation, required this.isConfirmed});
}