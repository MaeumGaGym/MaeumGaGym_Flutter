/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Provider
import '../../provider/pose_search_provider.dart';

class PoseSearchAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController textEditingController;

  const PoseSearchAppbar({super.key, required this.textEditingController});

  @override
  ConsumerState<PoseSearchAppbar> createState() => _PoseSearchAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class _PoseSearchAppbarState extends ConsumerState<PoseSearchAppbar> {
  @override
  Widget build(BuildContext context) {
    final poseSearchNotifier = ref.read(poseSearchController.notifier);
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
            onChanged: (value) => poseSearchNotifier.state = value,
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
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 12, right: 8),
                child: ImageWidget(
                  width: 24,
                  imageWidth: 24,
                  image: 'assets/image/core_icon/search_icon.svg',
                  imageType: ImageType.svg,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
