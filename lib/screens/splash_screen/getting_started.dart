import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';

class GettingStart extends StatefulWidget {
  const GettingStart({Key? key}) : super(key: key);

  @override
  _GettingStartState createState() => _GettingStartState();
}

class _GettingStartState extends State<GettingStart> {
  CarouselController carouselController = CarouselController();
  List<Widget> list = [
    SliderItem(
      img: 'assets/images/popcorn.png',
      text1: "popcorn",
      text2: "Order anything you want from your\n Favorite restaurant.",
    ),
    SliderItem(
      img: 'assets/images/money.png',
      text1: "Easy Payment",
      text2:
          "Payment made easy through\n debit card, credit card  & more\n ways to pay for\n your food",
    ),
    SliderItem(
      img: 'assets/images/restaurant.png',
      text1: "Enjoy the Taste!",
      text2:
          "Healthy eating means eating a\n variety of foods that\n give you the nutrients you\n need to maintain your health.",
    )
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: size.height / 2,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            carouselController: carouselController,
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: size.width,
                    child: Column(
                      children: [i],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key ? primaryColor : greyColor),
                ),
              );
            }).toList(),
          ),
          bottom_part(
            size: size,
            ontap: () => carouselController.nextPage(),
          ),
        ],
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.img,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String img;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(img),
        SizedBox(
          height: 25,
        ),
        Text(text1,
            style: TextStyle(
              fontSize: 26,
            )),
        SizedBox(
          height: 25,
        ),
        Text(text2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: greyColor,
            )),
      ],
    );
  }
}

class bottom_part extends StatelessWidget {
  const bottom_part({
    Key? key,
    required this.size,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/down.png',
                width: size.width,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  bottom: 41,
                  right: 43,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: ontap,
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.black, fontSize: 21),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22))),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text("Skip",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 21)))
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
