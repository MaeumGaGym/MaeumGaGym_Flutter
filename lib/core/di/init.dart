import 'package:get_it/get_it.dart';

import 'package:maeum_ga_gym_flutter/core/component/pose/domain/repository/pose_recommend_repository.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_repository.dart';
import 'package:maeum_ga_gym_flutter/home/data/repositoryImpl/home_quotes_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/home/data/repositoryImpl/home_today_routines_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/pose/data/repositoryImpl/pose_detail_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_login_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_recovery_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_sign_up_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/nickname_check_repository_impl.dart';
import '../../home/domain/repository/home_quotes_repository.dart';
import '../../home/domain/repository/home_today_routines_repository.dart';
import '../../pose/domain/repository/pose_detail_repository.dart';
import '../../sign_up/domain/repository/maeumgagym_login_repository.dart';
import '../../sign_up/domain/repository/maeumgagym_recovery_repository.dart';
import '../../sign_up/domain/repository/maeumgagym_sign_up_repository.dart';
import '../../sign_up/domain/repository/nickname_check_repository.dart';
import '../component/pose/domain/repository/pose_all_repository.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/data/maeumgagym_re_issue_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/repositoryImpl/pose_all_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/repositoryImpl/pose_recommend_repository_impl.dart';

GetIt locator = GetIt.instance;

initLocator() {
  // locator.registerLazySingleton<AlbumService>(() => AlbumServiceImplementation());
  // ReIssue
  locator.registerLazySingleton<MaeumgagymReIssueRepository>(
      () => MaeumgagymReIssueRepositoryImpl());

  // Pose
  locator
      .registerLazySingleton<PoseAllRepository>(() => PoseAllRepositoryImpl());
  locator.registerLazySingleton<PoseRecommendRepository>(
      () => PoseRecommendRepositoryImpl());
  locator.registerLazySingleton<PoseDetailRepository>(
      () => PoseDetailRepositoryImpl());

  // Auth
  locator.registerLazySingleton<MaeumgagymLoginRepository>(
      () => MaeumgagymLoginRepositoryImpl());
  locator.registerLazySingleton<MaeumgagymRecoveryRepository>(
      () => MaeumgagymRecoveryRepositoryImpl());
  locator.registerLazySingleton<MaeumgagymSignUpRepository>(
      () => MaeumgagymSignUpRepositoryImpl());
  locator.registerLazySingleton<NicknameCheckRepository>(
      () => NicknameCheckRepositoryImpl());

  // home
  locator.registerLazySingleton<HomeQuotesRepository>(
      () => HomeQuotesRepositoryImpl());
  locator.registerLazySingleton<HomeTodayRoutinesRepository>(
      () => HomeTodayRoutinesRepositoryImpl());
}
