import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

import '../../../utils/color_manager.dart';

class DynamicDayView extends StatefulWidget {
  const DynamicDayView({super.key});

  @override
  State<StatefulWidget> createState() => DynamicDayViewState();
}

/// The dynamic day view state.
class DynamicDayViewState extends State<DynamicDayView> {
  /// The added events.
  List<FlutterWeekViewEvent> events = [];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return SizedBox(
      height: 300,
      child: DayView(
        date: now,
        style: const DayViewStyle(
          backgroundColor: ColorManager.backg,
        ),
        events: events,
        onBackgroundTappedDown: (DateTime dateTime) {
          dateTime = roundTimeToFitGrid(dateTime);
          events.add(FlutterWeekViewEvent(
            title: 'New event',
            description: 'A new event',
            start: dateTime,
            end: dateTime.add(const Duration(hours: 1)),
          ));
        },
        dragAndDropOptions: DragAndDropOptions(
          onEventDragged: (FlutterWeekViewEvent event, DateTime newStartTime) {
            DateTime roundedTime = roundTimeToFitGrid(newStartTime, gridGranularity: const Duration(minutes: 15));
            event.shiftEventTo(roundedTime);
          },
        ),
        resizeEventOptions: ResizeEventOptions(
          onEventResized: (FlutterWeekViewEvent event, DateTime newEndTime) {
            event.end = newEndTime;
            /* State set is the resized event's time. */
          },
        ),
      ),
    );
  }
}
