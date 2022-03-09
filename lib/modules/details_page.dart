import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/layout/cubit.dart';
import 'package:trips/layout/states.dart';
import 'package:trips/widgets/widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int isSelected = -1;
  int rateStarted = 4;
  bool isFavorite=false;
  bool isBooked=true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: BlocBuilder<AppCubit, States>(
      builder: (BuildContext context, state) {
        LoadedDetailsDataState detailsState = state as LoadedDetailsDataState;
        var cubit = AppCubit.get(context);
        return SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                height: 350,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'http://mark.bslmeiyu.com/uploads/' +
                          detailsState.place.img!,
                    ),
                  ),
                ),
              )),
              Positioned(
                top: 10.0,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        cubit.goHome();
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 230,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            defaultText(
                                text: detailsState.place.name!,
                                size: 30.0,
                                fontWeight: FontWeight.bold),
                            defaultText(
                                text: '\$${detailsState.place.price!}',
                                size: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.indigo,
                              size: 30.0,
                            ),
                            defaultText(
                                text: detailsState.place.location!,
                                size: 20.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: index < state.place.stars!
                                              ? Colors.orange
                                              : Colors.grey,
                                        ))),
                            const SizedBox(
                              width: 12.0,
                            ),
                            defaultText(
                              text: '(${state.place.stars!},0)',
                              size: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultText(
                          text: 'People',
                          size: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        defaultText(
                          text: '${state.place.people}',
                          size: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected = index;
                                  print(isSelected);
                                });
                              },
                              child: defaultBottom(
                                size: 60,
                                color: isSelected == index
                                    ? Colors.black
                                    : Colors.grey,
                                textColor: isSelected == index
                                    ? Colors.white
                                    : Colors.black,
                                text: '${index + 1}',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultText(
                          text: 'Description',
                          size: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: defaultText(
                            text: detailsState.place.description!,
                            size: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 650,
                left: 10,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFavorite =!isFavorite;
                        });
                      },
                      child: defaultBottom(
                        iconColor: isFavorite?Colors.red:Colors.grey,
                          size: 60,
                          borderColor: Colors.grey,
                          isIcon: true,
                          icon: isFavorite?Icons.favorite:Icons.favorite_border_outlined),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isBooked=!isBooked;
                        });
                      },
                      child:isBooked? Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: 280,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            defaultText(
                              text: 'Book Trip Now',
                              size: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            const Image(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/button-one.png')),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.88),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ):Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: 280,
                        height: 60,
                        child: Center(
                          child: defaultText(
                            text: 'Done',
                            size: 23.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color:isBooked?Colors.green: Colors.indigo.withOpacity(0.88),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    )));
  }
}
