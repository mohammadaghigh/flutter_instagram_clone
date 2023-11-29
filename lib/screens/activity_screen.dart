import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';
import 'package:flutter_instagram_clone/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: blackColor,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 20.0, fontFamily: 'GB'),
                indicatorColor: pinkColor,
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          'New',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: whiteColor,
                              fontFamily: 'GB'),
                        ),
                      )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRow(ActivityStatus.following);
                          },
                          childCount: 2,
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          'Today',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: whiteColor,
                              fontFamily: 'GB'),
                        ),
                      )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRow(ActivityStatus.likes);
                          },
                          childCount: 4,
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          'This Week',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: whiteColor,
                              fontFamily: 'GB'),
                        ),
                      )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRow(ActivityStatus.followBack);
                          },
                          childCount: 8,
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRow(ActivityStatus.followBack);
                          },
                          childCount: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCustomView() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(color: pinkColor, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/profile.png')),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Mohammadaghigh',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12.0, color: whiteColor),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Started following',
                    style: TextStyle(
                        fontFamily: 'GM', fontSize: 12.0, color: greyColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                        fontFamily: 'GM', fontSize: 12.0, color: whiteColor),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12.0, color: greyColor),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          onPressed: () {},
          child: Text(
            'Follow',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: pinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/item0.png')),
          ),
        );

      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: whiteColor, width: 2),
          ),
          child: Text(
            'Message',
            style: TextStyle(fontFamily: 'GB', fontSize: 12, color: whiteColor),
          ),
        );

      default:
        return ElevatedButton(
          onPressed: () {},
          child: Text(
            'Follow',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: pinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
    }
  }
}
