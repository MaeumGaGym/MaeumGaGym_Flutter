import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_detail_purposes_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/self_care_purpose_detail_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/self_care_purpose_time_table_widget.dart';

class SelfCarePurposeDetailScreen extends ConsumerStatefulWidget {
  final int purposeId;

  const SelfCarePurposeDetailScreen({
    super.key,
    required this.purposeId,
  });

  @override
  ConsumerState<SelfCarePurposeDetailScreen> createState() =>
      _SelfCarePurposeDetailScreenState();
}

class _SelfCarePurposeDetailScreenState
    extends ConsumerState<SelfCarePurposeDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => ref
          .read(selfCarePurposeDetailPurposesProvider.notifier)
          .getDetailPurpose(purposeId: widget.purposeId),
    );
  }

  String formatDate(String date) {
    DateTime parsingDate = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy년 MM월 dd일 (E)', 'ko').format(parsingDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final purposesDetailState =
        ref.watch(selfCarePurposeDetailPurposesProvider);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: SelfCarePurposeDetailAppBar(purposeId: widget.purposeId),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: purposesDetailState.statusCode.when(
            data: (data) {
              if (data == 200) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PtdTextWidget.titleLarge(
                      purposesDetailState.title.toString(),
                      MaeumgagymColor.black,
                    ),
                    const SizedBox(height: 12),
                    SelfCarePurposeTimeTableWidget(
                      title: "시작",
                      date: formatDate(purposesDetailState.startDate.toString()),
                    ),
                    const SizedBox(height: 12),

                    /// 패딩은 보기가 안좋아서 SizedBox 쓸게요
                    SelfCarePurposeTimeTableWidget(
                      title: "마감",
                      date: formatDate(purposesDetailState.endDate.toString()),
                    ),
                    const SizedBox(height: 32),
                    PtdTextWidget.bodyMedium(
                      purposesDetailState.content.toString(),
                      MaeumgagymColor.black,
                    ),
                  ],
                );
              } else {
                return Text(
                  "${purposesDetailState.statusCode}",
                );
              }
            },
            error: (error, stack) {
              return const Text("에러");
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(
                  color: MaeumgagymColor.blue500,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
