import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeungagym_text_style.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/profile/self_care_profile_sex_select_provider.dart';

class SelfCareProfileSexSelectWidget extends ConsumerWidget {
  const SelfCareProfileSexSelectWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropDownState = ref.watch(dropDownCheckProvider);
    final sexSelectState = ref.watch(sexSelectProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "성별",
          style: MaeumGaGymTextStyle.bodyMedium(
            MaeumgagymColor.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: BoxDecoration(
            color: MaeumgagymColor.gray25,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: MaeumgagymColor.gray50,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sexSelectState == "" ? "성별 선택" : sexSelectState,
                  style: MaeumGaGymTextStyle.bodyLarge(
                    sexSelectState == "" ? MaeumgagymColor.gray200 : MaeumgagymColor.black,
                  ),
                ),
                // ImageWidget(
                //   image:
                //       "assets/image/self_care_icon/${dropDownState ? "top" : "bottom"}_arrow_icon.svg",
                //   imageType: ImageType.svg,
                // ),
                ImageWidget(
                  image: dropDownState ? Images.chevronUp : Images.chevronDown,
                  color: MaeumgagymColor.gray500,
                  imageHeight: 24,
                  imageWidth: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
