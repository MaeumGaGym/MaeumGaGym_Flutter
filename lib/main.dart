import 'package:camera/camera.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:maeum_ga_gym_flutter/config/router.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_camera_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'home/domain/model/local_timer_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  /// Hive 설정
  await Hive.initFlutter();
  Hive.registerAdapter(LocalTimerModelAdapter());
  await Hive.openBox<LocalTimerModel>('duration');

  /// 다국어 설정을 위함
  await initializeDateFormatting();

  /// KaKao Init
  KakaoSdk.init(
    nativeAppKey: 'dcfcd3ab4a997c5a53e2ab26a8ec2a63',
  );

  final datadogConfiguration = DatadogConfiguration(
    clientToken: 'pubd733ffe61ef04713ecd16f0570e3a714',
    env: 'prod',
    site: DatadogSite.us5,
    nativeCrashReportEnabled: true,
    loggingConfiguration: DatadogLoggingConfiguration(),
    rumConfiguration: DatadogRumConfiguration(
      applicationId: '2c899b8a-74b8-4495-8c4a-8ad95eff1b89',
    ),
  );

  await DatadogSdk.runApp(datadogConfiguration, TrackingConsent.granted,
      () async {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      // routeInformationProvider: router.routeInformationProvider,
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
    );
  }
}
