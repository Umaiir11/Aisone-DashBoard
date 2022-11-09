import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModPendingSaleOrder.dart';

class SlEPendingSaleOrder {
  Future<List<Mod_PendingSaleOrder>?> Fnc_PendingSaleOrder() async {
    try {

      final body = {
        "Pr_Branchid" : "1"
      };
      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseERPBoth('/RptPendingSaleOrder/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Mod_PendingSaleOrder Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    Mod_PendingSaleOrder l_ModI_PendingSaleOrder = new Mod_PendingSaleOrder();

    l_ModI_PendingSaleOrder.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    l_ModI_PendingSaleOrder.Pr_VNO = l_JsonObject["pr_VNO"];
    l_ModI_PendingSaleOrder.Pr_VoucherNo = l_JsonObject["pr_VoucherNo"];

    l_ModI_PendingSaleOrder.Pr_VDate = DateTime.parse(l_JsonObject["pr_VDate"].toString());
    l_ModI_PendingSaleOrder.Pr_AccountDID = l_JsonObject["pr_AccountDID"];
    l_ModI_PendingSaleOrder.Pr_AccountID = l_JsonObject["pr_AccountID"];
    l_ModI_PendingSaleOrder.Pr_CityID = l_JsonObject["pr_CityID"];
    l_ModI_PendingSaleOrder.Pr_CustomerRefNo = l_JsonObject["pr_CustomerRefNo"];
    l_ModI_PendingSaleOrder.Pr_RefNo = l_JsonObject["pr_RefNo"];
    l_ModI_PendingSaleOrder.Pr_Remarks = l_JsonObject["pr_Remarks"];
    lat: l_ModI_PendingSaleOrder.Pr_FGrandTotal = l_JsonObject["pr_FGrandTotal"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_CGrandTotal = l_JsonObject["pr_CGrandTotal"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_FExportableAmount = l_JsonObject["pr_FExportableAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_CExportableAmount = l_JsonObject["pr_CExportableAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_FPendingAmount = l_JsonObject["pr_FPendingAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_CPendingAmount = l_JsonObject["pr_CPendingAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_PQty = l_JsonObject["pr_PQty"].toDouble();
    l_ModI_PendingSaleOrder.Pr_StageID = l_JsonObject["pr_StageID"];
    l_ModI_PendingSaleOrder.Pr_BranchID = l_JsonObject["pr_BranchID"];
    return l_ModI_PendingSaleOrder;
  }

  List<Mod_PendingSaleOrder> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<Mod_PendingSaleOrder> l_ListModI_PendingSaleOrder = new List<Mod_PendingSaleOrder>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      Mod_PendingSaleOrder l_ModI_PendingSaleOrder = new Mod_PendingSaleOrder();
      l_ModI_PendingSaleOrder = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_PendingSaleOrder.add(l_ModI_PendingSaleOrder);
    }
    return l_ListModI_PendingSaleOrder;
  }

}
