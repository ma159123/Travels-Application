import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/layout/cubit.dart';
import 'package:trips/layout/states.dart';
import 'package:trips/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<String, String> images = {
    'assets/images/balloning.png': 'balloning',
    'assets/images/hiking.png': 'hiking',
    'assets/images/kayaking.png': 'kayaking',
    'assets/images/snorkling.png': 'snorking',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubit, States>(
          builder: (BuildContext context, state) {
            if(state is LoadedDataState){
              var places=state.places;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(image: AssetImage('assets/images/travel.png')),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: defaultText(
                        text: 'Discover',
                        size: 35.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Align(
                        // alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelColor: Colors.black,
                          labelPadding: const EdgeInsets.only(left: 0, right: 60.0),
                          unselectedLabelColor: Colors.grey,
                          controller: tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator:
                          CircleTabIndicator(color: Colors.indigo, radius: 4),
                          tabs: const [
                            Tab(text: 'Places'),
                            Tab(text: 'Inspiration'),
                            Tab(text: 'Emotions'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.maxFinite,
                        height: 280,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            ListView.builder(
                              itemCount: places.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                    onTap: (){
                                      AppCubit.get(context).getDetails(places[index]);
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      margin: const EdgeInsets.only(right: 15, top: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(15),
                                        image:   DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+places[index].img!),
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                            ListView.builder(
                              itemCount: places.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                    onTap: (){
                                      AppCubit.get(context).getDetails(places[index]);
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      margin: const EdgeInsets.only(right: 15, top: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(15),
                                        image:   DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+places[index].img!),
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                            ListView.builder(
                              itemCount: places.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                    onTap: (){
                                      AppCubit.get(context).getDetails(places[index]);
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      margin: const EdgeInsets.only(right: 15, top: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(15),
                                        image:   DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+places[index].img!),
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defaultText(
                              text: 'Explore more',
                              size: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          defaultText(
                            text: 'See all',
                            size: 23.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10.0,top: 10.0),
                            width: 365,
                            height: 110,
                            child: ListView.builder(
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Column(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image:  DecorationImage(fit: BoxFit.cover,
                                          image: AssetImage(images.keys.elementAt(index)),),
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20.0)),
                                    width: 80,
                                    height: 80,
                                    margin: const EdgeInsets.only(right: 20.0),
                                  ),
                                  const SizedBox(height: 5.0,),
                                  defaultText(text:images.values.elementAt(index), size: 20, color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  late final Color color;
  late double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  late final Color color;
  late double radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    Offset circleOffset = Offset(configuration.size!.width / 2 - radius * 7,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
