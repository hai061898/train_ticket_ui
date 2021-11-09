import 'package:get/get.dart';
import 'package:trainticket/app/modules/pilih_tiket/pilih_tiket_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static final routes = [
    GetPage(
      name: _Paths.PILIH_TIKET,
      page: () =>const PilihTiketView(),
      // binding: PilihTiketBinding(),
    ),
  ];
}
