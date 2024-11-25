import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<Map<String, String>> imageList = [
    {
      'title': 'Discover something new',
      'subTitle': 'Special new arrivals just for you',
      'image': ImageConstant.intro1,
    },
    {
      'title': 'Update trendy outfit',
      'subTitle': 'Favorite brands and hottest trends',
      'image': ImageConstant.intro2,
    },
    {
      'title': 'Explore your true style',
      'subTitle': 'Relax and let us bring the style to you',
      'image': ImageConstant.intro3,
    },
  ];

  @override
  void initState() {
    super.initState();
    CommonGetX.unfocus();
  }

  void _shoppingNow() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double topPadding = screenHeight * 0.12;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: screenHeight * 0.56,
                child: Column(
                  children: [
                    SizedBox(height: topPadding),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        imageList[_currentIndex]['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        imageList[_currentIndex]['subTitle'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.44,
                color: AppColors.darkGray,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.17),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.40,
                                height: screenHeight * 0.06,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    backgroundColor: AppColors.lightGray,
                                  ),
                                  onPressed: _shoppingNow,
                                  child: const Text('Shopping now'),
                                ),
                              )
                            ]),
                      )
                    ]),
              ),
            ),
            Positioned(
              top: screenHeight * 0.16 + 56,
              left: 0,
              width: screenWidth,
              child: Column(
                children: [
                  CarouselSlider(
                    items: imageList.map((item) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.fitHeight,
                            width: 1000.0,
                          ),
                        ),
                      );
                    }).toList(),
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: screenHeight * 0.50,
                      autoPlay: false,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: _currentIndex,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.065,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _carouselController.animateToPage(
                          entry.key,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.lightGray, width: 1),
                            color: _currentIndex == entry.key
                                ? AppColors.lightGray // Active color
                                : Colors.transparent, // Inactive color
                          ),
                        ),
                      );
                    }).toList(),
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
