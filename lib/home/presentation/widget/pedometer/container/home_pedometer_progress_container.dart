import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePedometerProgressContainer extends StatefulWidget {
  const HomePedometerProgressContainer({super.key});

  @override
  State<HomePedometerProgressContainer> createState() => _HomePedometerProgressContainerState();
}

class _HomePedometerProgressContainerState extends State<HomePedometerProgressContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: SizedBox(
          height: MediaQuery.of(context).size.width - 65,
          width: MediaQuery.of(context).size.width - 65,
          child: Stack(
            children: [
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                      thickness: 16,
                      cornerStyle: CornerStyle.bothCurve,
                      color: MaeumgagymColor.gray100,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: 80,
                        color: MaeumgagymColor.blue400,
                        cornerStyle: CornerStyle.bothCurve,
                        width: 16,
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        angle: 90,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PtdTextWidget.bodyLarge(
                              "오늘 걸음수",
                              MaeumgagymColor.gray600,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70),
                              child: FittedBox(
                                child: PtdTextWidget
                                    .onTimerAndMetronomeTitle(
                                  "20,195",
                                  MaeumgagymColor.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 25,
                right: 0,
                child: PtdTextWidget.bodySmall(
                  "20,195",
                  MaeumgagymColor.gray100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
