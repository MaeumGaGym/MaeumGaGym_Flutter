import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine/routine_emtpry_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine/routine_item_widget.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_state.dart';

class RoutineItemListWidget extends StatelessWidget {
  const RoutineItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutinesBloc, RoutinesState<RoutinesEntity>>(
      builder: (_, state) {
        if (state.routinesState == BlocStateEnum.loading ||
            state.routinesState == BlocStateEnum.empty) {
          return const MaeumLoadingIndicator();
        } else if (state.value.routines.isEmpty) {
          return const RoutineEmptyWidget();
        } else {
          final RoutinesEntity routinesData = state.value;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: routinesData.routines.length,
            itemBuilder: (_, index) {
              final RoutineEntity routineData = routinesData.routines[index];

              /// Routine Item
              return RoutineItemWidget(routineData: routineData);
            },
          );
        }
      },
    );
  }
}
