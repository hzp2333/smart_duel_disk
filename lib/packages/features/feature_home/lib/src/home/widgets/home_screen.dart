import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../home_viewmodel.dart';
import '../models/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<HomeViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    return StreamBuilder<Iterable<HomeTab>>(
      stream: vm.homeTabs,
      builder: (context, snapshot) {
        final tabs = snapshot.data;
        if (tabs == null) {
          return const SizedBox.shrink();
        }

        return AutoTabsRouter(
          routes: tabs.map((tab) => tab.page).toList(),
          builder: (context, child, animation) {
            final tabsRouter = context.tabsRouter;

            return Scaffold(
              appBar: const _AppBar(),
              backgroundColor: AppColors.primaryBackgroundColor,
              body: FadeTransition(
                opacity: animation,
                child: child,
              ),
              bottomNavigationBar: _BottomNavigationBar(
                tabs: tabs,
                tabsRouter: tabsRouter,
              ),
            );
          },
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryBackgroundColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: vm.onShowUserSettingsPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BottomNavigationBar extends StatelessWidget {
  final Iterable<HomeTab> tabs;
  final TabsRouter tabsRouter;

  const _BottomNavigationBar({
    required this.tabs,
    required this.tabsRouter,
  });

  Color _getTabColor(int index) {
    return index == tabsRouter.activeIndex ? AppColors.tabSelectedColor : AppColors.tabUnselectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: AppColors.primaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs
            .toList()
            .asMap()
            .map(
              (index, tab) => MapEntry(
                index,
                Expanded(
                  child: _BottomNavigationBarItem(
                    titleId: tab.titleId,
                    icon: tab.icon,
                    color: _getTabColor(index),
                    onPressed: () => tabsRouter.setActiveIndex(index),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}

class _BottomNavigationBarItem extends StatelessWidget with ProviderMixin {
  final String titleId;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _BottomNavigationBarItem({
    required this.titleId,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return SizedBox(
      height: AppSizes.tabBarItemHeight,
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
              size: AppSizes.tabBarIconSize,
              color: color,
            ),
            Text(
              stringProvider.getString(titleId),
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
