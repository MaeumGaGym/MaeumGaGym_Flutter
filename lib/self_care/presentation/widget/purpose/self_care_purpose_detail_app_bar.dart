import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/self_care_purpose_manage_bottom_sheet.dart';

class SelfCarePurposeDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int purposeId;

  const SelfCarePurposeDetailAppBar({
    Key? key,
    required this.purposeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.center,
                      child: const ImageWidget(
                        width: 28,
                        image: Images.arrowLeft,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SelfCarePurposeManageBottomSheet(
                          purposeId: purposeId, inDetail: true);
                    },
                  );
                },
                child: const ImageWidget(
                  width: 28,
                  image: Images.iconsDotsVertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
