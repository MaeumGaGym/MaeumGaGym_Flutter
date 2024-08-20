import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_detail/purpose_date_widget.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_bloc.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_event.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_state.dart';

import '../widget/purpose_detail/purpose_detail_app_bar.dart';

class PurposeDetailScreen extends StatefulWidget {
  final int purposeId;

  const PurposeDetailScreen({
    super.key,
    required this.purposeId,
  });

  @override
  State<PurposeDetailScreen> createState() => _PurposeDetailScreenState();
}

class _PurposeDetailScreenState extends State<PurposeDetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<PurposeBloc>()
        .add(GetPurposeDetailEvent(purposeId: widget.purposeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurposeBloc, PurposeState<PurposeEntity>>(
        builder: (_, state) {
      if (state.purposeState == BlocStateEnum.loading ||
          state.purposeState == BlocStateEnum.empty) {
        return const MyScaffold(
          appBar: PurposeDetailAppBar(),
          body: MaeumLoadingIndicator(),
        );
      } else {
        PurposeEntity purposeData = state.value;
        return MyScaffold(
          appBar: PurposeDetailAppBar(purposeData: state.value),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaeumText.titleLarge(
                  purposeData.title,
                  MaeumColor.black,
                ),
                SizedBox(height: 12.h),
                PurposeDateWidget(
                  title: "시작",
                  date: purposeData.startDate,
                ),
                SizedBox(height: 12.h),
                PurposeDateWidget(
                  title: "마감",
                  date: purposeData.endDate,
                ),
                SizedBox(height: 32.h),
                MaeumText.bodyMedium(purposeData.content, MaeumColor.black),
              ],
            ),
          ),
        );
      }
    });
  }
}
