import 'package:flutter/material.dart';
import 'package:groceryfrontend/core/components/grid_layout.dart';
import 'package:groceryfrontend/core/helper_class/size_config.dart';
import 'package:groceryfrontend/core/helper_class/spacing_helper.dart';
import 'package:groceryfrontend/features/mainscreen/data/model/image_icon_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ImageAndIconModel> data = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      data.add(ImageAndIconModel("fruits", 10,
          image: "assets/images/img_1.png", title: "Cabbage"));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().initialize(context: context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Cart",
                  style: SizeHelper.textStyleHelper(
                      colors: Colors.black,
                      type: Spacing.xMedium,
                      fontWeight: FontWeight.w600),
                ),
                SizeHelper.hSpacing(hSpace: Spacing.large),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: SizeConfig.blockSizeHorizontal! * 3.6,
                  backgroundImage: const AssetImage("assets/images/img_1.png"),
                ),
                SizeHelper.hSpacing(hSpace: Spacing.medium),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: SizeConfig.blockSizeHorizontal! * 3.6,
                  backgroundImage: const AssetImage("assets/images/img_2.png"),
                ),
                SizeHelper.hSpacing(hSpace: Spacing.medium),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: SizeConfig.blockSizeHorizontal! * 3.6,
                  backgroundImage: const AssetImage("assets/images/img_3.png"),
                )
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: SizeConfig.blockSizeHorizontal! * 3.6,
              child: Text(
                "3",
                style: SizeHelper.textStyleHelper(
                    colors: Colors.green,
                    type: Spacing.xMedium,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight! * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(SizeConfig.blockSizeHorizontal! * 5),
                bottomRight:
                    Radius.circular(SizeConfig.blockSizeHorizontal! * 5))),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning!",
                        style: SizeHelper.textStyleHelper(
                            colors: const Color.fromRGBO(0, 0, 0, 0.541),
                            type: Spacing.medium,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Akash Shrestha",
                        style: SizeHelper.textStyleHelper(
                            type: Spacing.xMedium,
                            colors: Colors.black45,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: SizeConfig.blockSizeHorizontal! * 6,
                    backgroundImage:
                        const AssetImage("assets/images/profile.png"),
                  )
                ],
              ),
              SizeHelper.vSpacing(vSpace: Spacing.medium),
              GridWidget(list: data),
            ],
          ),
        ),
      ),
    );
  }
}
