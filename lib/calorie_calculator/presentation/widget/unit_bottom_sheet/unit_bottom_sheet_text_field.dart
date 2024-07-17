import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_data_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../../../config/maeumgagym_color.dart';

class UnitBottomSheetTextField extends ConsumerStatefulWidget {
  final FoodDataStateNotifier foodDataStateNotifier;
  final int index, textFieldValue;

  const UnitBottomSheetTextField({
    super.key,
    required this.index,
    required this.textFieldValue,
    required this.foodDataStateNotifier,
  });

  @override
  ConsumerState<UnitBottomSheetTextField> createState() =>
      _UnitBottomSheetTextFieldState();
}

class _UnitBottomSheetTextFieldState
    extends ConsumerState<UnitBottomSheetTextField> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int index = widget.index;
    final foodDataStateNotifier = widget.foodDataStateNotifier;
    textEditingController.text = widget.textFieldValue.toString();

    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: MediaQuery.of(context).viewInsets.bottom >= 10
              ? MaeumgagymColor.blue500
              : MaeumgagymColor.gray100,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              foodDataStateNotifier.decrementUnitValue(index);
            },
            child: const SizedBox(
              width: 64,
              child: Center(
                child: ImageWidget(
                  image: Images.editRemoveMinus,
                  width: 24,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 170,
            height: 64,
            child: Center(
              child: TextField(
                // controller
                controller: textEditingController,
                // 복붙 불가 (문자가 들어오는 것을 예방)
                enableInteractiveSelection: false,

                //onTapOutside: (event) => FocusScope.of(context).unfocus(),

                onChanged: (value) {
                  foodDataStateNotifier.updateUnitValue(
                    index,
                    value,
                  );
                },
                keyboardType: TextInputType.number,
                cursorHeight: 18,
                cursorColor: MaeumgagymColor.blue500,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: pretendard,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 1,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 4),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              foodDataStateNotifier.incrementUnitValue(index);
            },
            child: const SizedBox(
              width: 64,
              child: Center(
                child: ImageWidget(
                  image: Images.editAdd,
                  width: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
