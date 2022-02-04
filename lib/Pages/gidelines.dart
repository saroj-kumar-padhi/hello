
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:project/Pages/privacypage.dart';
import 'package:project/Pages/drawer.dart';
import 'package:project/Pages/homepage.dart';
import 'package:project/main.dart';

class MobileViewGuidelinesPage extends StatelessWidget {
  const MobileViewGuidelinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(onPressed: (){
         Get.to(NavDrawer());
        }, icon:  Icon(
              Icons.dehaze,
              size: 30,
              color: Colors.black,
            ),)
      ),
        body:        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
          ],
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
        body: Row(children: [
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
            flex: 7,
//  child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
//physics: const NeverScrollableScrollPhysics(),
                    itemCount: sections.length,
                    itemBuilder: (BuildContext context, int index) {
                      final section = sections[index];

                      return SectionWidget(
                        key: section.key,
                        section: section,
                      );
                    },
// ),),
                  )),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableOfContents(
                      sections: sections,
                      onItemTap: (section) {
                        final targetContext = section.key.currentContext;
                        if (targetContext != null) {
                          Scrollable.ensureVisible(
                            targetContext,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ]),
          )
        ]));
  }
}