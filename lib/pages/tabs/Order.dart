import 'package:flutter/material.dart';
import '../../api/Index.dart';

import '../views/order/info.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  _listOrder() async {
    var res = await get('/order/list');
    return res;
  }

  Widget _buildOrderListWidget(data) {
    List<Widget> list = [];
    for (var item in data) {
      var column = Column(
        children: <Widget>[
          ListTile(title: Text('技师姓名：' + item['techName'])),
          Divider(),
          ListTile(title: Text('项目名称：' + item['projectsName'])),
          ListTile(title: Text('下单时间：' + item['addTime'])),
          ListTile(title: Text('实付金额：' + item['payPrice'].toString())),
        ],
      );
      list.add(InkWell(
          child: Card(
            margin: EdgeInsets.all(10.0),
            child: column,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderInfoPage(
                      arguments: item['orderId'] ?? item['orderId'].toString() ?? '',
                    )));
          }));
    }
    return ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._listOrder(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return Text('');
        } else {
          return this._buildOrderListWidget(snapshot.data);
        }
      },
    );
  }
}
