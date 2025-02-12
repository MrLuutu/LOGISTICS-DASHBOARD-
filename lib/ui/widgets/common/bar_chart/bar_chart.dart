import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bar_chart_model.dart';

class BarChart extends StackedView<BarChartModel> {
  const BarChart({super.key});

  @override
  Widget builder(
    BuildContext context,
    BarChartModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  BarChartModel viewModelBuilder(
    BuildContext context,
  ) =>
      BarChartModel();
}
