import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/profile/entity/profile_entity.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/widget/widget/profile_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/widget/widget/profile_info_widget.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/widget/widget/profile_setting_widget.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_bloc.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_event.dart';

import '../../../../component/image_widget.dart';
import '../../../../core/images.dart';
import '../../view_model/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: const ProfileAppBar(),
      body: BlocBuilder<ProfileBloc, ProfileState<ProfileEntity>>(
        builder: (_, state) {
          if (state.profileState == BlocStateEnum.loading || state.profileState == BlocStateEnum.empty) {
            return const MaeumLoadingIndicator();
          } else {
            final ProfileEntity profileData = state.value;

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Builder(
                      builder: (context) {
                        if (profileData.profileImage != null) {
                          return ImageWidget(
                            image: profileData.profileImage!,
                            width: 120.w,
                            imageWidth: 120.w,
                            imageType: ImageType.pngNetwork,
                          );
                        } else {
                          return ImageWidget(
                            image: Images.iconsNotDesignSysDefaultProfile,
                            width: 120.w,
                            imageWidth: 120.w,
                          );
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 16.h, left: 4.w),
                    child: MaeumText.titleMedium(
                      profileData.nickName,
                      MaeumColor.black,
                    ),
                  ),

                  SizedBox(height: 32.h),

                  ProfileInfoWidget(totalWakatime: profileData.totalWakatime),

                  SizedBox(height: 32.h),

                  const ProfileSettingWidget(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
