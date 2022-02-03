import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/assets/privacypage.dart';
import 'package:project/responsive_helper.dart';
import 'package:project/terms.dart';
import 'package:project/textreader.dart';
import 'main.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWidget(
          mobile: MobileViewSecurityPage(),
          DeskTop: WideScreenSecurityPage(),
          Tab: MobileViewSecurityPage()),
    );
  }
}

class MobileViewSecurityPage extends StatefulWidget {
  const MobileViewSecurityPage({Key? key}) : super(key: key);

  @override
  _MobileViewSecurityPageState createState() => _MobileViewSecurityPageState();
}

class _MobileViewSecurityPageState extends State<MobileViewSecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                // const Align(
                // alignment: Alignment.center,
                //),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.43,
                    width: MediaQuery.of(context).size.width * 0.62,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        //  boxShadow:[BoxShadow(offset: Offset(0.0,6.0),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("lib/assets/images/security.jpg"),
                          fit: BoxFit.fill,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          "Security @ Pujapurohit",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              const Expanded(
                  flex: 7, child: TextReader("lib/assets/text/privacy.txt")),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 7),
                    ),

                    onPressed: () {},
                    // style: const ButtonStyle(
                    // ),

                    // child:
                    //const Padding(
                    //padding:  EdgeInsets.all(8.0),
                    child: const Text(
                      "Submit a bug report",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  )),
              //    BuildCard( image:'lib/assets/images/security.jpg',  textpath: 'lib/assets/text/privacy.txt'
              //    ),
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
                              child: buildPolicies(),
                            ),
                          ),
                        )),
              );
            }));
  }
}

class WideScreenSecurityPage extends StatelessWidget {
  const WideScreenSecurityPage({Key? key}) : super(key: key);

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
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildPolicies(),
              ),
            ),

            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    // const Align(
                    // alignment: Alignment.center,
                    //),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.44,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            //  boxShadow:[BoxShadow(offset: Offset(0.0,6.0),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            image: const DecorationImage(
                              image:
                                  AssetImage("lib/assets/images/security.jpg"),
                              fit: BoxFit.cover,
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "Security @ Pujapurohit",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  const Expanded(
                      flex: 7,
                      child: TextReader("lib/assets/text/privacy.txt")),

                  //     flex: 6,
                  // const LinkPages( text: 'The information we collect and how we use it',),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 7),
                        ),

                        onPressed: () {},
                        // style: const ButtonStyle(
                        // ),

                        // child:
                        //const Padding(
                        //padding:  EdgeInsets.all(8.0),
                        child: const Text(
                          "Submit a bug report",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Previous',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "<< License and Registration  ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                ],
              ),
              //const VerticalDivider(
              //color: Colors.grey,
              //thickness: 1,
            ),
            //const VerticalDivider(
            //color: Colors.grey,
            //thickness: 1,),

            Expanded(
              flex: 2,
              child: Container(),
            ),
            // const VerticalDivider(
            // color: Colors.grey,
            //thickness: 1,
            //),
          ],
        )

        // )
        );
  }
}

class BuildCard extends StatelessWidget {
  const BuildCard({Key? key, required this.image, required this.textpath})
      : super(key: key);

  @override
  final textpath;
  final image;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(image),
            ExpandablePanel(
              collapsed: Text(
                textpath,
                style: const TextStyle(fontSize: 15),
                softWrap: true,
              ),
              expanded: Text(List.generate(1, (_) => textpath).join('\n\n')),
            ),
          ],
        ),
      ),
    );
  }
}
