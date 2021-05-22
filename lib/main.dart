import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:stopwatch_flutter/provider/lap_provider.dart';
import 'package:stopwatch_flutter/ui/stopwatch.dart';

import 'ui/laplist_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LapProvider(),
        child: Consumer<LapProvider>(
          builder: (context, themeProvider, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark()
                .copyWith(scaffoldBackgroundColor: Colors.black),
            home: MyHomePage(),
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //changes the upper system colors of the phone like battery and time
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: Stopwatch(),
              ),
              Consumer<LapProvider>(
                builder: (context, lapProvider, child) =>
                    Expanded(child: _buildListView(lapProvider)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView(LapProvider lapProvider) {
    return SingleChildScrollView(
      child: ListView.separated(
        reverse: true,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: lapProvider.lapList.length,
        itemBuilder: (BuildContext context, int index) {
          return LapListTile(
            index: index,
            lapTime: lapProvider.lapList[index],
          );
        },
      ),
    );
  }
}
