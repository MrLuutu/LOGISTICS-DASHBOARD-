import 'package:flutter/material.dart';
import 'package:logistics_dashboard/ui/widgets/common/kpi_tile/kpi_tile.dart';
import 'package:logistics_dashboard/ui/widgets/common/pie_chart/pie_chart.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Logistics Dashboard',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: const [
          // DropdownButtonFormField(items: [], onChanged: (value) => {})
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              children: [
                // verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KpiTile(
                      indicatorTitle: 'Sales',
                      indicatorValue: '430,000',
                      indicatorStatus: '20%',
                      indicatorYearOverYearComparison: 'From Previous Year',
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Colors.greenAccent,
                      ),
                    ),
                    KpiTile(
                      indicatorTitle: 'Cost',
                      indicatorValue: '730,000',
                      indicatorStatus: '50%',
                      indicatorYearOverYearComparison: 'From Previous Year',
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Colors.greenAccent,
                      ),
                    ),
                    KpiTile(
                      indicatorTitle: 'Net Profit Ratio',
                      indicatorValue: '40%',
                      indicatorStatus: '2.2%',
                      indicatorYearOverYearComparison: 'From Previous Year',
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Colors.greenAccent,
                      ),
                    ),
                    KpiTile(
                      indicatorTitle: 'Shippement',
                      indicatorValue: '530,000',
                      indicatorStatus: '40%',
                      indicatorYearOverYearComparison: 'From Previous Year',
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Colors.greenAccent,
                      ),
                    ),
                    KpiTile(
                      indicatorTitle: 'Avg. Delivery Time',
                      indicatorValue: '530,000',
                      indicatorStatus: '1.1%',
                      indicatorYearOverYearComparison: 'From Previous Year',
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.redAccent,
                      ),
                      color: Colors.redAccent,
                    )
                  ],
                ),
                const Row(
                  children: [
                    PieChart(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
