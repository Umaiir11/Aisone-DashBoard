import 'dart:convert';
import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModItemQuery.dart';

class SlEItemQueryOnline {
  Future<List<ModItemQuery>?> Fnc_ItemQueryOnline() async {
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

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/ItemQuery/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModItemQuery Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModItemQuery l_ModItemQuery = new ModItemQuery();

    l_ModItemQuery.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    l_ModItemQuery.Pr_ItemID = l_JsonObject["pr_ItemID"];
    l_ModItemQuery.Pr_ItemDescr = l_JsonObject["pr_ItemDescr"];
    l_ModItemQuery.Pr_DescrForSale = l_JsonObject["pr_DescrForSale"];
    l_ModItemQuery.Pr_DescrForPurchase = l_JsonObject["pr_DescrForPurchase"];
    l_ModItemQuery.Pr_Abbreviation = l_JsonObject["pr_Abbreviation"];
    l_ModItemQuery.Pr_ItemTypeDID = l_JsonObject["pr_ItemTypeDID"];
    l_ModItemQuery.Pr_ItemType = l_JsonObject["pr_ItemType"];
    l_ModItemQuery.Pr_ItemGroupDID = l_JsonObject["pr_ItemGroupDID"];
    l_ModItemQuery.Pr_GroupID = l_JsonObject["pr_GroupID"];
    l_ModItemQuery.Pr_ItemSubGroupDID = l_JsonObject["pr_ItemSubGroupDID"];
    l_ModItemQuery.Pr_SubGroupID = l_JsonObject["pr_SubGroupID"];
    l_ModItemQuery.Pr_ActiveID = l_JsonObject["pr_ActiveID"];
    l_ModItemQuery.Pr_UOMGroupDID = l_JsonObject["pr_UOMGroupDID"];
    l_ModItemQuery.Pr_UOMGroupID = l_JsonObject["pr_UOMGroupID"];
    l_ModItemQuery.Pr_ItemManagementDID = l_JsonObject["pr_ItemManagementDID"];
    l_ModItemQuery.Pr_ItemManagementID = l_JsonObject["pr_ItemManagementID"];
    l_ModItemQuery.Pr_DefaultUOMDID = l_JsonObject["pr_DefaultUOMDID"];
    l_ModItemQuery.Pr_DefaultUOMID = l_JsonObject["pr_DefaultUOMID"];
    l_ModItemQuery.Pr_ItemIsSold = l_JsonObject["pr_ItemIsSold"];
    l_ModItemQuery.Pr_ItemIsPurchased = l_JsonObject["pr_ItemIsPurchased"];
    l_ModItemQuery.Pr_CostingMethodDID = l_JsonObject["pr_CostingMethodDID"];
    l_ModItemQuery.Pr_CostingMethodID = l_JsonObject["pr_CostingMethodID"];
    l_ModItemQuery.Pr_PackingDoneByVendor =
    l_JsonObject["pr_PackingDoneByVendor"];
    lat:
    l_ModItemQuery.Pr_Height = l_JsonObject["pr_Height"].toDouble();
    lat:
    l_ModItemQuery.Pr_Width = l_JsonObject["pr_Width"].toDouble();
    lat:
    l_ModItemQuery.Pr_Length = l_JsonObject["pr_Length"].toDouble();
    l_ModItemQuery.Pr_Weight = l_JsonObject["pr_Weight"].toDouble();
    l_ModItemQuery.Pr_Volume = l_JsonObject["pr_Volume"].toDouble();
    l_ModItemQuery.Pr_Volumetric = l_JsonObject["pr_Volumetric"].toDouble();
    l_ModItemQuery.Pr_MinStock = l_JsonObject["pr_MinStock"].toDouble();
    l_ModItemQuery.Pr_MaxStock = l_JsonObject["pr_MaxStock"].toDouble();
    l_ModItemQuery.Pr_ReorderLevel = l_JsonObject["pr_ReorderLevel"].toDouble();
    l_ModItemQuery.Pr_DefaultStockLocationDID =
    l_JsonObject["pr_DefaultStockLocationDID"];
    l_ModItemQuery.Pr_DefaultStockLocationID =
    l_JsonObject["pr_DefaultStockLocationID"];
    l_ModItemQuery.Pr_SalesUOMDID = l_JsonObject["pr_SalesUOMDID"];
    l_ModItemQuery.Pr_SalesUOMID = l_JsonObject["pr_SalesUOMID"];
    l_ModItemQuery.Pr_SaleRepresentativeDID =
    l_JsonObject["pr_SaleRepresentativeDID"];
    l_ModItemQuery.Pr_SaleRepresentativeID =
    l_JsonObject["pr_SaleRepresentativeID"];
    l_ModItemQuery.Pr_Taxable = l_JsonObject["pr_Taxable"];
    l_ModItemQuery.Pr_TaxDID = l_JsonObject["pr_TaxDID"];
    l_ModItemQuery.Pr_TaxID = l_JsonObject["pr_TaxID"].toDouble();
    l_ModItemQuery.Pr_TaxationCode = l_JsonObject["pr_TaxationCode"];
    l_ModItemQuery.Pr_PurchaseUOMDID = l_JsonObject["pr_PurchaseUOMDID"];
    l_ModItemQuery.Pr_PurchaseUOMID = l_JsonObject["pr_PurchaseUOMID"];
    l_ModItemQuery.Pr_VendorItemNo = l_JsonObject["pr_VendorItemNo"];
    l_ModItemQuery.Pr_PurchaseRepresentativeDID =
    l_JsonObject["pr_PurchaseRepresentativeDID"];
    l_ModItemQuery.Pr_PurchaseRepresentativeID =
    l_JsonObject["pr_PurchaseRepresentativeID"];
    l_ModItemQuery.Pr_List1 = l_JsonObject["pr_List1"];
    l_ModItemQuery.Pr_List2 = l_JsonObject["pr_List2"];
    l_ModItemQuery.Pr_List3 = l_JsonObject["pr_List3"];
    l_ModItemQuery.Pr_List4 = l_JsonObject["pr_List4"];
    l_ModItemQuery.Pr_List5 = l_JsonObject["pr_List5"];
    l_ModItemQuery.Pr_List6 = l_JsonObject["pr_List6"];
    l_ModItemQuery.Pr_List7 = l_JsonObject["pr_List7"];
    l_ModItemQuery.Pr_List8 = l_JsonObject["pr_List8"];
    l_ModItemQuery.Pr_List9 = l_JsonObject["pr_List9"];
    l_ModItemQuery.Pr_List10 = l_JsonObject["pr_List10"];
    l_ModItemQuery.Pr_String1 = l_JsonObject["pr_String1"];
    l_ModItemQuery.Pr_String2 = l_JsonObject["pr_String2"];
    l_ModItemQuery.Pr_String3 = l_JsonObject["pr_String3"];
    l_ModItemQuery.Pr_String4 = l_JsonObject["pr_String4"];
    l_ModItemQuery.Pr_String5 = l_JsonObject["pr_String5"];
    l_ModItemQuery.Pr_String6 = l_JsonObject["pr_String6"];
    l_ModItemQuery.Pr_String7 = l_JsonObject["pr_String7"];
    l_ModItemQuery.Pr_String8 = l_JsonObject["pr_String8"];
    l_ModItemQuery.Pr_String9 = l_JsonObject["pr_String9"];
    l_ModItemQuery.Pr_String10 = l_JsonObject["pr_String10"];
    l_ModItemQuery.Pr_Decimal1 = l_JsonObject["pr_Decimal1"].toDouble();
    l_ModItemQuery.Pr_Decimal2 = l_JsonObject["pr_Decimal2"].toDouble();
    l_ModItemQuery.Pr_Decimal3 = l_JsonObject["pr_Decimal3"].toDouble();
    l_ModItemQuery.Pr_Decimal4 = l_JsonObject["pr_Decimal4"].toDouble();
    l_ModItemQuery.Pr_Decimal5 = l_JsonObject["pr_Decimal5"].toDouble();
    l_ModItemQuery.Pr_Decimal6 = l_JsonObject["pr_Decimal6"].toDouble();
    l_ModItemQuery.Pr_Decimal7 = l_JsonObject["pr_Decimal7"].toDouble();
    l_ModItemQuery.Pr_Decimal8 = l_JsonObject["pr_Decimal8"].toDouble();
    l_ModItemQuery.Pr_Decimal9 = l_JsonObject["pr_Decimal9"].toDouble();
    l_ModItemQuery.Pr_Decimal10 = l_JsonObject["pr_Decimal10"].toDouble();
    l_ModItemQuery.Pr_Integer1 = l_JsonObject["pr_Integer1"];
    l_ModItemQuery.Pr_Integer2 = l_JsonObject["pr_Integer2"];
    l_ModItemQuery.Pr_Integer3 = l_JsonObject["pr_Integer3"];
    l_ModItemQuery.Pr_Integer4 = l_JsonObject["pr_Integer4"];
    l_ModItemQuery.Pr_Integer5 = l_JsonObject["pr_Integer5"];
    l_ModItemQuery.Pr_Integer6 = l_JsonObject["pr_Integer6"];
    l_ModItemQuery.Pr_Integer7 = l_JsonObject["pr_Integer7"];
    l_ModItemQuery.Pr_Integer8 = l_JsonObject["pr_Integer8"];
    l_ModItemQuery.Pr_Integer9 = l_JsonObject["pr_Integer9"];
    l_ModItemQuery.Pr_Integer10 = l_JsonObject["pr_Integer10"];
    l_ModItemQuery.Pr_DateTime1 = DateTime.parse(l_JsonObject['pr_DateTime1']);
    l_ModItemQuery.Pr_DateTime2 = DateTime.parse(l_JsonObject['pr_DateTime2']);
    l_ModItemQuery.Pr_DateTime3 = DateTime.parse(l_JsonObject['pr_DateTime3']);
    l_ModItemQuery.Pr_DateTime4 = DateTime.parse(l_JsonObject['pr_DateTime4']);
    l_ModItemQuery.Pr_DateTime5 = DateTime.parse(l_JsonObject['pr_DateTime5']);
    l_ModItemQuery.Pr_DateTime6 = DateTime.parse(l_JsonObject['pr_DateTime6']);
    l_ModItemQuery.Pr_DateTime7 = DateTime.parse(l_JsonObject['pr_DateTime7']);
    l_ModItemQuery.Pr_DateTime8 = DateTime.parse(l_JsonObject['pr_DateTime8']);
    l_ModItemQuery.Pr_DateTime9 = DateTime.parse(l_JsonObject['pr_DateTime9']);
    l_ModItemQuery.Pr_DateTime10 = DateTime.parse(l_JsonObject['pr_DateTime10']);
    l_ModItemQuery.Pr_Boolean1 = l_JsonObject["pr_Boolean1"];
    l_ModItemQuery.Pr_Boolean2 = l_JsonObject["pr_Boolean2"];
    l_ModItemQuery.Pr_Boolean3 = l_JsonObject["pr_Boolean3"];
    l_ModItemQuery.Pr_Boolean4 = l_JsonObject["pr_Boolean4"];
    l_ModItemQuery.Pr_Boolean5 = l_JsonObject["pr_Boolean5"];
    l_ModItemQuery.Pr_Boolean6 = l_JsonObject["pr_Boolean6"];
    l_ModItemQuery.Pr_Boolean7 = l_JsonObject["pr_Boolean7"];
    l_ModItemQuery.Pr_Boolean8 = l_JsonObject["pr_Boolean8"];
    l_ModItemQuery.Pr_Boolean9 = l_JsonObject["pr_Boolean9"];
    l_ModItemQuery.Pr_Boolean10 = l_JsonObject["pr_Boolean10"];
    return l_ModItemQuery;
  }

  List<ModItemQuery> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModItemQuery> l_ListModItemQuery =
    new List<ModItemQuery>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModItemQuery l_ModItemQuery = new ModItemQuery();
      l_ModItemQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModItemQuery.add(l_ModItemQuery);
    }
    return l_ListModItemQuery;


  }





}