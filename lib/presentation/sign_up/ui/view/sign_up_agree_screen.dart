import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_button.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/ui/view/sign_up_nick_name_screen.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/ui/widget/agree/agree_widget.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/ui/widget/sign_up_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/agree/check_box_state_cubit.dart';

import '../../../../core/maeum/maeum_text.dart';
import '../../../../core/maeum/maeum_color.dart';
import '../../../../core/enum/social_state_enum.dart';
import '../../view_model/agree/check_box_state_model.dart';
import '../widget/agree/check_box_widget.dart';

class SignUpAgreeScreen extends StatelessWidget {
  final SocialStateEnum socialEnum;
  final String oAuthToken;

  const SignUpAgreeScreen({
    super.key,
    required this.socialEnum,
    required this.oAuthToken,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBoxStateCubit, CheckBoxStateModel>(
      builder: (_, state) {
        return MyScaffold(
          appBar: const SignUpAppBar(),
          bottomSheet: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Builder(
              builder: (context) {
                if(state.allAgree) {
                  return MaeumButton(
                    onTap: () => MaeumNavigator.push(
                      context,
                      SignUpNickNameScreen(
                        oAuthToken: oAuthToken,
                        socialEnum: socialEnum,
                      ),
                    ),
                    text: '확인',
                    fontColor: MaeumColor.white,
                    width: 1.sw - 40.w,
                    height: 58.h,
                    color: MaeumColor.blue500,
                    borderRadius: 8.r,
                  );
                } else {
                  return MaeumButton(
                    width: 1.sw - 40.w,
                    height: 58.h,
                    color: MaeumColor.gray400,
                    borderRadius: 8.r,
                    text: "확인",
                    fontColor: MaeumColor.gray200,
                  );
                }
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 약관 동의 글자
                SizedBox(height: 20.h),
                MaeumText.titleLarge('약관동의', MaeumColor.black),

                /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
                SizedBox(height: 8.h),
                MaeumText.bodyMedium('서비스 이용을 위해 필수 약관동의가 필요해요.', MaeumColor.gray600),

                /// 모두 동의해요. 위쪽 Divider
                SizedBox(height: 40.h),
                Divider(height: 2, color: MaeumColor.gray50),

                /// 모두 동의해요. 위젯
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => context.read<CheckBoxStateCubit>().clickAllAgree(),
                      child: Row(
                        children: [
                          /// CheckBoxWidget ( allCheck )
                          CheckBoxWidget(state: state.allAgree),
                          SizedBox(width: 12.w),

                          /// 모두 동의해요. 글자
                          MaeumText.labelLarge(
                            '모두 동의해요.',
                            MaeumColor.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                /// 모두 동의해요. 아래쪽 Divider
                Divider(height: 2, color: MaeumColor.gray50),

                SizedBox(height: 12.h),
                AgreeWidget(
                  onTap: () => context.read<CheckBoxStateCubit>().clickPersonInformation(),
                  state: state.personInformation,
                  isDetail: true,
                  title: "개인정보 수집 이용 동의",
                ),

                SizedBox(height: 8.h),
                AgreeWidget(
                  onTap: () => context.read<CheckBoxStateCubit>().clickConditionsOfUse(),
                  state: state.conditionsOfUse,
                  isDetail: true,
                  title: "이용 약관 동의",
                ),

                SizedBox(height: 8.h),
                AgreeWidget(
                  onTap: () => context.read<CheckBoxStateCubit>().clickMoreThanAgeFourteen(),
                  state: state.moreThanAgeFourteen,
                  title: "만 14세 이상",
                ),

                SizedBox(height: 8.h),
                AgreeWidget(
                  onTap: () => context.read<CheckBoxStateCubit>().clickMarketingInformation(),
                  state: state.marketingInformation,
                  isOption: true,
                  title: "마케팅 정보 수신 동의",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}