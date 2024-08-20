import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purposes_entity.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose/purpose_empty_widget.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose/purpose_item_wiget.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_bloc.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_state.dart';

import '../../../../../component/maeum_loding_indicator.dart';
import '../../../../../core/enum/bloc_state_enum.dart';

class PurposeItemListWidget extends StatelessWidget {
  const PurposeItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurposesBloc, PurposesState<PurposesEntity>>(
      builder: (_, state) {
        if (state.purposesState == BlocStateEnum.loading ||
            state.purposesState == BlocStateEnum.empty) {
          return const MaeumLoadingIndicator();
        } else if (state.purposesState == BlocStateEnum.error){
          return const PurposeEmptyWidget();
        }
        else {
          final PurposesEntity purposesData = state.value;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: purposesData.purposes.length,
            itemBuilder: (_, index) {
              final PurposeEntity purposeData = purposesData.purposes[index];

              /// Purpose Item
              return PurposeItemWidget(purposeData: purposeData);
            },
          );
        }
      },
    );
  }
}
