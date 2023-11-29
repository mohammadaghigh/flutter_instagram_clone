import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List menuList = [
      'All',
      'Account',
      'Hashtag',
      'Caption',
      'Story',
      'Comment'
    ];
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _getSearchBox(),
          ),
          SliverToBoxAdapter(
            child: _getSearchScreenItemList(menuList),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 17),
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _getSearchBox() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 12),
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              color: Color(0xff272B40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    child: Image.asset('assets/images/icon_search.png'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: whiteColor),
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: whiteColor),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  Image.asset('assets/images/icon_scan.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSearchScreenItemList(List menuList) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 23,
      child: ListView.builder(
          itemCount: menuList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 3),
              decoration: BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  menuList[index],
                  style: TextStyle(
                      color: whiteColor, fontSize: 12, fontFamily: 'GM'),
                ),
              )),
            );
          }),
    );
  }
}
