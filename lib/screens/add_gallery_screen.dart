import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';

class AddGalleryScreen extends StatelessWidget {
  const AddGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _getHeaderSection()),
                SliverToBoxAdapter(child: _getSelectedImageContainer()),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
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
                    }, childCount: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 83))
              ],
            ),
            Container(
              width: double.infinity,
              height: 83,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: blackColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Draft',
                      style: TextStyle(
                        color: pinkColor,
                        fontFamily: 'GB',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: 'GB',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: 'GB',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      height: 395,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('assets/images/item7.png'),
        ),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: 18),
      child: Row(
        children: [
          Text(
            'Post',
            style:
                TextStyle(color: whiteColor, fontFamily: 'GB', fontSize: 24.0),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('assets/images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style:
                TextStyle(color: whiteColor, fontSize: 16.0, fontFamily: 'GB'),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset('assets/images/icon_arrow_right_box.png')
        ],
      ),
    );
  }
}
