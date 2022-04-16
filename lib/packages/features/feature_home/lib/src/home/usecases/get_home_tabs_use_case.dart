import 'package:injectable/injectable.dart';

import '../models/home_tab.dart';

@LazySingleton()
class GetHomeTabsUseCase {
  static final _homeTabs = [
    const NewsHomeTab(),
    DeckHomeTab(),
    const DuelHomeTab(),
  ];

  Iterable<HomeTab> call() {
    return _homeTabs;
  }
}
