import 'package:facebook_task_solution/core/app_assets.dart';
import 'package:facebook_task_solution/core/app_theme.dart';
import 'package:facebook_task_solution/widgets/home/app_bar_icon.dart';
import 'package:facebook_task_solution/widgets/home/custom_tab_icon.dart';
import 'package:facebook_task_solution/widgets/home/post_item.dart';
import 'package:facebook_task_solution/widgets/home/stories_section.dart';
import 'package:facebook_task_solution/widgets/home/create_post_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*
    No TabController for TabBar.
    When creating a TabBar, you must either provide an explicit TabController using the "controller" property,
    or you must ensure that there is a DefaultTabController above the TabBar.
     */
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Facebook",
              style: TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            actions: const [
              AppBarIcon(iconPath: AppAssets.addIcon),
              AppBarIcon(iconPath: AppAssets.searchIcon),
              AppBarIcon(iconPath: AppAssets.messengerIcon),
            ],
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppTheme.primary,
              dividerHeight: 1,
              labelColor: AppTheme.primary,
              tabs: [
                Tab(
                  icon: CustomImageIcon(imageIcon: AppAssets.homeIcon),
                ),
                Tab(
                  icon: CustomImageIcon(imageIcon: AppAssets.videoIcon),
                ),
                Tab(
                  icon: CustomImageIcon(imageIcon: AppAssets.accountIcon),
                ),
                Tab(
                  icon: CustomImageIcon(imageIcon: AppAssets.storeIcon),
                ),
                Tab(
                  icon: CustomImageIcon(imageIcon: AppAssets.notificationIcon),
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              // CreatePostSection and Divider
              const CreatePostSection(),
              const Divider(),

              // StoriesSection with a fixed height
              SizedBox(
                height: size.height * 0.22,
                child: const StoriesSection(),
              ),

              // Divider
              const Divider(),

              // List of Posts
              ...List.generate(10,
                  (index) => const PostItem()), // Generates 10 PostItem widgets
            ],
          )

          //   CustomScrollView(
          //   slivers: [
          //     const SliverToBoxAdapter(
          //       child: Column(
          //         children: [
          //           CreatePostSection(),
          //           Divider(),
          //         ],
          //       ),
          //     ),
          //     SliverToBoxAdapter(
          //       child: SizedBox(
          //         height: size.height * 0.22,
          //         child: const StoriesSection(),
          //       ),
          //     ),
          //     const SliverToBoxAdapter(child: Divider()),
          //     SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //         (context, index) => const PostItem(),
          //         childCount: 10,
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
