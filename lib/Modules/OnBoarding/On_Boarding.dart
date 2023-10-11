import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_zone/Modules/HomeScreen/Home_Screen.dart';
import 'package:shop_zone/Modules/LoginScreen/Login_Screen.dart';
import 'package:shop_zone/Shared/Componenets/Componentes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    bool isLast = false ;
    var pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {
            navigateAndGo(context, LoginScreen());
          }, child: Text('Skip Guide'))
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == list.length-1) {
                   isLast = true ;
                   print('Its Last');
                  }
                  else {
                    isLast = false ;
                    print ('not last yet');
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoarding(list[index]),
                itemCount: list.length,
                controller: pageController,
              )),
          SmoothPageIndicator(controller: pageController,
            count: list.length,
            effect: ExpandingDotsEffect(

            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    textColor: Colors.white,
                    onPressed: () {if (isLast){
                      navigateAndGo(context, LoginScreen());
                    } else{pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInToLinear,);}

                    },
                    child: Text('Next'),
                  )),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBoarding(OnBoardingModel model) =>
      Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(),
              child: Image.asset(
                model.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              '${model.title}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
}

List<OnBoardingModel> list = [
  OnBoardingModel('assets/images/4.png', 'Welcome To our app'),
  OnBoardingModel('assets/images/9.png', 'Welcome To our app'),
  OnBoardingModel('assets/images/5.jpg', 'Welcome To our app'),
];

class OnBoardingModel {
  String image;
  String title;

  OnBoardingModel(this.image, this.title);
}