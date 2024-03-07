import 'package:stacked/stacked.dart';
import 'package:conversor_de_moedas/app/app.locator.dart';
import 'package:conversor_de_moedas/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));



    _navigationService.replaceWithHomeView();
  }
}
