import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exploring UI widgets",
      home: Scaffold(
        appBar: AppBar(title: Text("Basic List View")),
        body: getLongListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("FAB Clicked");
          },
          child: Icon(Icons.add),
          tooltip: 'Add One More Item',
        ),
      ),
    )
  );
}

void showSnackBar(BuildContext context, String items) {
  var snackBar = SnackBar(
      content: Text("You just tapped $items"),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          debugPrint('Performing dummy operations');
        },
      ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
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
            showSnackBar(context, listItems[index]);
          },
        );
      }
  );

  return listView;
}