import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/profile/entity/profile_entity.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_bloc.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_state.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState<ProfileEntity>>(
      builder: (_, state) {
        if(state.profileState == BlocStateEnum.loading || state.profileState == BlocStateEnum.empty){
          return const MaeumLoadingIndicator();
        } else if(state.profileState == BlocStateEnum.error){
          throw Exception(state.errorOfNull);
        } else {
          final ProfileEntity profileData = state.value;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Builder(
                          builder: (context) {
                            if(profileData.profileImage != null){
                              return ImageWidget(
                                image: profileData.profileImage!,
                                width: 48.w,
                                height: 48.h,
                                imageType: ImageType.pngNetwork,
                              );
                            } else {
                              return ImageWidget(
                                image: Images.iconsNotDesignSysDefaultProfile,
                                width: 48.w,
                                height: 48.h,
                              );
                            }
                          },
                        )
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MaeumText.labelLarge(
                              profileData.nickName,
                              MaeumColor.black,
                            ),
                            SizedBox(width: 8.w),
                            ImageWidget(
                              width: 18.w,
                              image: Images.iconsNotDesignSysProfileIcon,
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        MaeumText.bodyMedium(
                          "${profileData.totalWakatime}시간",
                          MaeumColor.gray400,
                        ),
                      ],
                    ),
                  ],
                ),
                ImageWidget(
                  width: 24.w,
                  image: Images.chevronRight,
                  color: MaeumColor.gray200,
                ),
              ],
            ),
          );
        }
      }
    );
  }
}
