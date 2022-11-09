import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../Models/EModel/ModItemQuery.dart';
import '../ClassModules/cmGlobalVariables.dart';

class GroupListViewDemo extends StatefulWidget {
  @override
  _GroupListViewDemoState createState() => _GroupListViewDemoState();
}

class _GroupListViewDemoState extends State<GroupListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grouped ListView'),
      ),
      body: GroupedListView<ModItemQuery, String>(
        elements: cmGlobalVariables.l_list_ItemQuery,
        groupBy: (elements) {
          //cmGlobalVariables.l_list_ItemQuery[0].Pr_GroupID;

          return cmGlobalVariables.l_list_ItemQuery[0].Pr_GroupID;
        },
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) => cmGlobalVariables
            .l_list_ItemQuery[0].Pr_ItemID
            .compareTo(cmGlobalVariables.l_list_ItemQuery[0].Pr_ItemID),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  //leading: Icon(Icons.account_circle),
                  title: Text(
                    cmGlobalVariables.l_list_ItemQuery[0].Pr_ItemID,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle:
                      Text(cmGlobalVariables.l_list_ItemQuery[0].Pr_ItemDescr),
                  trailing: Text(
                    cmGlobalVariables.l_list_ItemQuery[0].Pr_DescrForSale,
                    style: TextStyle(fontSize: 16),
                  )),
            ),
          );
        },
      ),
    );
  }
}
