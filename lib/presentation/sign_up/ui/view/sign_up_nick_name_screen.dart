import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_button.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/ui/view/sign_up_success_screen.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/ui/widget/sign_up_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/nick_name/sign_up_nick_name_bloc.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/nick_name/sign_up_nick_name_event.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/nick_name/sign_up_nick_name_state.dart';

class SignUpNickNameScreen extends StatefulWidget {
  final SocialStateEnum socialEnum;
  final String oAuthToken;

  const SignUpNickNameScreen({
    super.key,
    required this.socialEnum,
    required this.oAuthToken,
  });

  @override
  State<SignUpNickNameScreen> createState() => _SignUpNickNameScreenState();
}

class _SignUpNickNameScreenState extends State<SignUpNickNameScreen> {
  late TextEditingController _nicknameController;
  late FocusNode _nickNameFocusNode;

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();
    _nickNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
    _nickNameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasFocus = _nickNameFocusNode.hasFocus;
    bool hasText = _nicknameController.text.isNotEmpty;

    SignUpNickNameBloc signUpNickNameBloc = context.watch<SignUpNickNameBloc>();

    Text? checkErrorText() {
      if (signUpNickNameBloc.state.signUpNickNameState == BlocStateEnum.empty ||
          signUpNickNameBloc.state.signUpNickNameState == BlocStateEnum.loading) {
        return null;
      }

      if(signUpNickNameBloc.state.signUpNickNameState == BlocStateEnum.error){
        return MaeumText.bodyTiny("닉네임은 2~10자로 공백을 포함할 수 없어요.", MaeumColor.red500);
      }

      if (!signUpNickNameBloc.state.value) return null;
      return MaeumText.bodyTiny("이미 사용중인 닉네임이예요", MaeumColor.red500);
    }

    return BlocListener<SignUpNickNameBloc, SignUpNickNameState<bool>>(
      listenWhen: (previous, current) => current.signUpNickNameState == BlocStateEnum.loaded && current.value == false,
      listener: (context, state) => MaeumNavigator.go(
        context,
        SignUpSuccessScreen(
          socialEnum: widget.socialEnum,
          oAuthToken: widget.oAuthToken,
          nickName: _nicknameController.text,
        ),
      ),
      child: MyScaffold(
        appBar: const SignUpAppBar(),
        bottomSheet: Padding(
          padding: EdgeInsets.only(bottom: hasFocus ? 0 : 20.h),
          child: MaeumButton(
            onTap: hasText
                ? () => context
                .read<SignUpNickNameBloc>()
                    .add(SignUpCheckNickNameEvent(
                      nickName: _nicknameController.text,
                    ))
                : null,
            width: hasFocus ? 1.sw : 1.sw - 40.w,
            height: 58.h,
            borderRadius: hasFocus ? 0.r : 8.r,
            color: hasText ? MaeumColor.blue500 : MaeumColor.gray400,
            text: "회원가입",
            fontColor: hasText ? MaeumColor.white : MaeumColor.gray200,
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              MaeumText.titleLarge("닉네임", MaeumColor.black),

              SizedBox(height: 8.h),
              MaeumText.bodyMedium("자신만의 닉네임을 입력해 주세요.", MaeumColor.gray600),

              SizedBox(height: 32.h),

              TextFormField(
                controller: _nicknameController,
                focusNode: _nickNameFocusNode,
                onTap: () => setState(() {}),
                onChanged: (value) => setState(() {}),
                onTapOutside: (_) => setState(() => _nickNameFocusNode.unfocus()),
                style: TextStyle(
                  fontFamily: "Pretendard",
                  height: 1,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: MaeumColor.black,
                  overflow: TextOverflow.visible,
                ),
                cursorHeight: 20.h,
                cursorColor: MaeumColor.black,
                cursorErrorColor: MaeumColor.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MaeumColor.blue500)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: MaeumColor.gray400)),
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: MaeumColor.red500)),
                  focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: MaeumColor.red500)),
                  error: checkErrorText(),
                  floatingLabelStyle: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: MaeumColor.gray400,
                    overflow: TextOverflow.visible,
                  ),
                  label: MaeumText.bodyLarge("닉네임", MaeumColor.gray400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
