import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModCustomerQuery.dart';
import '../../Models/EModel/ModLocationQuery.dart';
import '../../Models/EModel/ModUomSelectionQuery.dart';

class SLELocationQuery {
  Future<List<ModLocationQuery>?> Fnc_LocationQuery() async {
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
          .Fnc_HttpResponseERPBoth('/locationQuery/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModLocationQuery Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    ModLocationQuery l_ModLocationQuery = new ModLocationQuery();

    l_ModLocationQuery.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    l_ModLocationQuery.Pr_LocationID = l_JsonObject["pr_LocationID"];
    l_ModLocationQuery.Pr_Abbreviation = l_JsonObject["pr_Abbreviation"];
    l_ModLocationQuery.Pr_LocationName = l_JsonObject["pr_LocationName"];
    l_ModLocationQuery.Pr_IsSalePoint = l_JsonObject["pr_IsSalePoint"];
    l_ModLocationQuery.Pr_LocationManager = l_JsonObject["pr_LocationManager"];
    l_ModLocationQuery.Pr_Descr = l_JsonObject["pr_Descr"];
    l_ModLocationQuery.Pr_Region = l_JsonObject["pr_Region"];
    l_ModLocationQuery.Pr_CityDID = l_JsonObject["pr_CityDID"];
    l_ModLocationQuery.Pr_CityID = l_JsonObject["pr_CityID"];
    l_ModLocationQuery.Pr_Address = l_JsonObject["pr_Address"];
    l_ModLocationQuery.Pr_PhoneNumber = l_JsonObject["pr_PhoneNumber"];
    l_ModLocationQuery.Pr_FaxNumber = l_JsonObject["pr_FaxNumber"];
    l_ModLocationQuery.Pr_EmailAddress = l_JsonObject["pr_EmailAddress"];
    l_ModLocationQuery.Pr_FixedID = l_JsonObject["pr_FixedID"];
    l_ModLocationQuery.Pr_BranchID = l_JsonObject["pr_BranchID"];
    return l_ModLocationQuery;
  }

  List<ModLocationQuery> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<ModLocationQuery> l_ListModLocationQuery = new List<ModLocationQuery>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      ModLocationQuery l_ModLocationQuery = new ModLocationQuery();
      l_ModLocationQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModLocationQuery.add(l_ModLocationQuery);
    }
    return l_ListModLocationQuery;
  }
}
