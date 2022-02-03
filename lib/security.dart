import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:project/responsive_helper.dart';

import 'package:project/textreader.dart';
import 'assets/privacypage.dart';
import 'homepage.dart';
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
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.76,
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
              Expanded(
                flex: 9,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: sections.length,
                  itemBuilder: (BuildContext context, int index) {
                    final section = sections[index];

                    return SectionWidget(
                      key: section.key,
                      section: section,
                    );
                  },
                ),
              ),

              //     flex: 6,
              // const LinkPages( text: 'The information we collect and how we use it',),

              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),

                    ),
                    onPressed: () {},
                    child: const Text(
                      "Submit a bug report",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  )),
            ]
),
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
            flex: 3,
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
            flex: 7,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
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
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: sections.length,
                      itemBuilder: (BuildContext context, int index) {
                        final section = sections[index];

                        return SectionWidget(
                          key: section.key,
                          section: section,
                        );
                      },
                    ),
                  ),

                  //     flex: 6,
                  // const LinkPages( text: 'The information we collect and how we use it',),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 18, vertical: 7),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Submit a bug report",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      )),
                ]),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
