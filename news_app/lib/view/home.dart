import 'package:flutter/material.dart';
import 'package:news_app/view_model/artlist_veiw_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
           await Provider.of<ArtListVeiwModel>(context,listen: false).fetchArt();
           print(Provider.of<ArtListVeiwModel>(context,listen: false).artList);
          },
          child: Text('ppppppppp'),
        ),
      ),
    );
  }
}
