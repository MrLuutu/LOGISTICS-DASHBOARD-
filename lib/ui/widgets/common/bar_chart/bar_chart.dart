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
        child: charts.BarChart(
          _createSampleData(),
          animate: true,

          /// Assign a custom style for the measure axis.
          ///
          /// The NoneRenderSpec only draws an axis line (and even that can be hidden
          /// with showAxisLine=false).

          primaryMeasureAxis:
              const charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),

          /// This is an OrdinalAxisSpec to match up with BarChart's default
          /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
          /// other charts).
          domainAxis: const charts.OrdinalAxisSpec(
              // Make sure that we draw the domain axis line.
              showAxisLine: true,
              // But don't draw anything else.
              renderSpec: charts.NoneRenderSpec()),

          // With a spark chart we likely don't want large chart margins.
          // 1px is the smallest we can make each margin.
          layoutConfig: charts.LayoutConfig(
              leftMarginSpec: charts.MarginSpec.fixedPixel(0),
              topMarginSpec: charts.MarginSpec.fixedPixel(0),
              rightMarginSpec: charts.MarginSpec.fixedPixel(0),
              bottomMarginSpec: charts.MarginSpec.fixedPixel(0)),
        ),
      ),
    );
  }

  /// Create series list with single series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
      OrdinalSales('Jan', 3100),
      OrdinalSales('Feb', 3500),
      OrdinalSales('Mar', 5000),
      OrdinalSales('Apr', 2500),
      OrdinalSales('May', 3200),
      OrdinalSales('June', 4500),
      OrdinalSales('July', 4400),
      OrdinalSales('Aug', 5000),
      OrdinalSales('Sep', 5000),
      OrdinalSales('Oct', 4500),
      OrdinalSales('Nov', 4300),
      OrdinalSales('Dec', 4600),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
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
