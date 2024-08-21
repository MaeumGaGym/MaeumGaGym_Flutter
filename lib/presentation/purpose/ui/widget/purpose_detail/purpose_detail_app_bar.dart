import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_manager_bottom_sheet.dart';

class PurposeDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PurposeEntity? purposeData;

  const PurposeDetailAppBar({
    super.key,
    this.purposeData,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(
                  image: Images.arrowLeft,
                  width: 28.w,
                ),
              ),

              Builder(
                builder: (context) {
                  if (purposeData == null) {
                    return const SizedBox.shrink();
                  } else {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => PurposeManagerBottomSheet(
                            inDetail: true,
                            purposeData: purposeData!,
                          ),
                        );
                      },
                      child: ImageWidget(
                        image: Images.iconsDotsVertical,
                        width: 28.w,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
