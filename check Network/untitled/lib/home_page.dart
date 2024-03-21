import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Internet Connection'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            print(snapshot.toString());
            if (snapshot.hasData) {
              ConnectivityResult? result = snapshot.data;
              if (result == ConnectivityResult.mobile) {
                return Connected('mobile');
              } else if (result == ConnectivityResult.wifi) {
                return Connected('wifi');
              } else {
                return noInternet();
              }
            } else {
              return loading();
            }
          },
        ),
      ),
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  Widget Connected(String type) {
    return Center(
      child: Text(
        '$type connected',
        style: TextStyle(color: Colors.green, fontSize: 20),
      ),
    );
  }

  Widget noInternet() {
    return Column(
      children: [
        Icon(
          Icons.signal_wifi_connected_no_internet_4,
          size: 100,
          color: Colors.red,
        ),
        SizedBox(
          height: 20,
        ),
        Text('no internet connection'),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            ConnectivityResult result = await Connectivity().checkConnectivity();
            print(result.toString());
          },
          child: Text('Refresh'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        ),
      ],
    );
  }
}
