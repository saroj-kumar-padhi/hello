
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TextReader extends StatefulWidget {
  const TextReader(String textPath, {Key? key}) : super(key: key);

  String get textPath => 'lib/assets/text/privacy.txt';



  @override
  _TextReaderState createState() => _TextReaderState();
}

class _TextReaderState extends State<TextReader> {
  String textPath = '';

  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString(widget.textPath);
    setState(() {
      textPath= responseText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),

          child: Expanded(
            child:
            Column(
              children:[
                //ListView(
               // shrinkWrap: true,
               //physics: const NeverScrollableScrollPhysics(),

                Text(
                      textPath,
                      style:const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
           //  ], ),
         // ],),
         // ),
        //),
     // )
     // )
    //);




               // Flexible(
               //  flex: 3,
               //
               //  child: GridView(children: [
               //    Container(
               //      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),
               //        color: Colors.white,),
               //      child: Column(
               //        children: const [
               //          Text('Previous',style: TextStyle(fontWeight: FontWeight.normal,
               //              fontSize: 11),),
               //          Text(" << Guidelines and Policies ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
               //        ],
               //      ),
               //
               //
               //    ),
               //    Container(
               //      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),
               //        color: Colors.white,),
               //      child: Column(
               //        children: const [
               //          Text('Next',style: TextStyle(fontWeight: FontWeight.normal,
               //              fontSize: 11),),
               //          Text("Terms and Service >>  ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
               //        ],
               //      ),
               //
               //    ),
               //  ],
               //
               //    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
               //      crossAxisCount: 2,
               //      crossAxisSpacing: 5,


            ]  ) ,
            ),),

    )


       );


  }
}
