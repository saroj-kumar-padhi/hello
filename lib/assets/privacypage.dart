import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/main.dart';
import 'package:project/responsive_helper.dart';

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

final sections = [
  Section(GlobalKey(), 'The information we collect and how we use it',
      reallyLongBody),
  Section(GlobalKey(), 'How we use the information we collect', reallyLongBody),
  Section(
      GlobalKey(), 'How we share the information we collect', reallyLongBody),
  Section(
      GlobalKey(),
      'Analytics and tailored advertising Tailored Advertising',
      reallyLongBody),
  Section(GlobalKey(), 'Choices about how we use and disclose your information',
      reallyLongBody),
  Section(GlobalKey(), 'Communication choices', reallyLongBody),
  Section(GlobalKey(), 'Reviewing, changing or deleting information',
      reallyLongBody),
  Section(GlobalKey(), 'Accessing & correcting your personal information',
      reallyLongBody),
  Section(
      GlobalKey(), 'Security: How we protect your information', reallyLongBody),

];

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWidget(
          mobile: MobileViewPrivacyPage(),
          DeskTop: WideScreenPrivacyPage(),
          Tab: MobileViewPrivacyPage()),
    );
  }
}

class MobileViewPrivacyPage extends StatelessWidget {
  const MobileViewPrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
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
              size: 30,
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
                        padding: const EdgeInsets.all(4.0),
                        child: buildPolicies(),
                      ),
                    ),
                  ),
                ),
              );
            })
        //))
        // ])
        );
  }
}

class WideScreenPrivacyPage extends StatelessWidget {
  const WideScreenPrivacyPage({Key? key}) : super(key: key);
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

          // Column(
          //  children: [
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
                  const BuildButtons()
                ]),
          ),
          // ) ],
          //         ),
          // ) ,

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
//              ] ),
        ]));
  }
}

class BuildButtons extends StatelessWidget {
  const BuildButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Previous',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " << Guidelines and Policies ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
              width: 50,
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      "Terms and Service >>  ",
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
        ),
      ),
    );
  }
}
