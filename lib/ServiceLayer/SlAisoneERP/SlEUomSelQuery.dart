import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModCustomerQuery.dart';
import '../../Models/EModel/ModUomSelectionQuery.dart';

class SlEUomSelectionQuery {
  Future<List<ModUOMSelectionQuery>?> Fnc_UomQuery() async {
    try {
      //" Where UserDID = '" & Pb_UserDID.ToString & "' and IsAssigned = 1"

      final body = {
        "Pr_Branchid": "1",
        "Pr_WhereClause": "",
        "Pr_GroupByClause": "",
        "Pr_OrderByClause": ""
      };
      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseERPBoth('/UOMSelectionQuery/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModUOMSelectionQuery Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    ModUOMSelectionQuery l_ModUOMSelectionQuery = new ModUOMSelectionQuery();

    l_ModUOMSelectionQuery.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    lat: l_ModUOMSelectionQuery.Pr_AlternateQty = l_JsonObject["pr_AlternateQty"].toDouble();
    l_ModUOMSelectionQuery.Pr_UOMID = l_JsonObject["pr_UOMID"];
    lat: l_ModUOMSelectionQuery.Pr_BaseQty = l_JsonObject["pr_BaseQty"].toDouble();
    l_ModUOMSelectionQuery.Pr_BaseUOMID = l_JsonObject["pr_BaseUOMID"];
    l_ModUOMSelectionQuery.Pr_BaseUOMDID = l_JsonObject["pr_BaseUOMDID"];
    l_ModUOMSelectionQuery.Pr_UOMGroupDID = l_JsonObject["pr_UOMGroupDID"];
    l_ModUOMSelectionQuery.Pr_UOMGroupID = l_JsonObject["pr_UOMGroupID"];
    l_ModUOMSelectionQuery.Pr_BranchID = l_JsonObject["pr_BranchID"];
    return l_ModUOMSelectionQuery;
  }

  List<ModUOMSelectionQuery> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<ModUOMSelectionQuery> l_ListModUOMSelectionQuery = new List<ModUOMSelectionQuery>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      ModUOMSelectionQuery l_ModUOMSelectionQuery = new ModUOMSelectionQuery();
      l_ModUOMSelectionQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModUOMSelectionQuery.add(l_ModUOMSelectionQuery);
    }
    return l_ListModUOMSelectionQuery;
  }
}
