import 'package:stacked/stacked.dart';
import 'package:logistics_dashboard/app/app.locator.dart';
import 'package:logistics_dashboard/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithHomeView();
  }
}
