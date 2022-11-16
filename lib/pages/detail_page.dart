// ignore_for_file: deprecated_member_use

import 'package:cozy1/model/space.dart';
import 'package:cozy1/pages/error_page.dart';
import 'package:cozy1/theme.dart';
import 'package:cozy1/widgets/facility_item.dart';
import 'package:cozy1/widgets/rating_item.dart';
import 'package:cozy1/widgets/space_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // const DetailPage({Key? key, required this.space}) : super(key: key);
  final Space space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl!,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(children: [
              SizedBox(height: 328),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  color: whitecolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    //NOTE : TITLE
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: edge,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                space.name!,
                                style: blackTextStyle.copyWith(
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: '\$${space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Row(
                              children: [1, 2, 3, 4, 5].map((e) {
                            return Container(
                                margin: EdgeInsets.only(left: 2),
                                child: RatingItem(
                                  index: e,
                                  rating: space.rating,
                                ));
                          }).toList()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //NOTE :MAIN FACILITIES
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Main Facilities',
                        style: regulerTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: edge,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                            name: 'Kitchen',
                            imageUrl: 'asset/icon_kitchen.png',
                            total: space.numberOfKitchens!,
                          ),
                          FacilityItem(
                            name: 'bedroom',
                            imageUrl: 'asset/icon_bedroom.png',
                            total: space.numberOfBedrooms!,
                          ),
                          FacilityItem(
                            name: 'Big Lemari',
                            imageUrl: 'asset/icon_lemari.png',
                            total: space.numberOfCupboards!,
                          ),
                        ],
                      ),
                    ),
                    //NOTE : PHOTO
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Photos',
                        style: regulerTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 88,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos!.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 118,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList()
                          // [
                          //   SizedBox(
                          //     width: edge,
                          //   ),
                          //   Image.asset(
                          //     'asset/photos1.png',
                          //     width: 118,
                          //     height: 88,
                          //     fit: BoxFit.cover,
                          //   ),
                          //   SizedBox(
                          //     width: 18,
                          //   ),
                          //   Image.asset(
                          //     'asset/photos2.png',
                          //     width: 118,
                          //     height: 88,
                          //     fit: BoxFit.cover,
                          //   ),
                          //   SizedBox(
                          //     width: 18,
                          //   ),
                          //   Image.asset(
                          //     'asset/photos3.png',
                          //     width: 118,
                          //     height: 88,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ],
                          ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //NOTE : LOCATION
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Location',
                        style: regulerTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${space.address}\n ${space.city}',
                            style: greyTextStyle,
                          ),
                          InkWell(
                            onTap: () {
                              // launchUrl(
                              //     'https://www.google.co.id/maps/place/UNIVERSITAS+PELITA+BANGSA/@-6.3242406,107.1671057,17z/data=!3m1!4b1!4m5!3m4!1s0x2e699b0c08ad8d01:0x2b18001d1b1371f9!8m2!3d-6.3242459!4d107.1692944?hl=id');
                              launchUrl(space.mapUrl!);
                            },
                            child: Image.asset(
                              'asset/btn_maps.png',
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: edge,
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width - (2 * edge),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Purplecolor)),
                        onPressed: () {
                          launchUrl(space.phone!);
                        },
                        child: Text(
                          'Book Now',
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                        // color: Purplecolor,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(17),
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('asset/btn_back.png', width: 48)),
                  Image.asset(
                    'asset/btn_wishlist.png',
                    width: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
