abstract class PurposeEvent {}

class GetPurposeDetailEvent extends PurposeEvent {
  final int purposeId;

  GetPurposeDetailEvent({required this.purposeId});
}