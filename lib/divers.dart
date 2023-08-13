import 'dart:io';


import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:flutter/services.dart';
import 'package:ab/api.dart';
import 'package:ab/viewerpage.dart';
import 'package:ab/widget.dart';

import 'main.dart';



class Divers extends StatelessWidget {
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
      title: Text('  ملفات مختلفة ',style: TextStyle(fontSize: 20)),centerTitle: true,
    ),
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(36),

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

                const SizedBox(height: 40),
                ButtonWidget(

                  text:'انشطة الرياضيات : العمليات الحسابية ',
                  onClicked: () async {
                    const path = 'assets/انشطة الرياضيات  العمليات الحسابية.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(

                  text: 'روائز العربية و الرياضيات و الفرنسية',
                  onClicked: () async {
                    const path = 'assets/روائز العربية و الرياضيات و الفرنسية.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(

                  text:'سيرورة الروائز حسب كل مستوى ',
                  onClicked: () async {
                    const path = 'assets/سيرورة الروائز حسب كل مستوى.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(

                  text:'مكونات الملف التراكمي ',
                  onClicked: () async {
                    const path = 'assets/مكونات الملف التراكمي.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),


                ButtonWidget(

                  text:'اهم المصطلحات ',
                  onClicked: () async {
                    const path = 'assets/أهم المصطلحات.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(

                  text:'نموذج الملف التراكمي لتكوين طارل ',
                  onClicked: () async {
                    const path = 'assets/نموذج الملف التراكمي لتكوين طارل.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(

                  text:'مقاربة التدريس بالتخصص ',
                  onClicked: () async {
                    const path = 'assets/مقاربة التدريس بالتخصص.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(

                  text:'نموذج مشروع مدرسة الريادة لثلاث سنوات ',
                  onClicked: () async {
                    const path = 'assets/نموذج مشروع مدرسة الريادة لثلاث سنوات.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(

                  text:'واجهات الملف التراكمي ',
                  onClicked: () async {
                    const path = 'assets/واجهات الملف التراكمي.pdf';
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