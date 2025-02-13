import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:logistics_dashboard/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'pie_chart_model.dart';

class PieChart extends StackedView<PieChartModel> {
  const PieChart({super.key});

  @override
  Widget builder(
    BuildContext context,
    PieChartModel viewModel,
    Widget? child,
  ) {
    return Card(
      child: SizedBox(
        width: screenWidth(context) * 0.38,
        height: screenHeight(context) / 3,
        child: Column(
          children: [
            const Row(
              children: [
                Text('Order by delivery status'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: screenWidth(context) / 4,
                      height: screenHeight(context) / 4,
                      child: charts.PieChart<String>(
                        _createSampleData(), // Explicitly define <String>
                        animate: true,
                        defaultRenderer: charts.ArcRendererConfig<String>(
                          // Explicit <String> type
                          arcWidth: 15,
                          arcRendererDecorators: [
                            charts.ArcLabelDecorator(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: screenWidth(context) / 4,
                        height: screenHeight(context) / 4,
                        child: Center(
                            child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: "1,983\n",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: 'Total Orders',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10))
                              ]),
                        )))
                  ],
                ),
                SizedBox(
                  width: screenWidth(context) / 12,
                  height: screenHeight(context) / 4,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text('Delivered'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('In progress'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Not delivered'),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.blueGrey,
                        width: 29,
                        height: 29,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 29,
                        height: 29,
                      ),
                      Container(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        width: 29,
                        height: 29,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  PieChartModel viewModelBuilder(
    BuildContext context,
  ) =>
      PieChartModel();
}

/// Create one series with sample hard coded data.
List<charts.Series<ChartData, String>> _createSampleData() {
  final data = [
    ChartData('Delivered', 52, Colors.blueGrey),
    ChartData('In progress', 24, Colors.grey),
    ChartData('Not delivered', 22, const Color.fromARGB(255, 207, 207, 207)),
  ];

  return [
    charts.Series<ChartData, String>(
      id: 'Community Data',
      domainFn: (ChartData data, _) => data.category, // X-axis (category names)
      measureFn: (ChartData data, _) => data.value, // Y-axis (values)
      colorFn: (ChartData data, _) =>
          charts.ColorUtil.fromDartColor(data.color), // Assigns colors
      data: data,
      labelAccessorFn: (ChartData data, _) => '${data.value}%', // Labels
    ),
  ];
}

/// Data model for pie chart
class ChartData {
  final String category;
  final int value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}
