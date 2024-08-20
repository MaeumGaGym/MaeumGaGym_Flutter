import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalPoseVersionDataSource {
  final String poseVersion = 'POSES_VERSION';
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> setPoseVersion() async {
    String? date = DateFormat('yyyy-MM-ddThh:mm').format(DateTime.now());

    await storage.write(key: poseVersion, value: date);
  }

  Future<String?> getPoseVersion() async {
    return await storage.read(key: poseVersion);
  }
}