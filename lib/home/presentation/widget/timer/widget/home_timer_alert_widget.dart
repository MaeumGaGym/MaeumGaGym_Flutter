import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_state_provider.dart';

class HomeTimerAlertWidget extends ConsumerStatefulWidget {
  final OverlayState overlayState;
  final Set<int> finishedTimers;

  const HomeTimerAlertWidget({
    super.key,
    required this.overlayState,
    required this.finishedTimers,
  });

  @override
  ConsumerState<HomeTimerAlertWidget> createState() =>
      _HomeTimerAlertWidgetState();
}

class _HomeTimerAlertWidgetState extends ConsumerState<HomeTimerAlertWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  Duration time = const Duration(seconds: 0);
  late StreamSubscription<int> stream;

  @override
  void initState() {
    super.initState();
    stream = Stream.periodic(
      const Duration(seconds: 1),
      (x) => x,
    ).listen((event) {
      time = Duration(seconds: event + 1);
      setState(() {});
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation =
        Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    stream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final timersNotifier = ref.read(homeTimersProvider.notifier);
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: SlideTransition(
            position: _animation,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Material(
                color: MaeumgagymColor.white,
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageWidget(
                          image: Images.timeTimer,
                          imageWidth: 16,
                          imageHeight: 16,
                          color: MaeumgagymColor.blue500,
                        ),
                        const SizedBox(width: 4),
                        PtdTextWidget.bodySmall("타이머", MaeumgagymColor.blue500)
                      ],
                    ),
                    const SizedBox(height: 2, width: 2),
                    PtdTextWidget.bodyMedium(
                        "타이머 ${finishedTimers.length <= 1 ? "" : "${finishedTimers.length}개"}종료",
                        // "타이머 종료",
                        MaeumgagymColor.black),
                    PtdTextWidget.metronomeBeat(
                        "-${time.inHours.toString().padLeft(2, "0")}"
                        ":${(time.inMinutes - (time.inHours * 60)).toString().padLeft(2, "0")}"
                        ":${(time.inSeconds - (time.inMinutes * 60)).toString().padLeft(2, "0")}",
                        MaeumgagymColor.black),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            timersNotifier.removeTimerOverlay();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 46,
                            height: 20,
                            child: PtdTextWidget.titleSmall(
                              "해제",
                              MaeumgagymColor.blue500,
                            ),
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            timersNotifier.onStartedUseSet(
                              widget.finishedTimers,
                              widget.overlayState,
                            );

                            timersNotifier.removeTimerOverlay();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: MediaQuery.of(context).size.width / 2 - 46,
                            child: PtdTextWidget.titleSmall(
                              "다시 시작",
                              MaeumgagymColor.blue500,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
