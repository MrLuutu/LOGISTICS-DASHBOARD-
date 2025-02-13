import 'package:flutter/material.dart';
import 'package:logistics_dashboard/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

import 'bar_chart_model.dart';

class BarChart extends StackedView<BarChartModel> {
  const BarChart({super.key});

  @override
  Widget builder(
    BuildContext context,
    BarChartModel viewModel,
    Widget? child,
  ) {
    return Card(
      child: SizedBox(
        width: screenWidth(context) * 0.57,
        height: screenHeight(context) / 3,
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Order Accuracy',
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth(context) * 0.5,
              height: screenHeight(context) / 4,
              child: charts.BarChart(
                _createSampleData(),
                animate: true,

                /// Assign a custom style for the measure axis.
                ///
                /// The NoneRenderSpec only draws an axis line (and even that can be hidden
                /// with showAxisLine=false).

                primaryMeasureAxis: const charts.NumericAxisSpec(
                    // showAxisLine: true, renderSpec: charts.NoneRenderSpec()
                    ),

                /// This is an OrdinalAxisSpec to match up with BarChart's default
                /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
                /// other charts).
                domainAxis: const charts.OrdinalAxisSpec(
                  // Make sure that we draw the domain axis line.
                  showAxisLine: false,
                  // But don't draw anything else.
                  // renderSpec: charts.NoneRenderSpec()
                ),

                // With a spark chart we likely don't want large chart margins.
                // 1px is the smallest we can make each margin.
                layoutConfig: charts.LayoutConfig(
                    leftMarginSpec: charts.MarginSpec.fixedPixel(0),
                    topMarginSpec: charts.MarginSpec.fixedPixel(0),
                    rightMarginSpec: charts.MarginSpec.fixedPixel(0),
                    bottomMarginSpec: charts.MarginSpec.fixedPixel(0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Create series list with single series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
      OrdinalSales('Jan', 30),
      OrdinalSales('Feb', 40),
      OrdinalSales('Mar', 36),
      OrdinalSales('Apr', 30),
      OrdinalSales('May', 70),
      OrdinalSales('June', 39),
      OrdinalSales('July', 30),
      OrdinalSales('Aug', 70),
      OrdinalSales('Sep', 80),
      OrdinalSales('Oct', 60),
      OrdinalSales('Nov', 80),
      OrdinalSales('Dec', 40),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
        colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
      ),
    ];
  }

  @override
  BarChartModel viewModelBuilder(
    BuildContext context,
  ) =>
      BarChartModel();
}

/// Sample ordinal data type.
class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}
