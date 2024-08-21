import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/routine_add_edit_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine/routine_add_button.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine/routine_title.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_bloc.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routines/routines_event.dart';
import '../widget/routine/routine_app_bar.dart';
import '../widget/routine/routine_item_list_widget.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  late final ScrollController _routineScrollController;

  @override
  void initState() {
    super.initState();
    context.read<RoutinesBloc>().add(GetRoutinesInitEvent());

    _routineScrollController = ScrollController();
    _routineScrollController.addListener(() => listener());
  }

  @override
  void dispose() {
    super.dispose();
    _routineScrollController.dispose();
  }

  void listener() {
    /// 화면 스크롤 컨트롤러의 위치가 최대 스크롤 위치이면서 API가 로딩 중이 아닐 때 (API가 실행 중이 아닐 때)
    if (_routineScrollController.position.pixels ==
        _routineScrollController.position.maxScrollExtent) {
      if(context.read<RoutinesBloc>().state.value.routines.length % 10 == 0){
        context.read<RoutinesBloc>().add(GetRoutinesEvent(index: context.read<RoutinesBloc>().state.value.routines.length ~/ 10));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: const RoutineAppBar(),
      floatingActionButton: RoutineAddButton(
        onTap: () => MaeumNavigator.push(context, const RoutineAddEditScreen()),
      ),
      body: SingleChildScrollView(
        controller: _routineScrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Routine Title
              const RoutineTitle(),

              SizedBox(height: 32.h),

              /// Routine Item List Widget
              const RoutineItemListWidget(),

              SizedBox(height: 98.h),
            ],
          ),
        ),
      ),
    );
  }
}