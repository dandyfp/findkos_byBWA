import 'package:cozy1/model/city.dart';
import 'package:cozy1/model/space.dart';
import 'package:cozy1/model/tips.dart';
import 'package:cozy1/theme.dart';
import 'package:cozy1/widgets/bottom_navbar_item.dart';
import 'package:cozy1/widgets/city_card.dart';
import 'package:cozy1/widgets/space_card.dart';
import 'package:cozy1/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/space_provider.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            //NOTE : TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Explor Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE :POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'asset/city1.png',
                      isPopuler: false,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'asset/city2.png',
                      isPopuler: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'asset/city3.png',
                      isPopuler: false,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE : RECOMENDED SPACES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recomended Space',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;

                    return Column(
                      children: data.map((item) => SpaceCard(item)).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(children: [
                TipsCard(
                  Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'asset/icon_bantuan1.png',
                      updatedAt: '20 Apr'),
                ),
                SizedBox(
                  height: 20,
                ),
                TipsCard(
                  Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'asset/icon_bantuan2.png',
                      updatedAt: '11 Dec'),
                ),
              ]),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6f7d8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'asset/iconhome.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'asset/iconemail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'asset/iconcard.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'asset/iconlove.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
