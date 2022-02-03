import 'package:flutter/material.dart';
import 'package:project/assets/privacypage.dart';
import 'package:project/responsive_helper.dart';
import 'package:project/security.dart';
import 'package:project/textreader.dart';

import 'homepage.dart';
import 'main.dart';

class Section {
  final GlobalKey key;
  final String title;
  final String body;

  const Section(this.key, this.title, this.body);
}

const reallyLongBody =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce venenatis pharetra dui, ac semper nulla dapibus ultrices.'
    ' Pellentesque sed erat accumsan lorem rhoncus mattis eu eget nulla. Phasellus sagittis vehicula dapibus. Nulla dolor nunc, '
    'feugiat ac ullamcorper vel, commodo sed lacus. Nunc volutpat rutrum euismod. Nullam venenatis imperdiet odio, non porta leo '
    'ullamcorper ac. Aliquam fringilla mauris ut ante faucibus, non tempus elit placerat. Donec sed porttitor tellus. Donec lobortis '
    'arcu id lectus commodo varius. Fusce tincidunt ante in faucibus suscipit. Nulla facilisi. Nunc at nibh dictum sem aliquet '
    'consectetur eu nec neque. Nullam ullamcorper vulputate nisl quis pharetra. Etiam dapibus ullamcorper magna, a iaculis libero '
    'dignissim in. Vestibulum dictum, justo posuere consectetur eleifend, augue mi dictum dui, eu sollicitudin elit mauris vel lacus. '
    'Donec dui felis, dapibus vel urna at, commodo facilisis felis.\nCurabitur faucibus leo ipsum, in vehicula risus rhoncus id. Donec '
    'ac velit quis nulla suscipit efficitur. Nulla non euismod neque. Sed blandit urna sed ex tempor sagittis. Curabitur condimentum nec ';

final section = [
  Section(GlobalKey(), 'Account Creation', reallyLongBody),
  Section(GlobalKey(), '', reallyLongBody),
  Section(
      GlobalKey(), 'Purpose', reallyLongBody),
  Section(
      GlobalKey(),
      'Grant of License',
      reallyLongBody),
  Section(GlobalKey(), 'Obligations of Developer',
      reallyLongBody),
  Section(GlobalKey(), 'Recognition of Absolute Ownership', reallyLongBody),
  Section(GlobalKey(), 'Developer Obligations and Protection of Information and Access Key',
      reallyLongBody),
  Section(GlobalKey(), 'Confidentiality',
      reallyLongBody),
  Section(
      GlobalKey(), 'Zomato Use of Developers Trademarks', reallyLongBody),
Section(GlobalKey(), 'Independent Parties', reallyLongBody),
Section(GlobalKey(), 'Indemnity', reallyLongBody),];


class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: ResponsiveWidget(
            mobile: MobileViewTermsPage(),
            DeskTop: WideScreenTermsPage(),
            Tab: MobileViewTermsPage()),
      );
}

class MobileViewTermsPage extends StatelessWidget {
  const MobileViewTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class WideScreenTermsPage extends StatelessWidget {
  const WideScreenTermsPage({Key? key}) : super(key: key);

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
                    key: section.key, section: section,

                    //section: section,
                  );
                },
                // ),),
              )),
              const BuildButtons(),
            ],
          ),
        ),
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
    );
  }
}
