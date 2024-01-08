import 'package:flutter/material.dart';

class SelfCareProfileMainInfoWidgetContainer extends StatelessWidget {
  const SelfCareProfileMainInfoWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox( // 이거 디자인 확정안됬다고 해서 나중에 다시 추가함
        width: MediaQuery.of(context).size.width,
        height: 295,
        child: Placeholder(),
      ),
    );
  }
}
