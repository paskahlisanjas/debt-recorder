import 'package:debt_recorder/debt_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Raleway'),
    home: DebtRecorder()));

class DebtRecorder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DebtRecorderState();
}

class DebtRecorderState extends State<DebtRecorder> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.white10,
        title: Text('Debt Recorder', style: TextStyle(color: Colors.black87)),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Total',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            SizedBox(height: 10),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Receivables',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp 12.000',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Debts',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp 12.000',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                primary: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  buildDebtItem('Anjas', 32000, 24000),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 40,
                color: Colors.blue,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDebtItem(String name, int receivables, int debts) {
    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DebtItem()));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Receivables',
                    style: TextStyle(color: Colors.green[200], fontSize: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Rp',
                        style: TextStyle(color: Colors.black26, fontSize: 10),
                      ),
                      SizedBox(width: 5),
                      Text(
                        receivables.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[300],
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    'Debts',
                    style: TextStyle(color: Colors.red[100], fontSize: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Rp',
                        style: TextStyle(color: Colors.black26, fontSize: 10),
                      ),
                      SizedBox(width: 5),
                      Text(
                        debts.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[200],
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Divider(),
                  Text('Someone',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold))
                ],
              )),
        ));
  }
}
