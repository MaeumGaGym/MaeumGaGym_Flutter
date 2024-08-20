import 'package:hive/hive.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_dto.dart';
import 'package:maeumgagym_flutter/component/pose/data/dto/poses_dto.dart';

import '../../../../../core/ignore/hive_pose_all_key.dart';

class LocalPoseAllDataSource {
  Box<PoseDto>? box;

  LocalPoseAllDataSource() {
    init();
  }

  Future<void> init() async {
    box = Hive.box<PoseDto>(hivePoseAllKey);
  }

  Future<PosesDto> getPoseDataList() async {
    if (box == null) await init();

    PosesDto response = PosesDto(poses: box!.values.toList());

    return response;
  }

  Future<void> setPoseDataList(PosesDto posesDto) async {
    if (box == null) await init();

    await box!.clear();

    for (int i = 0; i < posesDto.poses.length; i++) {
      await box!.add(posesDto.poses[i]);
    }
  }
}