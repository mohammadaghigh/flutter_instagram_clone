import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 80,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 18, top: 18),
                    child: Icon(Icons.menu),
                  ),
                ],
                backgroundColor: blackColor,
                bottom: PreferredSize(
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                  ),
                  preferredSize: Size.fromHeight(10),
                ),
                expandedHeight: 170,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/item1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 17, top: 10, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'برنامه نویس فلاتر',
                          style: TextStyle(
                            color: whiteColor,
                            fontFamily: 'SM',
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          ':آموزش رایگان',
                          style: TextStyle(
                            color: whiteColor,
                            fontFamily: 'SM',
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.link,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'yek.link/Mohammadaghigh',
                              style: TextStyle(
                                color: blueColor,
                                fontSize: 12,
                                fontFamily: 'GB',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.computer,
                              color: greyColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Developer',
                              style: TextStyle(
                                color: greyColor,
                                fontFamily: 'SM',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.location_city,
                              color: greyColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Iran',
                              style: TextStyle(
                                color: greyColor,
                                fontFamily: 'SM',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '23',
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'GB',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(
                                color: greyColor,
                                fontFamily: 'SM',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '16.2K',
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'GB',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(
                                color: greyColor,
                                fontFamily: 'SM',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '280',
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'GB',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                color: greyColor,
                                fontFamily: 'SM',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(187, 46),
                              side: BorderSide(
                                color: whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              'Message',
                              style: TextStyle(
                                color: greyColor,
                                fontFamily: 'GB',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: TabBarVieWDelegate(
                  TabBar(
                    indicatorPadding: EdgeInsets.only(bottom: 6),
                    indicatorWeight: 2,
                    indicatorColor: pinkColor,
                    tabs: [
                      Tab(
                        icon: Image.asset('assets/images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon:
                            Image.asset('assets/images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          }),
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, right: 18, left: 18),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  'assets/images/item${index}.png',
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, right: 18, left: 18),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  'assets/images/item${index}.png',
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: pinkColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/images/profile.png')),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'محمد عقیق برنامه نویس موبایل',
                    style: TextStyle(
                        fontFamily: 'SM', fontSize: 12, color: whiteColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Mohammadaghigh',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12, color: greyColor),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_profile_edit.png'),
        ],
      ),
    );
  }
}

class TabBarVieWDelegate extends SliverPersistentHeaderDelegate {
  TabBarVieWDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: blackColor,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
