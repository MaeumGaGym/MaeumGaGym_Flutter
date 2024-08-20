class PoseDetailEntity {
  final bool needMachine;
  final String simpleName, exactName, thumbnail;
  final List<String> category, simplePart, exactPart;
  final List<String> startPose, exerciseWay, breatheWay, caution;

  PoseDetailEntity({
    required this.needMachine,
    required this.simpleName,
    required this.exactName,
    required this.thumbnail,
    required this.category,
    required this.simplePart,
    required this.exactPart,
    required this.startPose,
    required this.exerciseWay,
    required this.breatheWay,
    required this.caution,
  });
}
