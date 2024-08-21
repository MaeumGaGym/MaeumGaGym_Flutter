import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_toast_message.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/data/purpose/dto/request/add_purpsoe_request.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purposes_entity.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_add_edit/purpose_add_edit_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_add_edit/purpose_add_edit_botton.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_add_edit/purpose_add_edit_date_widget.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_add_edit/purpose_add_edit_text_field.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_bloc.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose/purpose_event.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose_add_edit/purpose_calender_state_cubit.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose_date_format_func.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_event.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_state.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../domain/purposes/entity/purpose_entity.dart';
import '../../view_model/purpose_add_edit/purpose_calender_model.dart';
import '../../view_model/purposes/purposes_bloc.dart';

class PurposeAddEditScreen extends StatefulWidget {
  final PurposeEntity? purposeData;

  const PurposeAddEditScreen({super.key, this.purposeData});

  @override
  State<PurposeAddEditScreen> createState() => _PurposeAddEditScreenState();
}

class _PurposeAddEditScreenState extends State<PurposeAddEditScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  late final FocusNode _titleNode;
  late final FocusNode _contentNode;

  @override
  void initState() {
    super.initState();

    if(widget.purposeData == null){
      _titleController = TextEditingController();
      _contentController = TextEditingController();

      context.read<PurposeStartCalender>().saveDate(date: DateTime.now());
      context.read<PurposeEndCalender>().saveDate(date: DateTime.now());
    } else {
      _titleController = TextEditingController(text: widget.purposeData!.title);
      _contentController = TextEditingController(text: widget.purposeData!.content);

      context.read<PurposeStartCalender>().saveDate(date: DateTime.parse(widget.purposeData!.startDate));
      context.read<PurposeEndCalender>().saveDate(date: DateTime.parse(widget.purposeData!.endDate));
    }

    _titleNode = FocusNode()..addListener(() => setState(() {}));
    _contentNode = FocusNode()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();

    _titleNode.dispose();
    _contentNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAdd = widget.purposeData == null;

    return MultiBlocListener(
      listeners: [
        BlocListener<PurposesBloc, PurposesState<PurposesEntity>>(
          listenWhen: (previous, current) => current.purposesState == BlocStateEnum.loaded,
          listener: (context, state) {
            showTopSnackBar(Overlay.of(context), MaeumToastMessage(title: "목표를 ${isAdd ? "추가" : "수정"}했어요."));

            MaeumNavigator.pop(context);
            !isAdd ? MaeumNavigator.pop(context) : null;
          },
        ),
      ],
      child: MyScaffold(
        appBar: PurposeAddEditAppBar(isAdd: isAdd),
        bottomSheet: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: PurposeAddEditButton(
            onTap: () {
              String startDate = PurposeDateFormatFunc.formatPostDate(
                  context.read<PurposeStartCalender>().state.date);

              String endDate = PurposeDateFormatFunc.formatPostDate(
                  context.read<PurposeEndCalender>().state.date);

              int compareDate = startDate.compareTo(endDate);

              if(_titleController.text.isNotEmpty && _contentController.text.isNotEmpty && compareDate <= 0){
                final AddEditPurposeRequest request = AddEditPurposeRequest(
                  title: _titleController.text,
                  content: _contentController.text,
                  startDate: startDate,
                  endDate: endDate,
                );

                if(isAdd){
                  context.read<PurposesBloc>().add(
                    AddPurposeEvent(addEditPurposeRequest: request));
                } else {
                  context.read<PurposesBloc>().add(EditPurposeEvent(
                        purposeId: widget.purposeData!.id,
                        addEditPurposeRequest: request,
                      ));

                  context.read<PurposeBloc>().add(GetPurposeDetailEvent(purposeId: widget.purposeData!.id));
                }

                // MaeumNavigator.pop(context);
                // !isAdd ? MaeumNavigator.pop(context) : null;
              } else {
                showTopSnackBar(
                  Overlay.of(context),
                  const MaeumToastMessage(title: "목표 추가에 실패했어요", isError: true),
                );
              }
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
            child: Column(
              children: [
                PurposeAddEditTextField(
                  title: "제목",
                  controller: _titleController,
                  focusNode: _titleNode,
                  hintText: "제목을 입력해주세요.",
                  height: 48.h,
                ),

                SizedBox(height: 32.h),

                BlocBuilder<PurposeStartCalender, PurposeCalenderModel>(
                  builder: (_, state) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        PurposeStartCalender notifier = context.read<PurposeStartCalender>();

                        if(context.read<PurposeEndCalender>().state.isActive){
                          context.read<PurposeEndCalender>().overlayRemove();
                        }

                        if (notifier.state.isActive) {
                          notifier.overlayRemove();
                          setState(() {});
                        } else {
                          notifier.overlayCalenderInset(context: context);
                          setState(() {});
                        }
                      },
                      child: PurposeAddEditDateWidget(
                        title: "시작 날짜",
                        state: state,
                      ),
                    );
                  }
                ),

                SizedBox(height: 32.h),

                BlocBuilder<PurposeEndCalender, PurposeCalenderModel>(
                  builder: (_, state) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        PurposeCalenderStateCubit notifier = context.read<PurposeEndCalender>();

                        if(context.read<PurposeStartCalender>().state.isActive){
                          context.read<PurposeStartCalender>().overlayRemove();
                        }

                        if (notifier.state.isActive) {
                          notifier.overlayRemove();
                          setState(() {});
                        } else {
                          notifier.overlayCalenderInset(context: context);
                          setState(() {});
                        }
                      },
                      child: PurposeAddEditDateWidget(
                        title: "종료 날짜",
                        state: state,
                      ),
                    );
                  }
                ),

                SizedBox(height: 32.h),

                PurposeAddEditTextField(
                  title: "내용",
                  controller: _contentController,
                  focusNode: _contentNode,
                  hintText: "내용을 입력해주세요.",
                  height: 200.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
