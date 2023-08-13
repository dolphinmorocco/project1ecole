import 'dart:io';


import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:flutter/services.dart';
import 'package:ab/api.dart';
import 'package:ab/viewerpage.dart';
import 'package:ab/widget.dart';

import 'main.dart';




class Day3 extends StatelessWidget {
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
// المدرسة العمومية الرائدة بالمغرب
//  المدرسة_العمومية_الرائدة_بالمغرب
//  المدرسة-العمومية-الرائدة-بالمغرب
//  android:name="com.google.android.gms.ads.APPLICATION_ID"
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
     // adUnitId: "ca-app-pub-3940256099942544/2247696110",
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
      title: Text('  تكوين اليوم الثالث ',style: TextStyle(fontSize: 20)),centerTitle: true,
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

              text:'تكوين العربية اليوم الثالث ',
              onClicked: () async {
                const path = 'assets/تكوين العربية اليوم الثالث.pdf';
                final file = await PDFApi.loadAsset(path);
                openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),



            ButtonWidget(

              text: ' تقرير اليوم الثالث',
              onClicked: () async {
                const path = 'assets/تقرير اليوم الثالث.pdf';
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