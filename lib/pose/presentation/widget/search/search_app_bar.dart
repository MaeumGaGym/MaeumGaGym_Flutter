/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Provider
import '../../provider/pose_search_controller.dart';

class SearchAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController textEditingController;
  final PoseSearchControllerStateNotifier textFieldNotifier;

  const SearchAppbar(
      {super.key,
      required this.textFieldNotifier,
      required this.textEditingController});

  @override
  ConsumerState<SearchAppbar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class _SearchAppBarState extends ConsumerState<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    final PoseSearchControllerStateNotifier textFieldNotifier =
        widget.textFieldNotifier;
    TextEditingController textController = widget.textEditingController;

    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        /// AppBar
        title: Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: MaeumgagymColor.gray50,
            borderRadius: BorderRadius.circular(8),
          ),

          /// TextField
          child: TextField(
            controller: textController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onChanged: (value) => textFieldNotifier.saveText(value),
            cursorWidth: 1,
            cursorHeight: 20,
            style: const TextStyle(height: 1.23),
            cursorColor: MaeumgagymColor.blue500,
            decoration: InputDecoration(
              hintText: '자세 검색',
              hintStyle: TextStyle(
                fontFamily: pretendard,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MaeumgagymColor.gray300,
                height: 2.3,
              ),
              contentPadding: const EdgeInsets.only(top: 6),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: SvgPicture.asset(
                  'assets/image/core_icon/search_icon.svg',
                  width: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
