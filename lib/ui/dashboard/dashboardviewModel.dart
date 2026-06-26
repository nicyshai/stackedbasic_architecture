 import 'package:stacked/stacked.dart';

class Dashboardviewmodel extends BaseViewModel {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void init() {
    fetch();
  }

  void fetch() {
    setBusy(true);

    setBusy(false);
  }
}