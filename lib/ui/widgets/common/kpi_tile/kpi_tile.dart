import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kpi_tile_model.dart';

// ignore: must_be_immutable
class KpiTile extends StackedView<KpiTileModel> {
  String indicatorTitle;
  String indicatorValue;
  String indicatorStatus;
  String indicatorYearOverYearComparison;
  Icon icon;
  Color? color;

  KpiTile(
      {super.key,
      required this.indicatorTitle,
      required this.indicatorValue,
      required this.indicatorStatus,
      required this.indicatorYearOverYearComparison,
      required this.icon,
      this.color});

  @override
  Widget builder(
    BuildContext context,
    KpiTileModel viewModel,
    Widget? child,
  ) {
    return Card(
        elevation: 10,
        child: SizedBox(
          width: 250,
          height: 150,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              indicatorTitle,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              indicatorValue,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    icon,
                    Text(indicatorStatus,
                        style: TextStyle(color: color ?? Colors.greenAccent)),
                  ],
                ),
                Text(
                  indicatorYearOverYearComparison,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ]),
        ));
  }

  @override
  KpiTileModel viewModelBuilder(
    BuildContext context,
  ) =>
      KpiTileModel();
}
