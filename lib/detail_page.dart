import 'package:flutter/material.dart';

import 'custom widget/flavor_range.dart';
import 'custom widget/spacer.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  String distilleryImg =
      "https://firebasestorage.googleapis.com/v0/b/whilabel.appspot.com/o/distillery_images%2FAberfeldy.jpeg?alt=media&token=bfc1c375-7a2e-4933-b1da-7ea3971447cb";
  String whiskyImageUrl =
      "https://firebasestorage.googleapis.com/v0/b/whilabel.appspot.com/o/post%2Farchiving_post%2Fgoogle%3A102330622065897921430%2B1705477390368381%2F05521c50-d99a-1e60-94a1-cf376977e98e%5Egoogle%3A102330622065897921430%2B1705477390368381%7D.jpg?alt=media&token=4a20fb80-d378-43ab-bace-5621eb411db0";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Column(
                    children: [
                      // 양조장 이미지
                      SizedBox(
                        width: size.width * 0.9,
                        height: size.height * 0.3,
                        child: Image.network(distilleryImg,
                            width: 40, height: 40, fit: BoxFit.fill),
                      ),
                      Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextBox("위스키 등록 중입니다", "위스키 정보 검토중"),
                                CustomSpacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildTextBox("나의 평가", "2024.05.24"),
                                    TextButton(
                                        child: Text("수정"), onPressed: () {})
                                  ],
                                ),
                                buildDivider(),
                                TasteTester(),
                                buildDivider(),
                                const SizedBox(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("맛 특징과 브랜드 특징이\n 곧 등록될 예정이에요",
                                        maxLines: 2),
                                    // Text("")
                                  ],
                                ))
                              ])),
                    ],
                  ),
                  Positioned(
                      top: 170,
                      right: 16,
                      child: Container(
                          width: size.width * 0.3,
                          height: size.height * 0.18,
                          child: Image.network(
                            whiskyImageUrl,
                          )))
                ],
              ),
            ),
            const Positioned(top: 0, child: DetailPageAppBar())
          ],
        ),
      ),
    );
  }

  Widget buildTextBox(String title, String content) {
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        Text(
          content,
          style: TextStyle(fontSize: 14),
        )
      ],
    ));
  }

  Widget buildDivider() {
    return Container(
      height: 2,
      color: Colors.grey,
    );
  }
}

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        child: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(Icons.more_horiz, size: 30, color: Colors.white),
            ],
          ),
        ));
  }
}


/** 유저가 위스키를 기록하고 볼 수 있는  Widget
 * */
class TasteTester extends StatelessWidget {
  TasteTester({Key? key}) : super(key: key);

  final data1 = FlavorRangeTitleData(
      title: "바디감", subTitleLeft: "가벼움", subTitleRight: "무거움");
  final data2 = FlavorRangeTitleData(
      title: "향", subTitleLeft: "섬세함", subTitleRight: "스모키함");

  final data3 = FlavorRangeTitleData(
      title: "피트감", subTitleLeft: "언피트", subTitleRight: "피트함");

  @override
  Widget build(BuildContext context) {
    final List<FlavorRangeTitleData> flavorRangeTitleDatas = [
      data1,
      data2,
      data3
    ];

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            border: Border.all(width: 2, color: Colors.white12)),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showSubjectText("별점"),
            Container(
              child: Row(children: [
                for (int i = 0; i < 5; i++)
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 50,
                  )
              ]),
            ),
            showSubjectText("테이스팅 노트"),
            const SizedBox(
              child: Text(
                  " 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세"),
            ),
            CustomSpacer(),
            showSubjectText("맛 평가"),
            Container(
              child: Column(children: [
                for (FlavorRangeTitleData titleData in flavorRangeTitleDatas)
                  FlavorRange(flavorRangeTitleData: titleData),
                CustomSpacer(),
              ]),
            )
          ],
        ));
  }

  Widget showSubjectText(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 20),
        ),
        CustomSpacer()
      ],
    );
  }
}
