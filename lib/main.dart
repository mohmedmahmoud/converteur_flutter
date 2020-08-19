import "package:flutter/material.dart";

main() => runApp(home());

class home extends StatelessWidget {
  const home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: converteur(),
      ),
    );
  }
}

class converteur extends StatefulWidget {
  converteur({Key key}) : super(key: key);

  @override
  _converteurState createState() => _converteurState();
}

class _converteurState extends State<converteur> {
  double ougiya = 0.0, dollar = 0.0;
  // double Euro = 44.8389;
  // double Derhem = 4.09632;
  bool isDollar = true;
  var dController = TextEditingController();
  var oController = TextEditingController();
  var drawer = ["Dollar", "Euro", "Derhem"];
  var d = "Dollar";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dController.addListener(FOugiya());
    //oController.addListener(FDollar());
  }

  FDollar() {
    setState(() {
      dollar = double.parse(dController.text);
      ougiya = Convert(dollar, d);
      if (isDollar) oController.text = ougiya.toString();
    });
  }

  // FOugiya() {
  //   ougiya = double.parse(oController.text);
  //   dollar = Convert(ougiya, d);
  //   if (isDollar) dController.text = dollar.toString();
  // }

  // double Convert(double variable, bool isDol) {
  //   return isDol ? (variable / 370.56) : (variable * 370.56);
  // }
  double Convert(double variable, String d) {
    if (d == "Dollar") {
      return (variable * 37.56);
    } else if (d == "Euro") {
      return (variable * 44.8389);
    } else {
      return (variable * 4.09632);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Converteur",
        ),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  // Text(
                  //   "DOLLAR",
                  //   style: TextStyle(
                  //     color: Colors.blueAccent,
                  //     fontSize: 30,
                  //   ),
                  // ),
                  DropdownButton(
                      style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                      items: drawer.map((item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      value: d,
                      onChanged: (newValue) {
                        setState(() {
                          d = newValue;
                        });
                      }),
                  TextField(
                    controller: dController,
                    onChanged: (txt) {
                      setState(() {
                        FDollar();
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Ougiya",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: oController,
                    onSubmitted: (text) {
                      setState(() {
                        FDollar();
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixText: "UM",
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
          ],
        ),
        SizedBox(
          height: 30,
        ),
        // InkWell()
      ]),
    );
  }
}
