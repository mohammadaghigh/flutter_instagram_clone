import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:ui';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        elevation: 0,
        title: Container(
          width: 128,
          height: 16,
          child: Image.asset('assets/images/moodinger_logo.png'),
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            child: Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(right: 18.0),
              child: Image.asset('assets/images/icon_direct.png'),
            ),
          )
        ],
      ),
      backgroundColor: blackColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverToBoxAdapter(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showModalBottomSheet(
            //           barrierColor: Colors.transparent,
            //           backgroundColor: Colors.transparent,
            //           context: context,
            //           isScrollControlled: true,
            //           builder: (BuildContext context) {
            //             return Padding(
            //               padding: EdgeInsets.only(
            //                   bottom: MediaQuery.of(context).viewInsets.bottom),
            //               child: DraggableScrollableSheet(
            //                   minChildSize: 0.2,
            //                   initialChildSize: 0.4,
            //                   maxChildSize: 0.7,
            //                   builder: (context, controller) {
            //                     return ShareBottomSheet(
            //                       controller: controller,
            //                     );
            //                   }),
            //             );
            //           });
            //     },
            //     child: Text('open modal sheet'),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: _getStoryContent(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          _getPostHeader(index),
                          _getPostContent(index),
                        ],
                      ),
                  childCount: 8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStoryContent() {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return index == 0 ? _getAddStoryBox() : _getStoryListBox(index);
          }),
    );
  }

  Widget _getPostContent(int index) {
    List<double> postLikes = [2.6, 1.6, 7.3, 1.5, 50, 150, 2.8, 3.1];
    List<int> postComments = [260, 160, 1300, 800, 1, 5, 1080, 7586];
    return Container(
      width: 394,
      height: 440,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset('assets/images/post_cover$index.png'),
            ),
          ),
          Positioned(
            top: 75,
            right: 30,
            child: GestureDetector(
              child: Container(
                width: 20,
                height: 20,
                child: Image.asset('assets/images/icon_video.png'),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY: 20.0,
                ),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(255, 255, 255, 0.5),
                      Color.fromRGBO(255, 255, 255, 0.2),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/icon_heart.png'),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            '${postLikes[index]}K',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 14,
                                fontFamily: 'GB'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_comments.png'),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            '${postComments[index]}K',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 14,
                                fontFamily: 'GB'),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/icon_share.png'),
                      Image.asset('assets/images/icon_save.png')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostHeader(int index) {
    List postTitleList = [
      'deutschliebende',
      'deutschliebende',
      'SportFit',
      'SportFit',
      'deutschliebende',
      'SportFit',
      'deutschliebende',
      'SportFit',
    ];
    List postSubTitleList = [
      'بزرگترین مرکز یادگیری زبان آلمانی',
      'بزرگترین مرکز یادگیری زبان آلمانی',
      'با ما سالم باش',
      'عادت های نابهنجار',
      'بزرگترین مرکز یادگیری زبان آلمانی',
      'بیا تا کامروا شوی',
      'بزرگترین مرکز یادگیری زبان آلمانی',
      'بهترین تصمیم زندگیت',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postTitleList[index],
                  style: TextStyle(
                      fontFamily: 'GB', fontSize: 12.0, color: whiteColor),
                ),
                Text(
                  postSubTitleList[index],
                  style: TextStyle(fontFamily: 'SM', color: whiteColor),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(4),
      dashPattern: [30, 0],
      strokeWidth: 2,
      color: pinkColor,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          width: 40,
          height: 40,
          child: Image.asset('assets/images/profile.png'),
        ),
      ),
    );
  }

  Widget _getStoryListBox(int index) {
    List<String> storyAccountLabel = [
      'hossein...',
      '_jeneral...',
      'kianazat...',
      'deutschli...',
      'amirahmad...',
      'hamid_gll...',
      'sajadi6979..',
      'ramin.zone...',
      'shahab_kha...',
      'ali.dev.ger...',
    ];

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(4),
              dashPattern: [30, 0],
              strokeWidth: 2,
              color: pinkColor,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  width: 58,
                  height: 58,
                  child: Column(
                    children: [
                      Image.asset('assets/images/profile${index}.jpg'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              storyAccountLabel[index],
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(17)),
            ),
            width: 64,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Image.asset('assets/images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Your Story', style: TextStyle(color: whiteColor))
        ],
      ),
    );
  }
}
