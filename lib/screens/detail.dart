import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_shop_ui/models/plant_model.dart';
import 'package:plant_shop_ui/utilities/color.dart';

import '../models/plants.dart';

class DetailScreen extends StatefulWidget {
  final PlantModel plant;
  const DetailScreen({super.key, required this.plant});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextStyle kTextStyle = const TextStyle(
      color: Colors.white60, fontWeight: FontWeight.w500, fontSize: 14);
  TextStyle kTitle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColor.green,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart),
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            widget.plant.type.toUpperCase(),
                            style: kTextStyle,
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 3),
                          child: Text(
                            widget.plant.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("FROM", style: kTextStyle),
                                Text('\$${widget.plant.price}', style: kTitle),
                                const SizedBox(height: 30),
                                Text("SIZE", style: kTextStyle),
                                Text(widget.plant.size, style: kTitle),
                                const SizedBox(height: 30),
                                Container(
                                  transform:
                                      Matrix4.translationValues(-20, 0, 0),
                                  child: RawMaterialButton(
                                    padding: const EdgeInsets.all(13),
                                    shape: const CircleBorder(),
                                    fillColor: Colors.black,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.add_shopping_cart,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Hero(
                              tag: widget.plant.image,
                              child: Image.asset(
                                widget.plant.image,
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ]),
              ),
              Material(
                color: AppColor.green,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 50, left: 20, right: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("All to know...",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text(widget.plant.description),
                      const SizedBox(height: 20),
                      const Text("Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text(widget.plant.detail),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
