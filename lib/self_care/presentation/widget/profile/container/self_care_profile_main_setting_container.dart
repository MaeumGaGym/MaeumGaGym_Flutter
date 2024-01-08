import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/widget/self_care_profile_setting_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_dummy.dart';

class SelfCareProfileMainSettingContainer extends StatelessWidget {
  const SelfCareProfileMainSettingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 216,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MaeumgagymColor.gray50,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: selfCareProfileSettingItemList.length,
            itemBuilder: (context, index) {
              return SelfCareProfileSettingItemWidget(
                title: selfCareProfileSettingItemList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
