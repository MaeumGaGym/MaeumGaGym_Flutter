import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/maeumgagym_color.dart';
import '../../../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../../../providers/home_quotes_provider.dart';

class HomeMainQuotesContainer extends ConsumerWidget {
  const HomeMainQuotesContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) => ref.watch(homeQuotesController).statusCode.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PtdTextWidget.titleMedium(
                  ref.watch(homeQuotesController).message.toString(),
                  MaeumgagymColor.blue500,
                ),
                const SizedBox(height: 8),
                PtdTextWidget.labelMedium(
                  ref.watch(homeQuotesController).author.toString(),
                  MaeumgagymColor.gray500,
                ),
              ],
            ),
          );
        },
        error: (err, _) {
          return const SizedBox();
        },
        loading: () {
          return const SizedBox();
        },
      ),
    );
  }
}
