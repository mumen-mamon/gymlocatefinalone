import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'id': DateTime(2023, 8, 11), 'type': 'Type 1', 'value': 2},
      {'id': DateTime(2023, 8, 14), 'type': 'Type 1', 'value': 4},
      {'id': DateTime(2023, 8, 18), 'type': 'Type 1', 'value': 3},
      {'id': DateTime(2023, 8, 11), 'type': 'Type 2', 'value': 2},
      {'id': DateTime(2023, 8, 14), 'type': 'Type 2', 'value': 4},
      {'id': DateTime(2023, 8, 18), 'type': 'Type 2', 'value': 3},
      {'id': DateTime(2023, 8, 16), 'type': 'Type 3', 'value': 1},
    ];

    final types = {'Type 1': const Color(0xfff39e58), 'Type 2': const Color(0xff707070), 'Type 3': const Color(0xffffc107)};

    final listOfTicks = [
      DateTime(2023, 8, 6),
      DateTime(2023, 8, 7),
      DateTime(2023, 8, 8),
      DateTime(2023, 8, 9),
      DateTime(2023, 8, 10),
      DateTime(2023, 8, 11),
      DateTime(2023, 8, 12),
      DateTime(2023, 8, 13),
      DateTime(2023, 8, 14),
      DateTime(2023, 8, 15),
      DateTime(2023, 8, 16),
      DateTime(2023, 8, 17),
      DateTime(2023, 8, 18),
      DateTime(2023, 8, 19),
      DateTime(2023, 8, 20),
    ];

    return Chart(
      data: data,
      variables: {
        'id': Variable(
          accessor: (Map<dynamic, dynamic> datum) => datum['id'] as DateTime,
          scale: TimeScale(
            formatter: (p0) => p0.day.toString(),
            max: listOfTicks.last,
            min: listOfTicks.first,
            ticks: listOfTicks,
          ),
        ),
        'type': Variable(
          accessor: (Map map) => map['type'] as String,
        ),
        'value': Variable(
          accessor: (Map map) => map['value'] as num,
          scale: LinearScale(min: 0, max: 10),
        ),
      },
      marks: [
        IntervalMark(
          position: Varset('id') * Varset('value') / Varset('type'),
          shape: ShapeEncode(
            value: RectShape(
              labelPosition: 0.5,
            ),
          ),
          color: ColorEncode(
            variable: 'type',
            values: types.values.toList(),
          ),
          label: LabelEncode(
            encoder: (tuple) => tuple['value'] == 0
                ? Label('')
                : Label(
                    tuple['value'].toString(),
                    LabelStyle(
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                  ),
          ),
          size: SizeEncode(value: 24),
          modifiers: [StackModifier()],
        )
      ],
      coord: RectCoord(),
      axes: [
        Defaults.horizontalAxis,
        Defaults.verticalAxis,
      ],
      selections: {
        'tap': PointSelection(
          variable: 'id',
        )
      },
      tooltip: TooltipGuide(multiTuples: true),
      crosshair: CrosshairGuide(),
    );
  }
}
