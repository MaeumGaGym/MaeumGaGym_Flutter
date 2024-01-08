import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

// 구분선 위젯 => Divide 라는 위젯이 있지만, 사용방법이 명확하지 않아, 이 방법을 사용하겠습니다.
class DividingLineWidget extends StatelessWidget {
  const DividingLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 휴대폰 너비만큼 지정
      width: MediaQuery.of(context).size.width,
      height: 8,
      color: MaeumgagymColor.gray25,
    );
  }
}
