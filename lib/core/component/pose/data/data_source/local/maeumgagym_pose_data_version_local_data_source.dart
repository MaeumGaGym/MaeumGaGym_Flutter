import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class MaeumgagymPoseDataVersionLocalDataSource {
  final String poseVersion = 'poseDataVersion';
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> setPoseDataVersion() async {
    String? date = DateFormat('yyyy-MM-ddThh:mm').format(DateTime.now());

    await storage.write(key: poseVersion, value: date);
  }

  Future<String?> getPoseDataVersion() async {
    return await storage.read(key: poseVersion);
  }
}
