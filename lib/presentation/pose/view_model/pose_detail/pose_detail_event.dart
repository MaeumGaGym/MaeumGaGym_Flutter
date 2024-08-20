abstract class PoseDetailEvent {}

class GetPoseDetailEvent extends PoseDetailEvent {
  final int poseId;

  GetPoseDetailEvent({required this.poseId});
}