/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Provider
import '../../provider/pose_search_provider.dart';

class PoseSearchAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController textEditingController;
  final FocusNode textFocusNode;

  const PoseSearchAppbar({
    super.key,
    required this.textEditingController,
    required this.textFocusNode,
  });

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

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,

      /// AppBar
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: ImageWidget(
                image: "assets/image/core_icon/left_arrow_ios_icon.png",
                imageType: ImageType.png,
                width: 24,
                height: 24,
                imageWidth: 7,
                imageHeight: 14,
                color: MaeumgagymColor.black,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 96,
              decoration: BoxDecoration(
                color: MaeumgagymColor.gray50,
                borderRadius: BorderRadius.circular(8),
              ),

              /// TextField
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        if (!widget.textFocusNode.hasFocus) {
                          widget.textFocusNode.requestFocus();
                        }
                      },
                      child: const ImageWidget(
                        width: 24,
                        imageWidth: 24,
                        image: 'assets/image/core_icon/search_icon.svg',
                        imageType: ImageType.svg,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 184,
                    child: TextField(
                      focusNode: widget.textFocusNode,
                      controller: textController,
                      onChanged: (value) => poseSearchNotifier.state = value,
                      cursorWidth: 1,
                      cursorHeight: 20,
                      style: const TextStyle(height: 1.1),
                      cursorColor: MaeumgagymColor.blue500,
                      decoration: InputDecoration(
                        hintText: '자세 검색',
                        hintStyle: TextStyle(
                          fontFamily: pretendard,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MaeumgagymColor.gray300,
                          height: 1,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: widget.textFocusNode.hasFocus
                        ? GestureDetector(
                            onTap: () {
                              poseSearchNotifier.state = "";
                              textController.clear();
                            },
                            child: const ImageWidget(
                              image: "assets/image/core_icon/close_icon.png",
                              imageType: ImageType.png,
                              width: 24,
                              height: 24,
                              imageWidth: 12,
                            ),
                          )
                        : GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (!widget.textFocusNode.hasFocus) {
                                widget.textFocusNode.requestFocus();
                              }
                            },
                            child: const SizedBox(
                              width: 24,
                              height: 24,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
