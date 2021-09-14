import 'package:injectable/injectable.dart';

import '../models/home_tab.dart';

@LazySingleton()
class GetHomeTabsUseCase {
  static const _homeTabs = [
    NewsHomeTab(),
    DeckHomeTab(),
    DuelHomeTab(),
  ];

  Iterable<HomeTab> call() {
    return _homeTabs;
  }
}
