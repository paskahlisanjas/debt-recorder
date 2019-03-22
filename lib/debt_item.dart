import 'package:flutter/material.dart';

class DebtItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DebtItemState();
}

class DebtItemState extends State<DebtItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Debt Item'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: bodyContents(),
    );
  }

  List<Widget> bodyContents() {
    return [
      Stack(
        children: <Widget>[
          overlappingStatus(),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: debtItemStatus(),
          )
        ],
      ),
      Expanded(
        child: ListView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: buildDebtUnit(),
        ),
      ),
      Container(
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
        child: MaterialButton(
          minWidth: double.infinity,
          child: Text(
            'New record',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
          color: Colors.blue,
        ),
      )
    ];
  }

  Widget overlappingStatus() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.blue,
        ),
        Container(
          height: 60,
          width: double.infinity,
        )
      ],
    );
  }

  Widget debtItemStatus() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Receivables',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Rp 12.000')
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Debts',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Rp 12.000')
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildDebtUnit() {
    // return [1, 2, 3, 4, 5].map((num) => debtUnit()).toList();
    return [
      debtUnit(),
      debtUnit(),
      debtUnit(),
    ];
  }

  Widget debtUnit() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Center(
                child: Text(
              'title',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Nominal',
                  style: TextStyle(),
                ),
                Text('Rp 12.000')
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Date',
                  style: TextStyle(),
                ),
                Text('2 Aug 2019')
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: Colors.red[300], fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                FlatButton(
                  child: Text('Edit',
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold)),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
