import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider =
    StateNotifierProvider<PageControllerNotifier, PageController>((ref) {
  return PageControllerNotifier();
});

class PageControllerNotifier extends StateNotifier<PageController> {
  PageControllerNotifier() : super(PageController(index: 0));

  void setPage(int value) {
    state = PageController(index: value);
    print(state.index);
  }
}

class PageController {
  final int index;

  PageController({required this.index});
}
