import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/view/purpose_add_edit_screen.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose/purpose_add_botton.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose/purpose_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose/purpose_item_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose/purpose_title.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_bloc.dart';

import '../../../../component/my_scaffold.dart';
import '../../view_model/purposes/purposes_event.dart';

class PurposeScreen extends StatefulWidget {
  const PurposeScreen({super.key});

  @override
  State<PurposeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  late final ScrollController _purposeScrollController;

  @override
  void initState() {
    super.initState();
    context.read<PurposesBloc>().add(GetPurposesInitEvent());
    _purposeScrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _purposeScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: const PurposeAppBar(),
      floatingActionButton: PurposeAddButton(
        onTap: () => MaeumNavigator.push(
          context,
          const PurposeAddEditScreen(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _purposeScrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// PurposeTitle Title
              const PurposeTitle(),

              SizedBox(height: 32.h),

              /// Purpose Item List Widget
              const PurposeItemListWidget(),

              SizedBox(height: 98.h),
            ],
          ),
        ),
      ),
    );
  }
}
