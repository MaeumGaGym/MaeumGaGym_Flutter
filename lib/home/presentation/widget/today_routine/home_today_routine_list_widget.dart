import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/image_widget.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../../../../pose/presentation/view/pose_detail_screen.dart';

class HomeTodayRoutineListWidget extends ConsumerWidget {
  final int id, repetitions, sets;
  final String thumbnail, name;

  const HomeTodayRoutineListWidget({
    super.key,
    required this.id,
    required this.repetitions,
    required this.sets,
    required this.thumbnail,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PoseDetailScreen(
                id: id,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: MaeumgagymColor.gray25,
                      shape: BoxShape.circle,
                    ),
                    child: ImageWidget(
                      image: thumbnail,
                      imageType: ImageType.pngNetwork,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PtdTextWidget.bodyLarge(
                        name,
                        MaeumgagymColor.black,
                      ),
                      const SizedBox(height: 2),
                      PtdTextWidget.bodyMedium(
                        "$repetitions개 | $sets세트",
                        MaeumgagymColor.gray400,
                      ),
                    ],
                  ),
                ],
              ),
              const ImageWidget(
                image: 'assets/image/core_icon/right_arrow_icon.svg',
                imageType: ImageType.svg,
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
