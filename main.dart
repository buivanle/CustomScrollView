import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Messenger'),
            floating: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://example.com/messenger_banner.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://example.com/avatar.jpg',
                      ),
                    ),
                    title: Text('User $index'),
                    subtitle: Text('Message $index'),
                    onTap: () {
                      // Handle item tap
                    },
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
