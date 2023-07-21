import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_shop_ui/models/plants.dart';
import 'package:plant_shop_ui/screens/detail.dart';
import 'package:plant_shop_ui/utilities/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> types = [
    "Outdoor",
    "Indoor",
    "New Arrivals",
    "Limited Edition",
  ];

  int _selectedType = 0;
  int _pageSelected = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.75);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _plantSelector(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget? widget) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page! - index;
            value = (1 - (value.abs() * 0.3)).clamp(0, 1);
            //print(value);
            //print(_pageController.page);
          }
          return Center(
            child: Container(
              //color: Colors.yellow,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: Curves.easeInOut.transform(value) *
                  MediaQuery.of(context).size.height *
                  0.55,
              width: Curves.easeInOut.transform(value) * 400,
              child: widget,
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF32A060),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Center(
                      child: Hero(
                        tag: plants[index].image,
                        child: Image.asset(
                          plants[index].image,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      top: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "FROM",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            '\$ ${plants[index].price}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plants[index].type.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            plants[index].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned(
                bottom: 0,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                DetailScreen(plant: plants[index])));
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(13),
                  child: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.grey.shade600,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.cartShopping,
                      color: Colors.black,
                      size: 18,
                    ))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Top Picks",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 50,
            //color: Colors.blue,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: types.asMap().entries.map((e) {
                return Ink(
                    height: 50,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            _selectedType = e.key;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                              child: Text(e.value,
                                  style: TextStyle(
                                    fontWeight: _selectedType == e.key
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    color: _selectedType == e.key
                                        ? Colors.black
                                        : Colors.grey[400],
                                  ))),
                        )));
              }).toList(),
            ),
          ),
          Container(
              //color: Colors.blue,
              alignment: Alignment.center,
              //margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: plants.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageSelected = value;
                    });
                  },
                  itemBuilder: (_, index) {
                    return _plantSelector(index);
                  })),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Description",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(plants[_pageSelected].description),
          )
        ],
      ),
    ));
  }
}
