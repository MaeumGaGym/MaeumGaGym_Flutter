import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:maeumgagym_flutter/core/ignore/hive_pose_all_key.dart';
import 'package:maeumgagym_flutter/core/ignore/hive_timer_key.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_dto.dart';
import 'package:maeumgagym_flutter/data/timer/dto/response/timer_dto.dart';
import 'package:maeumgagym_flutter/init/dio_init.dart';
import 'package:maeumgagym_flutter/presentation/splash/ui/view/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'di/di.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// 다국어 설정을 위함
  await initializeDateFormatting();

  /// KaKao Init
  KakaoSdk.init(
    nativeAppKey: 'dcfcd3ab4a997c5a53e2ab26a8ec2a63',
  );

  /// Hive Setting
  await Hive.initFlutter();
  Hive.registerAdapter(PoseDtoAdapter());
  await Hive.openBox<PoseDto>(hivePoseAllKey);
  Hive.registerAdapter(TimerDtoAdapter());
  await Hive.openBox<TimerDto>(hiveTimerKey);

  dioInit();

  runApp(MyApp(
    blocProvider: await di(),
  ));
}

class MyApp extends StatelessWidget {
  final List<BlocProvider> blocProvider;

  const MyApp({super.key, required this.blocProvider});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: blocProvider,
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              titleSpacing: 0,
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
