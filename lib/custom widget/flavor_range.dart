import 'package:flutter/material.dart';

class FlavorRangeTitleData {
  String title;
  String subTitleLeft;
  String subTitleRight;

  FlavorRangeTitleData(
      {required this.title,
      required this.subTitleLeft,
      required this.subTitleRight});
}

// 일열로 세워진 5개의 box에 채워짐 갯 수에 따라서 왼쪽과 오른쪽에
// 어느쪽에 치우쳐 져있는지 알 수 있습니다.
class FlavorRange extends StatelessWidget {
  String title = "";
  String subTitleLeft = "";
  String subTitleRight = "";

  final double? size;
  final bool? disable;
  final Function(double rating)? onChangeRating;

  FlavorRange({
    Key? key,
    required FlavorRangeTitleData flavorRangeTitleData,
    this.size,
    this.disable = false,
    this.onChangeRating,
  }) : super(key: key) {
    title = flavorRangeTitleData.title;
    subTitleLeft = flavorRangeTitleData.subTitleLeft;
    subTitleRight = flavorRangeTitleData.subTitleRight;
  }

  // 왼쪽부터 채워질 box 갯 수 입니다
  @override
  Widget build(BuildContext context) {
    // 채우는 값이 잘못들어오면 빈박스 반환

    return Stack(
      children: [
        Positioned(
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  FlavorBox(leftRadius: 10, rightRadius: 10)
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Text(
            title,
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          child: Text(
            subTitleLeft,
            style: TextStyle(fontSize: 12),
          ),
        ),
        Positioned(
          top: 50,
          right: 0,
          child: Text(
            subTitleRight,
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }
}

class FlavorBox extends StatelessWidget {
  const FlavorBox(
      {super.key, required this.leftRadius, required this.rightRadius});

  final double leftRadius;
  final double rightRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67,
      height: 16,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(width: 1), // const르 둘 수 없기에 final

        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftRadius),
          right: Radius.circular(rightRadius),
        ),
      ),
    );
  }
}
