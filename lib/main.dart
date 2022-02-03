import 'package:flutter/material.dart';
import 'package:project/assets/privacypage.dart';
import 'package:project/pages.dart';
import 'package:project/responsive_helper.dart';
import 'package:project/security.dart';
import 'package:project/terms.dart';
import 'package:project/textreader.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //String get textPath => 'lib/assets/text/privacy.txt';
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PrivacyPage(),
      // routes: <String, WidgetBuilder>{
      //'/PrivacyPage' : (BuildContext context)=> const PrivacyPage(),
      //'/TermsPage' :   (BuildContext context)=> const TermsPage(),
      // '/SecurityPage': (BuildContext context) => const SecurityPage(),
      //'/FqaPage' : (BuildContext context)=>const FqaPage(),
      //}
    );
  }
}

class TextWidget extends StatelessWidget {
  late String text;
  final page;
  TextWidget(this.text, this.page);
  // List<Widget> names =[
  //  const GuidelinesPolicies(),
  //   const PrivacyPage(),
  //   const TermsPage(),
  //   const SecurityPage(),
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) =>

          //margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
          // child:
          InkWell(
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return (page);
          }))
        },



        child: Text(
          text,
          style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.normal,
              color: Colors.black54),
        ),
      ),
    );
  }
}

  /*class BuildButtons extends StatelessWidget {
 final String text1;
   final String text2;
  const BuildButtons( {Key? key, required this.text1, required this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(



    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Previous',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text1,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                )
              ],
            ),
          ),
        ),
         SizedBox(
          height: 30,
          width: 40,
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Next',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  text2,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ))
              ],
            ),
          ),
        ),
      ],
    ));
        }
}*/

Widget buildPolicies() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          TextWidget("Guidelines and Policies", const GuidelinesPolicies()),
          const SizedBox(
            height: 10,
          ),
          TextWidget("PrivacyPolicy", const PrivacyPage()),
          const SizedBox(
            height: 10,
          ),
          TextWidget("Terms of Service", const TermsPage()),
          const SizedBox(
            height: 10,
          ),
          TextWidget("API Policy", const ApiPage()),
          const SizedBox(
            height: 10,
          ),
          TextWidget("CSR", const CsrPage()),
          const SizedBox(
            height: 10,
          ),
          TextWidget(
              "License and Registration", const LicenseRegistrationPage()),
          const SizedBox(
            height: 10,
          ),
          TextWidget("Security", const SecurityPage()),
        ]);

class LinkPages extends StatelessWidget {
  final String text;
  //final  Uri ;
  const LinkPages({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        // ListView.builder(itemBuilder: (BuildContext context, int index) {
        // return ListTile(
        // title: Text(text),
        Link(
            target: LinkTarget.blank,
            uri: Uri.parse(
                "https://www.zomato.com/policies/privacy/#the-information-we-collect-and-how-we-use-it"),
            builder: (BuildContext context, followLink) => InkWell(
                  onTap: () => launch(
                      "https://www.zomato.com/policies/privacy/#the-information-we-collect-and-how-we-use-it"),
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.black),
                  ),
                ));
  }
}

Widget headerText(String text) => Text(
      text,
      style: const TextStyle(
          height: 1,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54),
    );

class GuidelinesPolicies extends StatelessWidget {
  const GuidelinesPolicies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: ResponsiveWidget(
            mobile: MobileViewGuidelinesPage(),
            DeskTop: WideScreenGuidelinesPage(),
            Tab: MobileViewGuidelinesPage()),
      );
}

class MobileViewGuidelinesPage extends StatelessWidget {
  const MobileViewGuidelinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: const [
          Expanded(child: TextReader("lib/assets/text/privacy.txt")),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: const Icon(
              Icons.dehaze,
              size: 20,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Drawer(
                    child: Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                    child:  buildPolicies(),  ),
                    ),
                  ),
                ),
              );
            }));
  }
}

class WideScreenGuidelinesPage extends StatelessWidget {
  const WideScreenGuidelinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headerText("General"),
              const SizedBox(
                width: 30,
              ),
              headerText("Online Ordering"),
              const SizedBox(width: 30),
              headerText(
                "Zomato Pay",
              ),
              const SizedBox(
                width: 30,
              ),
              // SizedBox(width: 20 ,),
            ],
          )),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:buildPolicies(),
            ),
          ),
          const VerticalDivider(
            color: Colors.grey,
            thickness: 1,
          ),
          const Expanded(
            flex: 6,
            child: TextReader('lib/assets/text/privacy.txt'),
          ),
          const VerticalDivider(
            color: Colors.grey,
            thickness: 1,
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  LinkPages(
                    text: 'Foodie Code of Conduct',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: 'Keep out the clutter'),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: 'Keep it relevant'),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: 'Keep it clean'),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: 'Keep it fresh'),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: 'Keep it real'),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: "Don't solicit"),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: 'Tell the whole story'),
                  SizedBox(
                    height: 10,
                  ),
                  LinkPages(text: 'Be yourself'),
                  SizedBox(height: 10),
                  LinkPages(text: "Don't misrepresent"),
                  SizedBox(height: 10),
                  LinkPages(text: 'Play by the rules'),
                  SizedBox(height: 10),
                  LinkPages(text: 'Seek help from the right people'),
                  SizedBox(height: 10),
                  LinkPages(text: 'Photo guidelines'),
                  SizedBox(height: 10),
                ],
              ))
        ],




      ),
    );
  }
}








