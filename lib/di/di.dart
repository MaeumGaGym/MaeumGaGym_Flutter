import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/component/pose/data/repository/pose_repository_impl.dart';
import 'package:maeumgagym_flutter/component/pose/data/data_source/remote/remote_pose_data_source.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_cubit.dart';
import 'package:maeumgagym_flutter/data/auth/data_source/remote/remote_maeum_auth_data_source.dart';
import 'package:maeumgagym_flutter/data/auth/data_source/remote/remote_social_data_source.dart';
import 'package:maeumgagym_flutter/data/auth/repository/maeum_auth_repository_impl.dart';
import 'package:maeumgagym_flutter/data/auth/repository/social_repository_impl.dart';
import 'package:maeumgagym_flutter/data/pose/data_source/remote/remote_pose_detail_data_souce.dart';
import 'package:maeumgagym_flutter/data/pose/repository/pose_detail_repository_impl.dart';
import 'package:maeumgagym_flutter/data/profile/data_source/remote/remote_profile_data_source.dart';
import 'package:maeumgagym_flutter/data/profile/repository/profile_repository_impl.dart';
import 'package:maeumgagym_flutter/data/purpose/data_source/remote/remote_purpose_data_source.dart';
import 'package:maeumgagym_flutter/data/purpose/repository/purpose_repository_impl.dart';
import 'package:maeumgagym_flutter/data/quotes/data_source/remote/remote_quotes_data_source.dart';
import 'package:maeumgagym_flutter/data/quotes/repository/quotes_repository_impl.dart';
import 'package:maeumgagym_flutter/data/routines/data_source/remote/remote_routines_data_source.dart';
import 'package:maeumgagym_flutter/data/routines/repository/routines_repository_impl.dart';
import 'package:maeumgagym_flutter/data/timer/data_source/local/local_timer_data_source.dart';
import 'package:maeumgagym_flutter/data/timer/repository/timer_repository_impl.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_check_nick_name.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_login_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_re_issue_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_recovery_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_sign_up_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/maeum/maeum_withdrawal_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/social/social_login_use_case.dart';
import 'package:maeumgagym_flutter/domain/auth/use_case/social/social_logout_use_case.dart';
import 'package:maeumgagym_flutter/component/pose/domain/use_case/get_pose_all_use_case.dart';
import 'package:maeumgagym_flutter/domain/pose/use_case/get_pose_detail_use_case.dart';
import 'package:maeumgagym_flutter/domain/profile/use_case/get_profile_use_case.dart';
import 'package:maeumgagym_flutter/domain/purposes/use_case/add_purpose_use_case.dart';
import 'package:maeumgagym_flutter/domain/purposes/use_case/edit_purpose_use_case.dart';
import 'package:maeumgagym_flutter/domain/purposes/use_case/get_purpose_detail_use_case.dart';
import 'package:maeumgagym_flutter/domain/purposes/use_case/get_purposes_use_case.dart';
import 'package:maeumgagym_flutter/domain/quotes/use_case/get_quotes_use_case.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/add_routine_use_case.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/del_routine_use_case.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/edit_routine_use_case.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/get_routine_detail_use_case.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/get_routines_use_case.dart';
import 'package:maeumgagym_flutter/domain/routines/use_case/get_today_routine_use_case.dart';
import 'package:maeumgagym_flutter/domain/timer/use_case/add_timer_use_case.dart';
import 'package:maeumgagym_flutter/domain/timer/use_case/del_timer_use_case.dart';
import 'package:maeumgagym_flutter/domain/timer/use_case/get_timer_use_case.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_detail/pose_detail_bloc.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/recommend/pose_recommend_bloc.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_bloc.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_bloc.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine/routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine_day_of_week_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/today_routine/today_routine_page_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/agree/check_box_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/nick_name/sign_up_nick_name_bloc.dart';
import 'package:maeumgagym_flutter/presentation/splash/view_model/splash_bloc.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/add_timer_duration_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_index_state_cubit.dart';

import '../../presentation/on_boarding/view_model/maeum_auth_bloc.dart';
import '../../presentation/page_manager/view_model/page_manager_state_cubit.dart';
import '../../presentation/sign_up/view_model/success/sign_up_success_bloc.dart';
import '../component/pose/data/data_source/local/local_pose_all_data_source.dart';
import '../component/pose/data/data_source/local/local_pose_version_data_source.dart';
import '../component/pose/domain/use_case/get_pose_recommend_use_case.dart';
import '../component/pose/presentation/view_model/pose_all/pose_all_bloc.dart';
import '../component/pose/presentation/view_model/pose_machine_state_cubit.dart';
import '../component/pose/presentation/view_model/pose_tab_state_cubit.dart';
import '../domain/purposes/use_case/del_purpose_use_case.dart';
import '../presentation/pose/view_model/pose_search/pose_search_state_cubit.dart';
import '../presentation/purpose/view_model/purpose_add_edit/purpose_calender_state_cubit.dart';
import '../presentation/quotes/view_model/quotes_bloc.dart';
import '../presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';
import '../presentation/timer_metronome/view_model/timer_metronome_enum_state_cubit.dart';

Future<List<BlocProvider>> di() async {
  // Social Loginout
  final RemoteSocialDataSource remoteSocialDataSource = RemoteSocialDataSource();
  final SocialRepositoryImpl socialRepositoryImpl = SocialRepositoryImpl(socialLoginDataSource: remoteSocialDataSource);
  // -- UseCase
  final SocialLoginUseCase socialLoginUseCase = SocialLoginUseCase(socialLoginRepository: socialRepositoryImpl);
  final SocialLogoutUseCase socialLogoutUseCase = SocialLogoutUseCase(socialLoginRepository: socialRepositoryImpl);

  // Maeum Auth
  final RemoteMaeumAuthDataSource remoteMaeumAuthDataSource = RemoteMaeumAuthDataSource();
  final MaeumAuthRepositoryImpl maeumAuthRepositoryImpl = MaeumAuthRepositoryImpl(remoteMaeumAuthDataSource: remoteMaeumAuthDataSource);
  // -- UseCase
  final MaeumLoginUseCase maeumLoginUseCase = MaeumLoginUseCase(maeumAuthRepository: maeumAuthRepositoryImpl);
  final MaeumRecoveryUseCase maeumRecoveryUseCase = MaeumRecoveryUseCase(maeumAuthRepository: maeumAuthRepositoryImpl);
  final MaeumCheckNickNameUseCase maeumCheckNickNameUseCase = MaeumCheckNickNameUseCase(maeumAuthRepository: maeumAuthRepositoryImpl);
  final MaeumSignUpUseCase maeumSignUpUseCase = MaeumSignUpUseCase(maeumAuthRepository: maeumAuthRepositoryImpl);
  final MaeumReIssueUseCase maeumReIssueUseCase = MaeumReIssueUseCase(maeumAuthRepository: maeumAuthRepositoryImpl);
  final MaeumWithdrawalUseCase maeumWithdrawalUseCase = MaeumWithdrawalUseCase(maeumLoginoutRepository: maeumAuthRepositoryImpl);

  // Quotes
  final RemoteQuotesDataSource remoteQuotesDataSource = RemoteQuotesDataSource();
  final QuotesRepositoryImpl quotesRepositoryImpl = QuotesRepositoryImpl(remoteQuotesDataSource: remoteQuotesDataSource);
  // -- UseCase
  final GetQuotesUseCase getQuotesUseCase = GetQuotesUseCase(quotesRepository: quotesRepositoryImpl);

  // Routines
  final RemoteRoutinesDataSource remoteRoutinesDataSource = RemoteRoutinesDataSource();
  final RoutinesRepositoryImpl routinesRepositoryImpl = RoutinesRepositoryImpl(remoteRoutinesDataSource: remoteRoutinesDataSource);
  // -- UseCase
  final GetTodayRoutineUseCase getTodayRoutineUseCase = GetTodayRoutineUseCase(routinesRepository: routinesRepositoryImpl);
  final GetRoutinesUseCase getRoutinesUseCase = GetRoutinesUseCase(routinesRepository: routinesRepositoryImpl);
  final AddRoutineUseCase addRoutineUseCase = AddRoutineUseCase(routinesRepository: routinesRepositoryImpl);
  final EditRoutineUseCase editRoutineUseCase = EditRoutineUseCase(routinesRepository: routinesRepositoryImpl);
  final DelRoutineUseCase delRoutineUseCase = DelRoutineUseCase(routinesRepository: routinesRepositoryImpl);
  final GetRoutineDetailUseCase getRoutineDetailUseCase = GetRoutineDetailUseCase(routinesRepository: routinesRepositoryImpl);

  // Core Pose
  final LocalPoseAllDataSource localPoseAllDataSource = LocalPoseAllDataSource();
  final LocalPoseVersionDataSource localPoseVersionDataSource = LocalPoseVersionDataSource();
  final RemotePoseDataSource remotePoseDataSource = RemotePoseDataSource(
    localPoseVersionDataSource: localPoseVersionDataSource,
    localPoseAllDataSource: localPoseAllDataSource,
  );
  final PoseRepositoryImpl poseRepositoryImpl = PoseRepositoryImpl(remotePoseDataSource: remotePoseDataSource);
  // -- UseCase
  final GetPoseAllUseCase getPoseAllUseCase = GetPoseAllUseCase(poseRepository: poseRepositoryImpl);
  final GetPoseRecommendUseCase getPoseRecommendUseCase = GetPoseRecommendUseCase(poseRepository: poseRepositoryImpl);

  // Pose
  final RemotePoseDetailDataSource remotePoseDetailDataSource = RemotePoseDetailDataSource();
  final PoseDetailRepositoryImpl poseDetailRepositoryImpl = PoseDetailRepositoryImpl(remotePoseDetailDataSource: remotePoseDetailDataSource);
  // -- UseCase
  final GetPoseDetailUseCase getPoseDetailUseCase = GetPoseDetailUseCase(poseRepository: poseDetailRepositoryImpl);

  // Timer
  final LocalTimerDataSource localTimerDataSource = LocalTimerDataSource();
  final TimerRepositoryImpl timerRepositoryImpl = TimerRepositoryImpl(localTimerDataSource: localTimerDataSource);
  // -- UseCase
  final GetTimersUseCase getTimersUseCase = GetTimersUseCase(timerRepository: timerRepositoryImpl);
  final AddTimerUseCase addTimerUseCase = AddTimerUseCase(timerRepository: timerRepositoryImpl);
  final DelTimerUseCase delTimerUseCase = DelTimerUseCase(timerRepository: timerRepositoryImpl);

  final RemoteProfileDataSource remoteProfileDataSource = RemoteProfileDataSource();
  final ProfileRepositoryImpl profileRepositoryImpl = ProfileRepositoryImpl(remoteProfileDataSource: remoteProfileDataSource);
  // -- UseCase
  final GetProfileUseCase getProfileUseCase = GetProfileUseCase(profileRepository: profileRepositoryImpl);

  // Purpose
  final RemotePurposeDataSource remotePurposeDataSource = RemotePurposeDataSource();
  final PurposeRepositoryImpl purposeRepositoryImpl = PurposeRepositoryImpl(remotePurposeDataSource: remotePurposeDataSource);
  // -- UseCase
  final GetPurposesUseCase getPurposesUseCase = GetPurposesUseCase(purposeRepository: purposeRepositoryImpl);
  final GetPurposeDetailUseCase getPurposeDetailUseCase = GetPurposeDetailUseCase(purposeRepository: purposeRepositoryImpl);
  final AddPurposeUseCase addPurposeUseCase = AddPurposeUseCase(purposeRepository: purposeRepositoryImpl);
  final EditPurposeUseCase editPurposeUseCase = EditPurposeUseCase(purposeRepository: purposeRepositoryImpl);
  final DelPurposeUseCase delPurposeUseCase = DelPurposeUseCase(purposeRepository: purposeRepositoryImpl);

  return [
    // -- splash
    BlocProvider<SplashBloc>(create: (context) => SplashBloc(maeumReIssueUseCase: maeumReIssueUseCase)),

    // -- auth
    BlocProvider<MaeumAuthBloc>(
      create: (context) => MaeumAuthBloc(
        socialLoginUseCase: socialLoginUseCase,
        socialLogoutUseCase: socialLogoutUseCase,
        maeumLoginUseCase: maeumLoginUseCase,
        maeumRecoveryUseCase: maeumRecoveryUseCase,
      ),
    ),
    BlocProvider<CheckBoxStateCubit>(create: (context) => CheckBoxStateCubit()),
    BlocProvider<SignUpNickNameBloc>(create: (context) => SignUpNickNameBloc(maeumCheckNickNameUseCase: maeumCheckNickNameUseCase)),
    BlocProvider<SignUpSuccessBloc>(
      create: (context) => SignUpSuccessBloc(
        maeumLoginUseCase: maeumLoginUseCase,
        maeumSignUpUseCase: maeumSignUpUseCase,
      ),
    ),

    // -- quotes
    BlocProvider<QuotesBloc>(create: (context) => QuotesBloc(getQuotesUseCase: getQuotesUseCase)),

    // -- routine
    BlocProvider<RoutineDayOfWeekStateCubit>(create: (context) => RoutineDayOfWeekStateCubit()),
    BlocProvider<TodayRoutinePageStateCubit>(create: (context) => TodayRoutinePageStateCubit()),
    BlocProvider<TodayRoutineBloc>(create: (context) => TodayRoutineBloc(getTodayRoutineUseCase: getTodayRoutineUseCase)),
    BlocProvider<RoutinesBloc>(
      create: (context) => RoutinesBloc(
        getRoutinesUseCase: getRoutinesUseCase,
        addRoutineUseCase: addRoutineUseCase,
        editRoutineUseCase: editRoutineUseCase,
        delRoutineUseCase: delRoutineUseCase,
      ),
    ),
    BlocProvider<RoutineBloc>(
      create: (context) => RoutineBloc(
        editRoutineUseCase: editRoutineUseCase,
        getRoutineDetailUseCase: getRoutineDetailUseCase,
      ),
    ),

    // -- page_manager
    BlocProvider<PageManagerStateCubit>(create: (context) => PageManagerStateCubit()),

    // -- core pose
    BlocProvider<PoseTabStateCubit>(create: (context) => PoseTabStateCubit()),
    BlocProvider<PoseMachineSelectorEnumCubit>(create: (context) => PoseMachineSelectorEnumCubit()),
    BlocProvider<PoseAllBloc>(create: (context) => PoseAllBloc(getPoseAllUseCase: getPoseAllUseCase)),
    BlocProvider<PoseRecommendBloc>(create: (context) => PoseRecommendBloc(getPoseRecommendUseCase: getPoseRecommendUseCase)),
    BlocProvider<RoutineAddPoseListStateCubit>(create: (context) => RoutineAddPoseListStateCubit()),
    // -- pose
    BlocProvider<PoseSearchStateCubit>(create: (context) => PoseSearchStateCubit()),
    BlocProvider<PoseDetailBloc>(create: (context) => PoseDetailBloc(getPoseDetailUseCase: getPoseDetailUseCase)),

    // -- timer / metronome
    BlocProvider<IsTimerStateCubit>(create: (context) => IsTimerStateCubit()),

    // -- timer
    BlocProvider<TimerIndexStateCubit>(create: (context) => TimerIndexStateCubit()),
    BlocProvider<TimerStateCubit>(
      create: (context) => TimerStateCubit(
        getTimerUseCase: getTimersUseCase,
        addTimerUseCase: addTimerUseCase,
        delTimerUseCase: delTimerUseCase,
      ),
    ),

    BlocProvider<AddTimerDurationStateCubit>(create: (context) => AddTimerDurationStateCubit()),

    // metronome
    BlocProvider<MetronomeStateCubit>(create: (context) => MetronomeStateCubit()),

    // profile
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(
        getProfileUseCase: getProfileUseCase,
        maeumWithdrawalUseCase: maeumWithdrawalUseCase,
      ),
    ),

    // purpose
    BlocProvider<PurposeCalenderStateCubit>(create: (context) => PurposeCalenderStateCubit()),
    BlocProvider<PurposeStartCalender>(create: (context) => PurposeStartCalender()),
    BlocProvider<PurposeEndCalender>(create: (context) => PurposeEndCalender()),

    BlocProvider<PurposesBloc>(
      create: (context) => PurposesBloc(
        getPurposesUseCase: getPurposesUseCase,
        addPurposeUseCase: addPurposeUseCase,
        editPurposeUseCase: editPurposeUseCase,
        delPurposeUseCase: delPurposeUseCase,
      ),
    ),
    BlocProvider<PurposeBloc>(create: (context) => PurposeBloc(getPurposeDetailUseCase: getPurposeDetailUseCase)),
  ];
}
