import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryfrontend/core/helper_class/size_config.dart';
import 'package:groceryfrontend/core/helper_class/spacing_helper.dart';
import 'package:groceryfrontend/features/mainscreen/data/model/image_icon_model.dart';

class GridWidget extends StatefulWidget {
  final List<ImageAndIconModel> list;
  final double? customCellHeight;

  GridWidget({super.key, required this.list, this.customCellHeight});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  var _crossAxisSpacing,
      _screenWidth,
      _crossAxisCount,
      _width,
      cellHeight,
      _aspectRatio;

  @override
  void initState() {
    super.initState();

    _crossAxisSpacing = widget.list.length;
    _screenWidth = SizeConfig.screenWidth;
    _crossAxisCount = 2;
    _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    cellHeight = getScreenHeight(portraitHeight: 0.30, landscapeHeight: 0.48);
    _aspectRatio = _width / cellHeight;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.customCellHeight ?? getHeight(length: widget.list.length),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              childAspectRatio: _aspectRatio,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal! * 4),
                  color: Colors.grey[200]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.list[index].image,
                    height: SizeConfig.blockSizeHorizontal! * 30,
                  ),
                  Text(
                    widget.list[index].title,
                    textAlign: TextAlign.center,
                    style: SizeHelper.textStyleHelper(
                        type: Spacing.xMedium, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.list[index].category,
                    textAlign: TextAlign.center,
                    style: SizeHelper.textStyleHelper(type: Spacing.medium,fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(text: "\$",style:  SizeHelper.textStyleHelper(type: Spacing.xMedium,colors: Colors.green)),
                          TextSpan(
                            text: widget.list[index].price.toString(),
                            style: SizeHelper.textStyleHelper(type: Spacing.large,fontWeight: FontWeight.bold),
                          ),
                           TextSpan(text: "/kg",style:  SizeHelper.textStyleHelper(type: Spacing.xMedium,colors: Colors.grey)),
                        ]),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: SizeConfig.blockSizeHorizontal!*2.5,
                        child: SvgPicture.asset('assets/icons/heart.svg',height:SizeConfig.blockSizeHorizontal!*2.5 ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
