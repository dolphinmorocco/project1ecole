import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ab/api.dart';
import 'package:ab/viewerpage.dart';
import 'package:ab/widget.dart';

import 'main.dart';


class Day1 extends StatelessWidget {
  static final String title = 'PDF Viewer';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  NativeAd? nativeAd;
  bool isNativeAdLoaded = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    loadNativeAd();
  }
  void loadNativeAd() {
    nativeAd = NativeAd(
      adUnitId: "",
      factoryId: // wantSmallNativeAd ?
      "listTile",
         // : "listTileMedium",
      listener: NativeAdListener(onAdLoaded: (ad) {
        setState(() {
          isNativeAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        nativeAd!.dispose();
      }),
      request: const AdRequest(),
    );
    nativeAd!.load();
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadNativeAd();

  }






  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(leading:BackButton(onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MyApp(
          //file: file,
        )),
      );
    }) ,
    //Icon(Icons.arrow_back,),
      title: Text('  تكوين اليوم الاول ',style: TextStyle(fontSize: 20)),centerTitle: true,
    ),
    body: Center(

      child: Padding(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isNativeAdLoaded
                  ? Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height:120,
                //doYouWantSmallNativeAd ?
                // 140 :
                //265,
                child: AdWidget(
                  ad: nativeAd!,
                ),
              )
                  : SizedBox(height: 120),
              const SizedBox(height: 35),



              ButtonWidget(

                text:'اهداف و برنامج الدورة التكوينية ',
                onClicked: () async {
                  const path = 'assets/اهداف و برنامج الدورة التكوينية.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 16),
              ButtonWidget(

                text: 'تكوين الفرنسية اليوم الاول',
                onClicked: () async {
                  const path = 'assets/تكوين الفرنسية اليوم الاول.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),




              const SizedBox(height: 16),
              ButtonWidget(

                text: 'روائز العربية و الفرنسية و الرياضيات',
                onClicked: () async {
                  const path = 'assets/روائز العربية و الفرنسية و الرياضيات.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),
              ButtonWidget(

                text: 'تقرير اليوم الاول',
                onClicked: () async {
                  const path = 'assets/تقرير اليوم الاول.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),








            ],
          ),
        ),

      ),
    ),
  );

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file,)),
  );
}