import 'dart:io';


import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:flutter/services.dart';
import 'package:ab/api.dart';
import 'package:ab/viewerpage.dart';
import 'package:ab/widget.dart';

import 'main.dart';



class Day5 extends StatelessWidget {
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
      //"listTile" :
      //"listTileMedium",
      "listTile",
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
      title: Text('  تكوين اليوم الخامس ',style: TextStyle(fontSize: 20)),centerTitle: true,
    ),
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(32),
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
            const SizedBox(height: 80),
            ButtonWidget(

              text:'تكوين الفرنسية اليوم الخامس ',
              onClicked: () async {
                const path = 'assets/تكوين الفرنسية اليوم الخامس.pdf';
                final file = await PDFApi.loadAsset(path);
                openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),


            ButtonWidget(

              text: 'تقرير اليوم الخامس',
              onClicked: () async {
                const path = 'assets/تقرير اليوم الخامس.pdf';
                final file = await PDFApi.loadAsset(path);
                openPDF(context, file);
              },
            ),









          ],
        ),

      ),

    ),


  );


  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file,)),
  );
}