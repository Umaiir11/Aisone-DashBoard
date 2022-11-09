import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModSaleInvoiceList.dart';
import '../../Models/EModel/ModSaleInvoiceListCht.dart';
import '../../Models/EModel/ModTaxQuery.dart';

class SlESaleInvoiceListCht {
  Future<List<ModSaleInvoiceList>?> Fnc_SaleInvoiceListcht() async {
    try {
      //" Where UserDID = '" & Pb_UserDID.ToString & "' and IsAssigned = 1"

      final body = {

        "Pr_FromDate" :"2001-01-01",
        "Pr_ToDate":"2030-01-01",
        "Pr_Branchid" : "1"
      };
      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseERPBoth('/ChtSaleInvoiceList/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModSaleInvoiceList Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModSaleInvoiceList l_ModSaleInvoiceList = new ModSaleInvoiceList();

    l_ModSaleInvoiceList.Pr_VDate = DateTime.parse(l_JsonObject["pr_VDate"]);
    lat:
    l_ModSaleInvoiceList.Pr_CGrandTotal =
        l_JsonObject["pr_CGrandTotal"].toDouble();
    return l_ModSaleInvoiceList;
  }

  List<ModSaleInvoiceList> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModSaleInvoiceList> l_ListModSaleInvoiceList =
    new List<ModSaleInvoiceList>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModSaleInvoiceList l_ModSaleInvoiceList = new ModSaleInvoiceList();
      l_ModSaleInvoiceList = Fnc_JsonToModel(l_JsonObject);
      l_ListModSaleInvoiceList.add(l_ModSaleInvoiceList);
    }
    return l_ListModSaleInvoiceList;
  }


}
