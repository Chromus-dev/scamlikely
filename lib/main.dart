import 'package:flutter/cupertino.dart';

// pages
import 'package:scamlikely/pages/link_checker.dart';
import 'package:scamlikely/pages/account.dart';
import 'package:scamlikely/pages/history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'ScamLikely',
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}

// TODO: make bottom bar like this: https://github.com/BilalShahid13/PersistentBottomNavBar/tree/master
// style 6

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CupertinoTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController(initialIndex: 1); // Set default tab to index 1

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        controller: _tabController,

        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
            icon: HistoryPage.icon,
            label: HistoryPage.title,
          ),
          BottomNavigationBarItem(
            icon: LinkCheckerPage.icon,
            label: LinkCheckerPage.title,
          ),
          BottomNavigationBarItem(
            icon: AccountPage.icon,
            label: AccountPage.title,
          ),
        ]),
        
        tabBuilder: (context, index) {
          assert(index <= 2 && index >= 0, 'Unexpected tab index $index');

          return switch (index) {
            0 => CupertinoTabView(
                defaultTitle: HistoryPage.title,
                builder: (context) => const HistoryPage(),
              ),
            1 => CupertinoTabView(
                defaultTitle: LinkCheckerPage.title,
                builder: (context) => const LinkCheckerPage(),
              ),
            2 => CupertinoTabView(
                defaultTitle: AccountPage.title,
                builder: (context) => const AccountPage(),
              ),
            _ => const SizedBox.shrink()
          };
        });
  }
}
