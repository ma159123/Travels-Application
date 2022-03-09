import 'package:flutter/material.dart';
import 'package:trips/layout/cubit.dart';
import 'package:trips/widgets/widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex=0;
  List<String> images = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-two.png',
    'assets/images/welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    var pageController=PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller:pageController ,
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (BuildContext context,  index) => Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150, right: 20, left: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(
                        text: 'Trips',
                        size: 35.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    defaultText(
                      text: 'Mountain',
                      size: 35.5,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                        width: 240.0,
                        child: defaultText(
                            text:
                                'Mountain hikes give you an incredible sense of freedom along with endurance tests',
                            size: 22.0,
                            color: Colors.grey),),
                    const SizedBox(height: 40.0,),
                    InkWell(
                      onTap: (){
                       setState(() {
                        AppCubit.get(context).getData();
                       });
                      },
                      child: Container(width: 120,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(fit: BoxFit.cover,
                              image: AssetImage('assets/images/button-one.png')),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:
                      List.generate(3,(indexOfList){
                        return  Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 10,
                          height: index==indexOfList?30:15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(110.0),
                            color: index==indexOfList?Colors.indigoAccent:Colors.grey,
                          ),
                        );
                      }),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
