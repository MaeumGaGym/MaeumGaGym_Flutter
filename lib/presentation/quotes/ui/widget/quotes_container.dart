import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/domain/quotes/entity/quotes_entity.dart';
import 'package:maeumgagym_flutter/presentation/quotes/view_model/quotes_bloc.dart';
import 'package:maeumgagym_flutter/presentation/quotes/view_model/quotes_state.dart';

import '../../../../core/maeum/maeum_text.dart';
import '../../../../core/maeum/maeum_color.dart';

class QuotesContainer extends StatelessWidget {
  const QuotesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesBloc, QuotesState<QuotesEntity>>(
      builder: (context, state) {
        if (state.homeState == BlocStateEnum.loading || state.homeState == BlocStateEnum.empty) {
          return const MaeumLoadingIndicator();
        } else if (state.homeState == BlocStateEnum.error) {
          return Text(state.errorOfNull.toString());
        } else {
          return Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaeumText.titleMedium(
                  state.value.message,
                  MaeumColor.blue500,
                ),
                SizedBox(height: 8.h),
                MaeumText.labelMedium(
                  state.value.author,
                  MaeumColor.gray500,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
