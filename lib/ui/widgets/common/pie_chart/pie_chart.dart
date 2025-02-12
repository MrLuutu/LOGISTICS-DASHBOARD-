import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pie_chart_model.dart';

class PieChart extends StackedView<PieChartModel> {
  // final List<charts.Series> seriesList;
  final bool animate;
  const PieChart(this.animate, {super.key});

  @override
  Widget builder(
    BuildContext context,
    PieChartModel viewModel,
    Widget? child,
  ) {
    return charts.PieChart(createSampleData(),
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: charts.ArcRendererConfig(arcWidth: 60));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> createSampleData() {
    final data = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  PieChartModel viewModelBuilder(
    BuildContext context,
  ) =>
      PieChartModel();
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
