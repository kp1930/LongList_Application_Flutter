import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exploring UI widgets",
      home: Scaffold(
        appBar: AppBar(title: Text("Basic List View")),
        body: getLongListView(),
      ),
    )
  );
}

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getLongListView() {
  var listItems = getListElements();
  var listView = ListView.builder(
    itemCount: listItems.length,
    itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text(listItems[index]),
          onTap: () {
            debugPrint('${listItems[index]} was tapped');
          },
        );
      }
  );

  return listView;
}