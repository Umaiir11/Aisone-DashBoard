import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModTaxQuery.dart';

class SlETaxQuery {
  Future<List<ModTaxQuery>?> Fnc_TaxQuery() async {
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
          .Fnc_HttpResponseERPBoth('/taxQuery/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  ModTaxQuery Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    ModTaxQuery l_ModTaxQuery = new ModTaxQuery();

    l_ModTaxQuery.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    l_ModTaxQuery.Pr_TaxID = l_JsonObject["pr_TaxID"];
    lat: l_ModTaxQuery.Pr_TaxPer = l_JsonObject["pr_TaxPer"].toDouble();
    l_ModTaxQuery.Pr_BeforeDisc = l_JsonObject["pr_BeforeDisc"];
    l_ModTaxQuery.Pr_TaxDepartmentDID = l_JsonObject["pr_TaxDepartmentDID"];
    l_ModTaxQuery.Pr_TaxDepartmentID = l_JsonObject["pr_TaxDepartmentID"];
    l_ModTaxQuery.Pr_Descr = l_JsonObject["pr_Descr"];
    l_ModTaxQuery.Pr_BranchID = l_JsonObject["pr_BranchID"];
    return l_ModTaxQuery;
  }

  List<ModTaxQuery> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<ModTaxQuery> l_ListModTaxQuery = new List<ModTaxQuery>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      ModTaxQuery l_ModTaxQuery = new ModTaxQuery();
      l_ModTaxQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModTaxQuery.add(l_ModTaxQuery);
    }
    return l_ListModTaxQuery;
  }
}
