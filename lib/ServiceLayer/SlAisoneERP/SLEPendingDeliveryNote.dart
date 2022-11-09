import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModPendingDeliveryNote.dart';

class SlEPendingDeliveryNote {
  Future<List<Mod_PendingDeliveryNote>?> Fnc_PendingDeliveryNote() async {
    try {

      final body = {
        "Pr_Branchid" : "1"
      };
      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseERPBoth('/RptPendingDeliveryNote/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Mod_PendingDeliveryNote Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    Mod_PendingDeliveryNote l_ModI_PendingDeliveryNote = new Mod_PendingDeliveryNote();

    l_ModI_PendingDeliveryNote.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    l_ModI_PendingDeliveryNote.Pr_VNO = l_JsonObject["pr_VNO"];
    l_ModI_PendingDeliveryNote.Pr_VoucherNo = l_JsonObject["pr_VoucherNo"];
    l_ModI_PendingDeliveryNote.Pr_VDate = DateTime.parse(l_JsonObject["pr_VDate"]);
    l_ModI_PendingDeliveryNote.Pr_AccountDID = l_JsonObject["pr_AccountDID"];
    l_ModI_PendingDeliveryNote.Pr_AccountID = l_JsonObject["pr_AccountID"];
    l_ModI_PendingDeliveryNote.Pr_CityID = l_JsonObject["pr_CityID"];
    l_ModI_PendingDeliveryNote.Pr_CustomerRefNo = l_JsonObject["pr_CustomerRefNo"];
    l_ModI_PendingDeliveryNote.Pr_RefNo = l_JsonObject["pr_RefNo"];
    l_ModI_PendingDeliveryNote.Pr_Remarks = l_JsonObject["pr_Remarks"];
    lat: l_ModI_PendingDeliveryNote.Pr_FGrandTotal = l_JsonObject["pr_FGrandTotal"].toDouble();
    lat: l_ModI_PendingDeliveryNote.Pr_CGrandTotal = l_JsonObject["pr_CGrandTotal"].toDouble();
    lat: l_ModI_PendingDeliveryNote.Pr_FExportableAmount = l_JsonObject["pr_FExportableAmount"].toDouble();
    lat: l_ModI_PendingDeliveryNote.Pr_CExportableAmount = l_JsonObject["pr_CExportableAmount"].toDouble();
    lat: l_ModI_PendingDeliveryNote.Pr_FPendingAmount = l_JsonObject["pr_FPendingAmount"].toDouble();
    lat: l_ModI_PendingDeliveryNote.Pr_CPendingAmount = l_JsonObject["pr_CPendingAmount"].toDouble();
    lat: l_ModI_PendingDeliveryNote.Pr_PQty = l_JsonObject["pr_PQty"].toDouble();
    l_ModI_PendingDeliveryNote.Pr_StageID = l_JsonObject["pr_StageID"];
    l_ModI_PendingDeliveryNote.Pr_BranchID = l_JsonObject["pr_BranchID"];
    return l_ModI_PendingDeliveryNote;
  }

  List<Mod_PendingDeliveryNote> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<Mod_PendingDeliveryNote> l_ListModI_PendingDeliveryNote = new List<Mod_PendingDeliveryNote>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      Mod_PendingDeliveryNote l_ModI_PendingDeliveryNote = new Mod_PendingDeliveryNote();
      l_ModI_PendingDeliveryNote = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_PendingDeliveryNote.add(l_ModI_PendingDeliveryNote);
    }
    return l_ListModI_PendingDeliveryNote;
  }

}
