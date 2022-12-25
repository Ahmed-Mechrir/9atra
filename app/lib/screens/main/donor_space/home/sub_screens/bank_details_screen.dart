import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

import '../../../../../config/colors.dart';
import '../../../../../utils/local_data.dart';
import 'bank_location_screen.dart';

class BanksDetailsScreen extends StatefulWidget {
  const BanksDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BanksDetailsScreen> createState() =>
      _BanksDetailsScreenState();
}

class _BanksDetailsScreenState
    extends State<BanksDetailsScreen> {
  // Declarations
  double rating_value = 3.5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.red_color,
        automaticallyImplyLeading: false,
        toolbarHeight: 60.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: _width * .076,
                      color: AppColors.white_color,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Center de santé',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: _width * .05,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white_color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(
                  seconds: 1,
                ),
                height: _height * 0.02,
                width: _width,
                decoration: const BoxDecoration(
                  color: AppColors.red_color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      300,
                    ),
                    bottomRight: Radius.circular(
                      300,
                    ),
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Positioned(
              top: _height * 0.02,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.topCenter,
                width: _width,
                height: _height * 0.86,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: _width,
                        child: Text(
                          'Centre de sang rural de la ville',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: _width * .055,
                            fontWeight: FontWeight.w700,
                            color: AppColors.red_color,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      SizedBox(
                        width: _width,
                        child: Column(
                          children: <Widget>[
                            CarouselSlider(
                              options: CarouselOptions(
                                aspectRatio: 2,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                initialPage: 1,
                                autoPlay: true,
                                pauseAutoPlayOnTouch: true,
                              ),
                              items: AppLocalData.imgsCenterAssociation
                                  .map(
                                    (item) => Container(
                                      margin: const EdgeInsets.all(
                                        5.0,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Image.asset(
                                          item,
                                          fit: BoxFit.cover,
                                          width: _width,
                                          height: _height,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _width,
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: _width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time_rounded,
                                    size: _width * .082,
                                    color: AppColors.red_color,
                                  ),
                                  SizedBox(
                                    height: _height * 0.01,
                                  ),
                                  Text(
                                    '09:00 - 17:00',
                                    style: TextStyle(
                                      fontSize: _width * .03,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black_color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: _height * 0.06,
                              width: 0.6,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                                color: AppColors.grey_color_2.withOpacity(
                                  0.5,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            SizedBox(
                              width: _width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range_outlined,
                                    size: _width * .082,
                                    color: AppColors.red_color,
                                  ),
                                  SizedBox(
                                    height: _height * 0.01,
                                  ),
                                  Text(
                                    'Lundi - Vendredi',
                                    style: TextStyle(
                                      fontSize: _width * .03,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black_color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: _height * 0.06,
                              width: 0.6,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                                color: AppColors.grey_color_2.withOpacity(
                                  0.5,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            SizedBox(
                              width: _width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: _width * .082,
                                    color: AppColors.red_color,
                                  ),
                                  SizedBox(
                                    height: _height * 0.01,
                                  ),
                                  Text(
                                    'Maroc - Fès',
                                    style: TextStyle(
                                      fontSize: _width * .03,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black_color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Divider(
                        color: AppColors.grey_color_2.withOpacity(
                          0.5,
                        ),
                        height: 3,
                        thickness: 0.5,
                        indent: _width * 0.05,
                        endIndent: _width * 0.05,
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      SizedBox(
                        width: _width,
                        child: ReadMoreText(
                          'Un centre de santé privé, à la fois moderne et équipé, qui vous propose des soins de qualité et des soins adaptés à votre situation. Bienvenue dans le centre de santé privé de Fès.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: _width * .032,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black_color,
                          ),
                          trimLines: 3,
                          colorClickableText: AppColors.grey_color_2,
                          trimMode: TrimMode.Line,
                          // delimiter: '\n',
                          trimCollapsedText: 'Lire plus',
                          trimExpandedText: 'Lire moins',
                          moreStyle: TextStyle(
                            fontSize: _width * .033,
                            fontWeight: FontWeight.w600,
                            color: AppColors.red_color.withOpacity(
                              0.6,
                            ),
                          ),
                          lessStyle: TextStyle(
                            fontSize: _width * .033,
                            fontWeight: FontWeight.w600,
                            color: AppColors.red_color.withOpacity(
                              0.6,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Divider(
                        color: AppColors.grey_color_2.withOpacity(
                          0.5,
                        ),
                        height: 3,
                        thickness: 0.5,
                        indent: _width * 0.05,
                        endIndent: _width * 0.05,
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      SizedBox(
                        width: _width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Emplacement',
                              style: TextStyle(
                                fontSize: _width * .048,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black_color,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Hay Al-Mazaya, Casablanca, Maroc',
                              style: TextStyle(
                                fontSize: _width * .032,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey_color_2,
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.02,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              child: SizedBox(
                                width: _width,
                                height: _height * 0.48,
                                child: const BankLocationScreen(
                                  title: 'Centre de santé',
                                  latitude_pos: 33.5857998283764,
                                  longitude_pos: -7.62405838012695,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Divider(
                        color: AppColors.grey_color_2.withOpacity(
                          0.5,
                        ),
                        height: 3,
                        thickness: 0.5,
                        indent: _width * 0.05,
                        endIndent: _width * 0.05,
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      SizedBox(
                        width: _width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Commentaires et avis',
                              style: TextStyle(
                                fontSize: _width * .048,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black_color,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    RatingBarIndicator(
                                      rating: rating_value,
                                      itemCount: 5,
                                      itemSize: _width * .05,
                                      unratedColor: AppColors.grey_color_2
                                          .withOpacity(.5),
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star_rounded,
                                        color: AppColors.red_color,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _width * 0.01,
                                    ),
                                    Text(
                                      rating_value.toString(),
                                      style: TextStyle(
                                        color: AppColors.red_color,
                                        fontSize: _width * .035,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _width * 0.06,
                                    ),
                                    Text(
                                      '(basé sur 13 avis)',
                                      style: TextStyle(
                                        color: AppColors.grey_color_2,
                                        fontSize: _width * .035,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _height * 0.03,
                            ),
                            SizedBox(
                              width: _width,
                              child: Column(
                                children: <Widget>[
                                  for (int i = 0; i <= 13; i++)
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: _width * 0.02,
                                        right: _width * 0.02,
                                        bottom: _height * 0.02,
                                      ),
                                      padding: const EdgeInsets.all(
                                        8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white_color,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        shape: BoxShape.rectangle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black_color
                                                .withOpacity(
                                              .15,
                                            ),
                                            blurRadius: 5,
                                            offset: const Offset(
                                              0,
                                              0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'karima lahmidi',
                                                style: TextStyle(
                                                  color: AppColors.black_color,
                                                  fontSize: _width * .04,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                width: _width * 0.01,
                                              ),
                                              RatingBarIndicator(
                                                rating: rating_value,
                                                itemCount: 5,
                                                itemSize: _width * .05,
                                                unratedColor: AppColors
                                                    .grey_color_2
                                                    .withOpacity(
                                                  .5,
                                                ),
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star_rounded,
                                                  color: AppColors.red_color,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'il y a 1 jour',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: AppColors.grey_color_2,
                                                  fontSize: _width * .03,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          ReadMoreText(
                                            'Un centre de santé privé, à la fois moderne et équipé, qui vous propose des soins de qualité et des soins adaptés à votre situation. Bienvenue dans le centre de santé privé de Fès.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès.',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: _width * .032,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black_color,
                                            ),
                                            trimLines: 3,
                                            colorClickableText:
                                                AppColors.grey_color_2,
                                            trimMode: TrimMode.Line,
                                            // delimiter: '\n',
                                            trimCollapsedText: 'Lire plus',
                                            trimExpandedText: 'Lire moins',
                                            moreStyle: TextStyle(
                                              fontSize: _width * .033,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.red_color
                                                  .withOpacity(
                                                0.6,
                                              ),
                                            ),
                                            lessStyle: TextStyle(
                                              fontSize: _width * .033,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.red_color
                                                  .withOpacity(
                                                0.6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
