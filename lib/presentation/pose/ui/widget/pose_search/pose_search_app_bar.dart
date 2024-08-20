import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_search/pose_search_state_cubit.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class PoseSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  const PoseSearchAppBar({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(
                  image: Images.chevronLeft,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 1.sw - 76.w,
                decoration: BoxDecoration(
                  color: MaeumColor.gray50,
                  borderRadius: BorderRadius.circular(8.r),
                ),

                /// TextField
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 8.w),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (!searchFocusNode.hasFocus) {
                            searchFocusNode.requestFocus();
                          }
                        },
                        child: ImageWidget(
                          width: 24.w,
                          imageWidth: 24.w,
                          image: Images.iconsSearch,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.sw - 164.w,
                      child: TextField(
                        focusNode: searchFocusNode,
                        controller: searchController,
                        onChanged: (value) => context.read<PoseSearchStateCubit>().changeState(value),
                        cursorWidth: 1.w,
                        cursorHeight: 20.h,
                        style: TextStyle(
                          height: 20.h / 16.sp,
                          fontFamily: pretendard,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          overflow: TextOverflow.visible,
                        ),
                        cursorColor: MaeumColor.blue500,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: '자세 검색',
                          hintStyle: TextStyle(
                            fontFamily: pretendard,
                            height: 20.h / 16.sp,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: MaeumColor.gray300,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 12.w),
                      child: Builder(
                        builder: (_) {
                          if (searchFocusNode.hasFocus) {
                            return GestureDetector(
                              onTap: () => searchController.clear(),
                              child: ImageWidget(
                                image: Images.editClose,
                                width: 24.w,
                                height: 24.h,
                              ),
                            );
                          } else {
                            return SizedBox(
                              width: 24.w,
                              height: 24.h,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}
