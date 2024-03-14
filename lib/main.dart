import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    nativeAppKey: '1004d2c2e0f5e5d75974cff75a470391',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
