import 'package:ant_icons/ant_icons.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_home/feature_home_impl/lib/src/home/models/home_tab.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';
import 'package:smart_duel_disk/src/navigation/router.gr.dart';

class HomeScreen extends StatelessWidget {
  static final _tabs = List<HomeTab>.unmodifiable(<HomeTab>[
    HomeTab(title: Strings.homeTabNews.get(), icon: Icons.wysiwyg_outlined, page: const NewsTab()),
    HomeTab(title: Strings.homeTabDeck.get(), icon: AntIcons.wallet_outline, page: const DeckTab()),
    HomeTab(title: Strings.homeTabDuel.get(), icon: AntIcons.trophy_outline, page: const DuelTab()),
  ]);

  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: _tabs.map((tab) => tab.page).toList(),
      builder: (context, child, animation) {
        final tabsRouter = context.tabsRouter;

        return Scaffold(
          appBar: const _AppBar(),
          backgroundColor: AppColors.backgroundColor,
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: _BottomNavigationBar(
            tabs: _tabs,
            tabsRouter: tabsRouter,
          ),
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BottomNavigationBar extends StatelessWidget {
  final List<HomeTab> tabs;
  final TabsRouter tabsRouter;

  const _BottomNavigationBar({
    @required this.tabs,
    @required this.tabsRouter,
  });

  Color _getTabColor(int index) {
    return index == tabsRouter.activeIndex ? AppColors.tabSelectedColor : AppColors.tabUnselectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: AppColors.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs
            .asMap()
            .map((index, tab) => MapEntry(
                  index,
                  Expanded(
                    child: _BottomNavigationBarItem(
                      text: tab.title,
                      icon: tab.icon,
                      color: _getTabColor(index),
                      onPressed: () => tabsRouter.setActiveIndex(index),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}

class _BottomNavigationBarItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _BottomNavigationBarItem({
    @required this.text,
    @required this.icon,
    @required this.color,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.tabBarItemHeight,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: AppColors.tabSplashColor,
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: AppDimensions.tabBarIconSize,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
