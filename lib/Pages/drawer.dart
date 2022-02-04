import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class NavDrawer extends StatelessWidget {
  NavDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Flexible(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
           
            ListItems('General'),
            ListItems('Online Ordering'),
            ListItems('Zamato Pay'),
            ListItems('Languages'),

          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  String name;
  // final IconData next;
  var text;
  ListItems(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Icon(next),
      title: Text(name, style: TextStyle(color: Colors.grey, fontSize: 25),),
      onTap: () => {},
    );
  }
}

class PujaPurohitHeader extends StatelessWidget {
  final String text;
  PujaPurohitHeader(this.text);
  

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: Colors.redAccent,
        fontSize: 30,
      ),
    );
  }
}