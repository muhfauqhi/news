import 'package:flutter/material.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: Consumer<HomeProvider>(builder: (context, home, _) {
          return RefreshIndicator(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://awsimages.detik.net.id/visual/2020/06/21/gerhana-matahari-parsial-di-beijing_169.jpeg?w=650',
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.25,
                        child: Text(
                          'Ada Ancaman Kiamat Internet di Bumi, Bisakah Dicegah? - CNBC Indonesia',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.25,
                        child: Text(
                          'peneliti Universitas California Sangeetha Abdu Jyothi mengungkap akan adanya ancaman kiamat internet. Bisakah dicegah?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                // Expanded(
                //   child: ListView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     itemCount: 2,
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         leading: Image(
                //           image: NetworkImage(
                //               'https://awsimages.detik.net.id/visual/2020/06/21/gerhana-matahari-parsial-di-beijing_169.jpeg?w=650'),
                //         ),
                //         title: Text(''),
                //         subtitle: Text(''),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
            onRefresh: home.refresh,
          );
        }),
      ),
    );
  }
}
