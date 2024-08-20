import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/presentation/on_boarding/ui/view/on_boarding_screen.dart';
import 'package:maeumgagym_flutter/presentation/page_manager/ui/view/page_manager.dart';
import 'package:maeumgagym_flutter/presentation/page_manager/view_model/page_manager_state_cubit.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/recommend/pose_recommend_bloc.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_bloc.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_event.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_event.dart';
import 'package:maeumgagym_flutter/presentation/splash/view_model/splash_bloc.dart';
import 'package:maeumgagym_flutter/presentation/splash/view_model/splash_event.dart';
import 'package:maeumgagym_flutter/presentation/splash/view_model/splash_state.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';

import '../../../../component/image_widget.dart';
import '../../../../component/pose/presentation/view_model/pose_all/pose_all_bloc.dart';
import '../../../../component/pose/presentation/view_model/pose_all/pose_all_event.dart';
import '../../../../component/pose/presentation/view_model/recommend/pose_recommend_event.dart';
import '../../../../core/images.dart';
import '../../../../core/maeum/maeum_color.dart';
import '../../../quotes/view_model/quotes_bloc.dart';
import '../../../quotes/view_model/quotes_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(SplashEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState>(
          listenWhen: (previous, current) => current.blocStateEnum == BlocStateEnum.error,
          listener: (context, state) {
            debugPrint(state.errorOfNull.toString());
            MaeumNavigator.teleporting(context, const OnBoardingScreen());
          },
        ),

        BlocListener<SplashBloc, SplashState>(
          listenWhen: (previous, current) => current.blocStateEnum == BlocStateEnum.loaded,
          listener: (context, state) {
            context.read<QuotesBloc>().add(GetQuotesEvent());
            context.read<PoseAllBloc>().add(GetPoseAllEvent());
            context.read<PoseRecommendBloc>().add(GetPoseRecommendEvent());
            context.read<TodayRoutineBloc>().add(GetTodayRoutineEvent());
            context.read<ProfileBloc>().add(GetProfileEvent());

            context.read<PageManagerStateCubit>().init();
            context.read<TimerStateCubit>().getTimers();

            MaeumNavigator.teleporting(context, const PageManagerScreen());
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: MaeumColor.white,
        body: const Center(
          child: ImageWidget(
            image: Images.logosSplashTextLogo,
            width: 150,
          ),
        ),
      ),
    );
  }
}