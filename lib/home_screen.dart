import 'package:favin/model/bloc/product_bloc.dart';
import 'package:favin/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int defaultChoiceIndex = 0;
  List<String> _choicesList = ['Trending', 'Featured', 'New'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  elevation: 0.0,
                  child: new Icon(CupertinoIcons.shopping_cart),
                  backgroundColor: new Color(0xFFE57373),
                  onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 35),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 15,
                    child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        return state is LoadingState
                            ? CupertinoActivityIndicator()
                            : state is SuccessState
                                ? Text('${state.count}',
                                    style: TextStyle(fontSize: 12))
                                : state is FailedState
                                    ? Tooltip(
                                        message: '${state.fail.toString()}',
                                        child: Text("0"))
                                    : Text("");
                      },
                    )),
              ),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              flexibleSpace: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80, left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 16,
                              children:
                                  List.generate(_choicesList.length, (index) {
                                return ChoiceChip(
                                  backgroundColor: Color(0xff78ACFB),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only()),
                                  labelPadding: EdgeInsets.all(2.0),
                                  label: Text(
                                    _choicesList[index],
                                  ),
                                  selected: defaultChoiceIndex == index,
                                  selectedColor: Colors.blue,

                                  onSelected: (value) {
                                    setState(() {
                                      defaultChoiceIndex =
                                          value ? index : defaultChoiceIndex;
                                    });
                                  },
                                  // backgroundColor: color,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Travel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "around the world.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Row(children: [
                          Container(
                            width: 340,
                            height: 55,
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Search your destinations . . .",
                                    prefixIcon: Image.asset("images/gps.png"),
                                    fillColor: Colors.white38),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ]),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff4F80FF),
                      Color(0xff78ACFB),
                    ],
                  ),
                ),
              ),
              // Provide a standard title.
              leading: Padding(
                  padding: EdgeInsets.only(left: 16, top: 30),
                  child: Image.asset("images/leading.png")),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 16, top: 30),
                    child: Image.asset("images/search.png"))
              ],
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 300,
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 24),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("place around you",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff1D1D1D))),
                      Spacer(),
                      Text(
                        "view all",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff9E9E9E)),
                      )
                    ]),
              ),
            ),
            SliverToBoxAdapter(
              child: getverticalList(),
            )
          ],
        ),
      ),
    );
  }

  Widget getverticalList() {
    var list = ["android", "dart", "flutter", "java", "linux", "api"];
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          for (var skill in list)
            Container(
              width: double.infinity,
              height: 160,
              child: Card(
                elevation: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Image(
                                width: 116.0,
                                height: 116,
                                image: AssetImage('images/vertical1.png'),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 260,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 10),
                                child: Container(
                                  width: 250,
                                  child: Text(
                                    "The Grand Canyon",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 250,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width: 250,
                                child: Text("start form"),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width: 250,
                                height: 35,
                                child: Row(children: [
                                  Text(
                                    "\$60",
                                    style: TextStyle(
                                        color: Color(0xff5E83E1),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "/person",
                                    style: TextStyle(
                                        color: Color(0xff9E9E9E), fontSize: 13),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () =>
                                        BlocProvider.of<ProductBloc>(context)
                                            .add(AddToCard()),
                                    child: Text("buy"),
                                  )
                                ]),
                              ),

                              /// my funct
                              /// my function

                              ////finish my func
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "History, Cultural",
                                    style: TextStyle(
                                        color: Color(0xff9E9E9E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "2 Tours in Asia",
                                    style: TextStyle(
                                        color: Color(0xff9E9E9E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "3 Person",
                                    style: TextStyle(
                                        color: Color(0xff9E9E9E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          )),
                    )
                  ],
                ),
              ),
            ),
        ]));
  }
}
