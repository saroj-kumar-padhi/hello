import 'package:flutter/material.dart';
import 'package:project/Pages/pages.dart';
import 'package:project/Pages/privacypage.dart';
import 'package:project/Pages/security.dart';
import 'package:project/Pages/terms.dart';

class TextWidget extends StatelessWidget {
  late String text;
  final page;
  TextWidget(this.text, this.page);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) =>
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
      TextWidget("API Policy",const ApiPage()),
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



Widget headerText(String text) => Text(
  text,
  style: const TextStyle(
      height: 1,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black54),
);



Widget headerDrawer() =>Container(
  child: Drawer(child:
  Column(crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      headerText("General"),
      headerText("Online Ordering"),
      headerText("Zomato Pay"),
    ],),),
);
