import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import '../../../providers/home_timer_add_duration_provider.dart';

enum TimerType { hour, minute, seconds }

class HomeTimerCupertinoPickerWidget extends ConsumerStatefulWidget {
  final int listLength;
  final TimerType type;

  const HomeTimerCupertinoPickerWidget({
    super.key,
    required this.listLength,
    required this.type,
  });

  @override
  ConsumerState<HomeTimerCupertinoPickerWidget> createState() =>
      _HomeTimerCupertinoPickerWidgetState();
}

class _HomeTimerCupertinoPickerWidgetState
    extends ConsumerState<HomeTimerCupertinoPickerWidget> {
  @override
  Widget build(BuildContext context) {
    final durationNotifier = ref.read(homeTimerAddDurationProvider.notifier);
    final durationState = ref.read(homeTimerAddDurationProvider);
    return SizedBox(
      width: 85,
      height: 330,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: PtdTextWidget.labelMedium(
              formatPickerTitle(widget.type),
              MaeumgagymColor.gray500,
            ),
          ),
          SizedBox(
            width: 77,
            height: 225,
            child: DefaultTextStyle(
              style: CupertinoTheme.of(context).textTheme.pickerTextStyle,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 100,
                physics: const FixedExtentScrollPhysics(),
                squeeze: 1.2,
                onSelectedItemChanged: (value) {
                  switch (widget.type) {
                    case TimerType.hour:
                      durationNotifier.hourNotifier(value);
                      break;
                    case TimerType.minute:
                      durationNotifier.minuteNotifier(value);
                      break;
                    case TimerType.seconds:
                      durationNotifier.secondsNotifier(value);
                      break;
                  }
                  setState(() {});
                },
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List.generate(widget.listLength, (index) {
                    switch (widget.type) {
                      case TimerType.hour:
                        return PtdTextWidget.timerPickerNumber(
                          formatPickerNumber(index),
                          durationState.hour == index
                              ? MaeumgagymColor.black
                              : MaeumgagymColor.gray100,
                        );

                      case TimerType.minute:
                        return PtdTextWidget.timerPickerNumber(
                          formatPickerNumber(index),
                          durationState.minute == index
                              ? MaeumgagymColor.black
                              : MaeumgagymColor.gray100,
                        );
                      case TimerType.seconds:
                        return PtdTextWidget.timerPickerNumber(
                          formatPickerNumber(index),
                          durationState.seconds == index
                              ? MaeumgagymColor.black
                              : MaeumgagymColor.gray100,
                        );
                    }
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
