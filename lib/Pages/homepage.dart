
import 'package:flutter/material.dart';

import 'privacypage.dart';

class ArticlePage extends StatelessWidget {

  final List<Section> sections;

  const ArticlePage({Key? key, required this.sections}) : super(key: key);

  @override
  Widget build(BuildContext context){final tableOfContents = TableOfContents(
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
    );

    final listView = ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      itemBuilder: (BuildContext context, int index) {
        final section = sections[index];

        return SectionWidget(
          key: section.key,
          section: section,
        );
      },
    );

    return Scaffold(
      // appBar: AppBar(
      // title: const Text('Home Screen'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                tableOfContents,
                listView,
              ],
            ),
          ),
        ),
       ),
    );
  }
}



class TableOfContents extends StatelessWidget {
  final List<Section> sections;
  final void Function(Section) onItemTap;

  const TableOfContents({
    Key? key,
    this.sections = const <Section>[],
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return
       Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: sections
            .map((e) => SectionLink(section: e, onTap: onItemTap))
            .toList(),

    );
  }
}

class SectionLink extends StatelessWidget {
  final Section section;

final void Function(Section) onTap;

const SectionLink({Key? key, required this.section, required this.onTap})
: super(key: key);

@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: () => onTap(section),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Text(
          section.title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.black87, fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}
}

class SectionWidget extends StatelessWidget {
  final Section section;

  const SectionWidget({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                section.title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),

                 Text(
                  section.body,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black54, height: 1.3),
                ),

            ],
          ),
        ));
  }
}

