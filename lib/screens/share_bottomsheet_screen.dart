import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({this.controller, super.key});
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Color.fromRGBO(255, 255, 255, 0.09),
          child: _getBottomSheetGridView(),
        ),
      ),
    );
  }

  Widget _getBottomSheetGridView() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    height: 5,
                    width: 67,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: 'GB',
                          fontSize: 20,
                        ),
                      ),
                      Image.asset('assets/images/icon_share_bottomsheet.png')
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 0.40),
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                ((context, index) {
                  return _getItemGrid();
                }),
                childCount: 100,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 110,
                crossAxisSpacing: 20.0,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 70))
          ],
        ),
        Positioned(
          bottom: 47.0,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44, vertical: 15),
              child: Text('Send'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.asset('assets/images/profile.png')),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'aghigh',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontFamily: 'GB',
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
