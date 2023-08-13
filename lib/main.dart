import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ab/api.dart';
import 'package:ab/viewerpage.dart';
import 'package:ab/widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';




import 'day1.dart';
import 'day2.dart';
import 'day3.dart';
import 'day4.dart';
import 'day5.dart';
import 'day6.dart';
import 'day7.dart';
import 'day8.dart';
import 'divers.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}
//  {  }
class MyApp extends StatelessWidget {
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
  //final _nativeAdController = NativeAdmobController() ;
  // late AdmobBannerSize bannerSize;
  // void initState() {
  // myBanner = BannerAd(adUnitId: ) ;
  //super.initState();
  // Load ads
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
      //ca-app-pub-3940256099942544/2247696110
      factoryId: // wantSmallNativeAd ?
      //"listTile" :
      "listTileMedium",
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

  //   l_mli3bate





  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('  2023 tarl  تكوين ',style: TextStyle(fontSize: 20)),centerTitle: true,
    ),



    body: Center(
      child: Padding(
        padding: EdgeInsets.only(left: 10 , right: 10)  ,

        child: SingleChildScrollView(
          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),

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

              const SizedBox(height: 60),
              ButtonWidget(

                text: 'اليوم الاول ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day1(
                      //file: file,
                    )),
                  );

                },
              ),
              const SizedBox(height: 18),
              ButtonWidget(

                text: 'اليوم الثاني ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day2(
                      //file: file,
                    )),
                  );

                },
              ),

              const SizedBox(height: 18),
              ButtonWidget(

                text: 'اليوم الثالث ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day3(
                      //file: file,
                    )),
                  );
                },
              ),
              const SizedBox(height: 22),
              //Container(
              // child: isAdLoaded ?
              //SizedBox( height:100,
              //bannerAd.size.height.toDouble() ,
              //  width:bannerAd.size.width.toDouble() ,
              //child:AdWidget(ad: bannerAd,)
              // ,)
              //  :const SizedBox(),
              // ),

















              ButtonWidget(

                text: 'اليوم الرابع ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day4(
                      //file: file,
                    )),
                  );

                },
              ),

              const SizedBox(height: 18),
              ButtonWidget(

                text: 'اليوم الخامس ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day5(
                      //file: file,
                    )),
                  );

                },
              ),
              const SizedBox(height: 18),






              ButtonWidget(

                text: 'اليوم السادس ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day6(
                      //file: file,
                    )),
                  );

                },
              ),


              // isAdLoaded ?
              // SizedBox( height:60,
              //bannerAd.size.height.toDouble() ,
              // width:bannerAd2.size.width.toDouble() ,
              // child:AdWidget(ad: bannerAd2,)
              //,)
              //  :const SizedBox(),


              const SizedBox(height: 22),
              ButtonWidget(

                text: 'اليوم السابع ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day7(
                      //file: file,
                    )),
                  );


                },
              ),
              const SizedBox(height: 18),



              //const SizedBox(height: 16),
              ButtonWidget(

                text: 'اليوم الثامن ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Day8(
                      //file: file,
                    )),
                  );

                },
              ),

              const SizedBox(height: 16),
              ButtonWidget(

                text: 'ملفات مختلفة ',
                onClicked: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Divers(
                      //file: file,
                    )
                    ),
                  );

                },
              ),




              const SizedBox(height: 22),




            ],
          ),
        ),





      ),


    ),



  );


//void openPDF(BuildContext context, File file) => Navigator.of(context).push(
//MaterialPageRoute(builder: (context) => Day1(file: file,)),
//);
}



