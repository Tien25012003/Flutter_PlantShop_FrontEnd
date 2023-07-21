import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_shop_ui/utilities/color.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Row(
                children: [Text("AA")],
              ),
              Container(
                width: double.infinity,
                color: Colors.amber,
                child: Center(
                  child: Text("AA"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
