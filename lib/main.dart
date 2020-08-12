import "package:flutter/material.dart";

main() => runApp(home());

class home extends StatelessWidget {
  const home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
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
  bool isDollar = true;
  var dController = TextEditingController();
  var oController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dController.addListener(FOugiya());
    oController.addListener(FDollar());
  }

  FDollar() {
    setState(() {
      dollar = double.parse(dController.text);
      ougiya = Convert(dollar, true);
      if (isDollar) oController.text = ougiya.toString();
      isDollar = true;
    });
  }

  FOugiya() {
    ougiya = double.parse(oController.text);
    dollar = Convert(ougiya, false);
    if (!isDollar) dController.text = dollar.toString();
    isDollar = false;
  }

  double Convert(double variable, bool isDol) {
    return isDol ? (variable / 370.56) : (variable * 370.56);
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
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "OUGIYA",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                    ),
                  ),
                  TextField(
                    controller: oController,
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
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "DOLLAR",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                    ),
                  ),
                  TextField(
                    controller: dController,
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
          ],
        ),
      ]),
    );
  }
}
