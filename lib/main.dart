import 'package:camera/camera.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:maeum_ga_gym_flutter/config/router.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/core/di/init.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_camera_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/dio_di.dart';
import 'home/domain/model/local_timer_model.dart';

void main() async {
  initLocator();
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  cameras = await availableCameras();

  /// Hive 설정
  await Hive.initFlutter();
  Hive.registerAdapter(LocalTimerModelAdapter());
  await Hive.openBox<LocalTimerModel>('duration');
  Hive.registerAdapter(PoseDataModelAdapter());
  await Hive.openBox<PoseDataModel>('poseData');

  /// 다국어 설정을 위함
  await initializeDateFormatting();

  /// KaKao Init
  KakaoSdk.init(
    nativeAppKey: 'dcfcd3ab4a997c5a53e2ab26a8ec2a63',
  );

  final datadogConfiguration = DatadogConfiguration(
    clientToken: 'pub32b6d411d17d461c90046e46259be242',
    env: 'prod',
    site: DatadogSite.us5,
    nativeCrashReportEnabled: true,
    loggingConfiguration: DatadogLoggingConfiguration(),
    rumConfiguration: DatadogRumConfiguration(
      applicationId: 'd3b74963-1b00-4b80-b79c-fcb76ff19e34',
    ),
  );

  await DatadogSdk.runApp(datadogConfiguration, TrackingConsent.granted,
      () async {
    runApp(const ProviderScope(child: MyApp()));
  });

  // dio interceptor 추가
  addInterceptor();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
