import 'package:hive_flutter/hive_flutter.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_list_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

class PoseAllLocalDataSource {
  Box<PoseDataModel>? box;

  PoseAllLocalDataSource() {
    init();
  }

  Future<void> init() async {
    box = Hive.box<PoseDataModel>('poseData');
  }

  Future<List<PoseDataModel>> getPoseDataList() async {
    if (box == null) await init();

    List<PoseDataModel> response = box!.values.toList();

    return response;
  }

  Future<void> setPoseDataList(PoseDataListModel model) async {
    if (box == null) await init();

    await box!.clear();

    for (int i = 0; i < model.response!.length; i++) {
      await box!.add(model.response![i]);
    }
  }
}
