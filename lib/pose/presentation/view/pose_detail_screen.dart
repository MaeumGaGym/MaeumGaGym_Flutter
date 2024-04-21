import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/presentation/maeumgagym_re_issue_provider.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/pose_detail_provider.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/detail/pose_detail_app_bar.dart';
import 'package:video_player/video_player.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../widget/detail/pose_detail_body_list_widget.dart';
import '../widget/detail/pose_detail_body_tag.dart';

class PoseDetailScreen extends ConsumerStatefulWidget {
  final int id;

  const PoseDetailScreen({super.key, required this.id});

  @override
  ConsumerState<PoseDetailScreen> createState() => _PoseDetailScreenState();
}

class _PoseDetailScreenState extends ConsumerState<PoseDetailScreen> {
  late VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initFunction();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> initFunction() async {
    await ref.read(poseDetailController.notifier).getDetailData(id: widget.id);

    if (ref
        .read(poseDetailController)
        .statusCode
        .error
        .toString()
        .contains('401')) {
      String? refreshToken = await TokenSecureStorageDi.readLoginRefreshToken();

      await ref
          .read(maeumgagymReIssueController.notifier)
          .getReIssue(refreshToken!);
      await ref
          .read(poseDetailController.notifier)
          .getDetailData(id: widget.id);
    }

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(ref.watch(poseDetailController).video!),
    );
    _controller.initialize().then((_) => setState(() {}));
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    final poseDetail = ref.read(poseDetailController);

    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const PoseDetailAppBar(),
      body: SafeArea(child: Builder(builder: (context) {
        if (_controller.value.isInitialized &&
            ref.watch(poseDetailController).statusCode.hasValue &&
            ref.watch(maeumgagymReIssueController).stateus.hasValue) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 사진
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  alignment: Alignment.center,
                  color: MaeumgagymColor.gray25,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(_controller),
                  ),
                ),

                /// 기타 정보들
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// simpleName, exactName
                      SizedBox(
                        height: 88,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Simple Name
                            PtdTextWidget.titleMedium(poseDetail.simpleName!,
                                MaeumgagymColor.gray600),

                            /// Exact Name
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: PtdTextWidget.titleLarge(
                                  poseDetail.exactName!, MaeumgagymColor.black),
                            )
                          ],
                        ),
                      ),

                      /// Tag
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 36,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: poseDetail.simplePart!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: PoseDetailBodyTag(
                                tagName: poseDetail.simplePart![index],
                              ),
                            );
                          },
                        ),
                      ),

                      /// 운동 방법 챕터
                      const SizedBox(height: 36),
                      PtdTextWidget.titleMedium('자극 부위', MaeumgagymColor.black),
                      const SizedBox(height: 12),
                      PtdTextWidget.bodyMedium(
                        poseDetail.exactPart!.toString().substring(
                            1, poseDetail.exactPart!.toString().length - 1),
                        MaeumgagymColor.black,
                      ),

                      const SizedBox(height: 48),
                      PtdTextWidget.titleMedium('시작 자세', MaeumgagymColor.black),
                      const SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: poseDetail.startPose!.length,
                        itemBuilder: (context, index) {
                          return PtdTextWidget.bodyMedium(
                            poseDetail.startPose![index],
                            MaeumgagymColor.black,
                          );
                        },
                      ),
                      const SizedBox(height: 48),
                      PoseDetailBodyListWidget(
                        title: '운동 방법',
                        listData: poseDetail.exerciseWay!,
                      ),
                      const SizedBox(height: 48),
                      PoseDetailBodyListWidget(
                        title: '호흡법',
                        listData: poseDetail.breatheWay!,
                      ),
                      const SizedBox(height: 48),
                      PoseDetailBodyListWidget(
                        title: '주의사항',
                        listData: poseDetail.caution!,
                      ),
                      // PtdTextWidget.titleMedium(
                      //   '관련 피클',
                      //   MaeumgagymColor.black,
                      // ),
                      // const SizedBox(height: 24),
                      // // PoseDetailBodyPickleListWidget(pikleList: pikleList),
                      // const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: MaeumgagymColor.blue500,
            ),
          );
        }
      })),
    );
  }
}
