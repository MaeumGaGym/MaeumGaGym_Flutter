import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareItemWidget extends StatelessWidget {
  final String imagePath, title;

  final double width, height;

  final Widget routePage;

  const SelfCareItemWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.title,
    required this.routePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => routePage,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  // 이것도 align 지정안하면 크기 변경 안돼요
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.gray200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ImageWidget(
                    imageWidth: width,
                    imageHeight: height,
                    image: imagePath,
                  ),
                ),
                const SizedBox(width: 16),
                PtdTextWidget.bodyLarge(
                  title,
                  MaeumgagymColor.black,
                ),
              ],
            ),
            ImageWidget(
              width: 24,
              image: Images.chevronRight,
              color: MaeumgagymColor.gray200,
            ),
          ],
        ),
      ),
    );
  }
}
