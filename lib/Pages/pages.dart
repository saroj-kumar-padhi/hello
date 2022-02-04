import 'package:flutter/material.dart';
import 'package:project/Pages/api.dart';
import 'package:project/Pages/csr.dart';
import 'package:project/Pages/gidelines.dart';
import 'package:project/Pages/license.dart';
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

final section = [
  Section(GlobalKey(), 'I. Zomato’s philosophy and Vision', reallyLongBody),
  Section(GlobalKey(), 'II. Objectives and Scope of the CSR Policy',
      reallyLongBody),
  Section(
      GlobalKey(), 'III. Implementation of the CSR Activities', reallyLongBody),
  Section(GlobalKey(), 'IV. CSR Expenditure', reallyLongBody),
  Section(GlobalKey(), 'V. Publication', reallyLongBody),
  Section(GlobalKey(), 'VI. Revision History', reallyLongBody),
];

class CsrPage extends StatelessWidget {
  const CsrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: ResponsiveWidget(
            mobile: MobileViewCsrPage(),
            DeskTop: WideScreenCsrPage(),
            Tab: MobileViewCsrPage()),
      );
}
class ApiPage extends StatelessWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: ResponsiveWidget(
            mobile: MobileViewApiPage(),
            DeskTop: WideScreenApiPage(),
            Tab: MobileViewApiPage()),
      );
}
class LicenseRegistrationPage extends StatelessWidget {
  const LicenseRegistrationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: ResponsiveWidget(
            mobile: MobileViewLicensePage(),
            DeskTop: WideScreenLicensePage(),
            Tab: MobileViewLicensePage()),
      );
}
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



