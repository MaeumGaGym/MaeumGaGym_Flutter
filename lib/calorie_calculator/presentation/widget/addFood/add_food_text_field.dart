/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_search_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class AddFoodTextField extends ConsumerStatefulWidget {
  final TextEditingController textController;

  const AddFoodTextField({super.key, required this.textController});

  @override
  ConsumerState<AddFoodTextField> createState() => _AddFoodTextFieldState();
}

class _AddFoodTextFieldState extends ConsumerState<AddFoodTextField> {
  @override
  Widget build(BuildContext context) {
    /// 변수
    final num mediaWidth = MediaQuery.of(context).size.width;
    final TextEditingController textController = widget.textController;

    return Container(
      width: mediaWidth - 40,
      height: 40,
      decoration: BoxDecoration(
        color: MaeumgagymColor.gray50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Search Icon
            const ImageWidget(
              image: Images.iconsSearch,
              width: 24,
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: mediaWidth - 96,
              child: TextField(
                // controller
                controller: textController,

                // OnTap
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                onChanged: (value) =>
                    ref.read(foodSearchController.notifier).saveText(value),

                // cusor
                cursorHeight: 15,
                cursorColor: MaeumgagymColor.blue500,

                //style
                style: TextStyle(
                  fontFamily: pretendard,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1,
                ),

                // decoration
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 7),
                  hintText: '음식 검색',
                  hintStyle: TextStyle(
                    fontFamily: pretendard,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MaeumgagymColor.gray300,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
