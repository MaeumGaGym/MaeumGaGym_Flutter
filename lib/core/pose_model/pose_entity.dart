class PoseEntity {
  final int id;
  final bool needMachine;
  final String name;
  final String thumbnail;
  final List<String> simplePart;
  final List<String> exactPart;
  final List<String> category;

  const PoseEntity({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.needMachine,
    required this.simplePart,
    required this.exactPart,
    required this.category
  });
}