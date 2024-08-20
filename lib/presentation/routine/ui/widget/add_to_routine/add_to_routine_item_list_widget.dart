// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:maeumgagym_flutter/presentation/routine/ui/widget/add_to_routine/add_to_routine_item_widget.dart';
//
// import '../../../../../component/maeum_loding_indicator.dart';
// import '../../../../../core/enum/bloc_state_enum.dart';
// import '../../../../../domain/routines/entity/routine_entity.dart';
// import '../../../../../domain/routines/entity/routines_entity.dart';
// import '../../../view_model/routines/routines_bloc.dart';
// import '../../../view_model/routines/routines_state.dart';
// import '../routine/routine_emtpry_widget.dart';
//
// class AddToRoutineItemListWidget extends StatelessWidget {
//   const AddToRoutineItemListWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RoutinesBloc, RoutinesState<RoutinesEntity>>(
//       builder: (_, state) {
//         if (state.routinesState == BlocStateEnum.loading ||
//             state.routinesState == BlocStateEnum.empty) {
//           return const MaeumLoadingIndicator();
//         } else if (state.value.routines.isEmpty) {
//           return const RoutineEmptyWidget();
//         } else {
//           final RoutinesEntity routinesData = state.value;
//
//           return ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: routinesData.routines.length,
//             itemBuilder: (_, index) {
//               final RoutineEntity routineData = routinesData.routines[index];
//
//               /// Routine Item
//               return AddToRoutineItemWidget(routineData: routineData);
//             },
//           );
//         }
//       },
//     );
//   }
// }
