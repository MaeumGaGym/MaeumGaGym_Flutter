/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

Future readMoreWidget(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10.0),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        child: Wrap(
          children: [
            /// 이용 약관
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  PtdTextWidget.bodyLarge('이용약관', MaeumgagymColor.black),
                  Image.asset('assets/image/core_icon/close_icon.png',
                      width: 12, height: 12)
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
