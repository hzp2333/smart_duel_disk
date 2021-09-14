import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

import 'models/home_tab.dart';
import 'usecases/get_home_tabs_use_case.dart';

@Injectable()
class HomeViewModel extends BaseViewModel {
  static const _tag = 'HomeViewModel';

  final AppRouter _router;
  final GetHomeTabsUseCase _getHomeTabsUseCase;

  final _homeTabs = BehaviorSubject<Iterable<HomeTab>>();
  Stream<Iterable<HomeTab>> get homeTabs => _homeTabs.stream;

  HomeViewModel(
    this._router,
    this._getHomeTabsUseCase,
    Logger logger,
  ) : super(logger);

  void init() {
    logger.info(_tag, 'init()');

    final tabs = _getHomeTabsUseCase();
    _homeTabs.add(tabs);
  }

  Future<void> onShowUserSettingsPressed() async {
    logger.info(_tag, 'onShowUserSettingsPressed');

    await _router.showUserSettings();
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _homeTabs.close();

    super.dispose();
  }
}
