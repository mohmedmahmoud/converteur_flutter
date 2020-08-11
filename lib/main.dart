import "package:flutter/material.dart";

main()=>runApp(converteur());


class converteur extends StatefulWidget {
  converteur({Key key}) : super(key: key);

  @override
  _converteurState createState() => _converteurState();
}

class _converteurState extends State<converteur> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title:Text("Converteur",),
           centerTitle: true,
         ),
         body: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
            
           Expanded(
       
                        child: Column(
               children: <Widget>[
                 Text("OUGIYA"),
                 TextField(
                   decoration:InputDecoration(
                      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),

                   ),
                 )
               ],
             ),
           ),
            SizedBox(
               width: 20,
             ),
             Expanded(
           
                        child: Column(
               children: <Widget>[
                 Text("DOLLAR"),
                 TextField(
                   decoration:InputDecoration(
                      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),

                   ),
                 )
               ],
             ),
           ),
           ],
         ),
       ),
    );
  }
}