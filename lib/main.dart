
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'App Convert'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  bool val=true;
 double ougiya=0.0,dollar=0.0;
 bool isDollar;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Column(
           
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value){
                setState(() {
                 
                    dollar=double.parse(value); 
               
                 
                });
                },
                decoration: InputDecoration(
                          errorText: (dollar==0.0) ? 'Please!': null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),

                  
                icon: Icon(Icons.attach_money,),
                hintText: "DOLLAR",
                labelText: val? "vous avez entrer $dollar dollor":"vous avez entrer $dollar ougiya"
                ),
               textAlign: TextAlign.center, 
               scrollPadding: EdgeInsets.all(0.6),  
               keyboardType:TextInputType.number,
              )
            , Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
                Text("dollar"),
                Radio(value: true, groupValue: val, onChanged: (newvalue){
                setState(() {
                 val=newvalue; 
                });
                },
                ),
                   ],
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text("ougiya"),
                  Radio(value: false, groupValue: val, onChanged: (newvalue){
                   setState(() {
                 val=newvalue; 
                });
                },
                ),
              ],
             ),
             RaisedButton(onPressed: (){
              val ? (dollar=dollar*37.57 ):(dollar=dollar/37.57);
              showDialog(context: context, builder: (context)=>(AlertDialog( title:Text("CONVERTEUR"),
              content: Text("$dollar",style: TextStyle(fontSize:60 ),),)));
             },
             color: Colors.blue,
             hoverColor: Colors.blueAccent,
             child: Text("Converter ",style: TextStyle(color: Colors.white,fontSize: 20),),
             
             )
            ],
          ),
        ),
      ),
     
    );
  }
}
