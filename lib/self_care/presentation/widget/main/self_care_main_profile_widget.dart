import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/profile/self_care_profile_main_screen.dart';

import '../../provider/profile/self_care_profile_get_profile_provider.dart';

class SelfCareMainProfileWidget extends ConsumerStatefulWidget {
  const SelfCareMainProfileWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareMainProfileWidget> createState() =>
      _SelfCareMainProfileContainerState();
}

class _SelfCareMainProfileContainerState
    extends ConsumerState<SelfCareMainProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(selfCareProfileGetProfileProvider);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelfCareProfileMainScreen(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Builder(
                    builder: (context) {
                      if(profileState.profileImage != null){
                        return ImageWidget(
                          image: profileState.profileImage!,
                          width: 48,
                          height: 48,
                          imageType: ImageType.pngNetwork,
                        );
                      } else {
                        return const ImageWidget(
                          image: Images.iconsNotDesignSysDefaultProfile,
                          width: 48,
                          height: 48,
                          imageType: ImageType.png,
                        );
                      }
                    },
                  )
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PtdTextWidget.labelLarge(
                          profileState.nickname.toString(),
                          MaeumgagymColor.black,
                        ),
                        const SizedBox(width: 8),
                        const ImageWidget(
                          width: 18,
                          image: Images.iconsNotDesignSysProfileIcon,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    PtdTextWidget.bodyMedium(
                      "${profileState.totalWakatime}시간",
                      MaeumgagymColor.gray400,
                    ),
                  ],
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
