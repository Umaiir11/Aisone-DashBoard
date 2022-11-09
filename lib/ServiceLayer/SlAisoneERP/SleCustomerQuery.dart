import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModCustomerQuery.dart';

class SlECustomerQuery {
  Future<List<ModCustomerQuery>?> Fnc_CustomerQuery() async {
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
          .Fnc_HttpResponseERPBoth('/CustomerQuery/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModCustomerQuery Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModCustomerQuery l_ModCustomerQuery = new ModCustomerQuery();

    l_ModCustomerQuery.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    l_ModCustomerQuery.Pr_AccountID = l_JsonObject["pr_AccountID"];
    l_ModCustomerQuery.Pr_Abbreviation = l_JsonObject["pr_Abbreviation"];
    l_ModCustomerQuery.Pr_AccountCode = l_JsonObject["pr_AccountCode"];
    l_ModCustomerQuery.Pr_ActiveID = l_JsonObject["pr_ActiveID"];
    l_ModCustomerQuery.Pr_CurrencyDID = l_JsonObject["pr_CurrencyDID"];
    l_ModCustomerQuery.Pr_CurrencyCode = l_JsonObject["pr_CurrencyCode"];
    l_ModCustomerQuery.Pr_CustomerAndVendor =
        l_JsonObject["pr_CustomerAndVendor"];
    l_ModCustomerQuery.Pr_OpeningDate =
        DateTime.parse(l_JsonObject["pr_OpeningDate"]);
    l_ModCustomerQuery.Pr_Descr = l_JsonObject["pr_Descr"];
    l_ModCustomerQuery.Pr_CompanyName = l_JsonObject["pr_CompanyName"];
    l_ModCustomerQuery.Pr_SaleChannelDID = l_JsonObject["pr_SaleChannelDID"];
    l_ModCustomerQuery.Pr_SaleChannelID = l_JsonObject["pr_SaleChannelID"];
    l_ModCustomerQuery.Pr_CustomerTypeDID = l_JsonObject["pr_CustomerTypeDID"];
    l_ModCustomerQuery.Pr_CustomerTypeID = l_JsonObject["pr_CustomerTypeID"];
    l_ModCustomerQuery.Pr_CarrierDID = l_JsonObject["pr_CarrierDID"];
    l_ModCustomerQuery.Pr_CarrierID = l_JsonObject["pr_CarrierID"];
    l_ModCustomerQuery.Pr_Telephone1 = l_JsonObject["pr_Telephone1"];
    l_ModCustomerQuery.Pr_Telephone2 = l_JsonObject["pr_Telephone2"];
    l_ModCustomerQuery.Pr_Mobile1 = l_JsonObject["pr_Mobile1"];
    l_ModCustomerQuery.Pr_Mobile2 = l_JsonObject["pr_Mobile2"];
    l_ModCustomerQuery.Pr_Fax = l_JsonObject["pr_Fax"];
    l_ModCustomerQuery.Pr_Email = l_JsonObject["pr_Email"];
    l_ModCustomerQuery.Pr_Address = l_JsonObject["pr_Address"];
    l_ModCustomerQuery.Pr_Website = l_JsonObject["pr_Website"];
    l_ModCustomerQuery.Pr_AreaDID = l_JsonObject["pr_AreaDID"];
    l_ModCustomerQuery.Pr_AreaID = l_JsonObject["pr_AreaID"];
    l_ModCustomerQuery.Pr_CountryDID = l_JsonObject["pr_CountryDID"];
    l_ModCustomerQuery.Pr_CountryID = l_JsonObject["pr_CountryID"];
    l_ModCustomerQuery.Pr_CityDID = l_JsonObject["pr_CityDID"];
    l_ModCustomerQuery.Pr_CityID = l_JsonObject["pr_CityID"];
    l_ModCustomerQuery.Pr_DistrictDID = l_JsonObject["pr_DistrictDID"];
    l_ModCustomerQuery.Pr_DistrictID = l_JsonObject["pr_DistrictID"];
    l_ModCustomerQuery.Pr_ProvinceDID = l_JsonObject["pr_ProvinceDID"];
    l_ModCustomerQuery.Pr_ProvinceID = l_JsonObject["pr_ProvinceID"];
    l_ModCustomerQuery.Pr_Zip = l_JsonObject["pr_Zip"];
    l_ModCustomerQuery.Pr_ZoneDID = l_JsonObject["pr_ZoneDID"];
    l_ModCustomerQuery.Pr_ZoneID = l_JsonObject["pr_ZoneID"];
    l_ModCustomerQuery.Pr_CreditLimit =
        l_JsonObject["pr_CreditLimit"].toDouble();
    ;
    l_ModCustomerQuery.Pr_CreditLimitStatusDID =
        l_JsonObject["pr_CreditLimitStatusDID"];
    l_ModCustomerQuery.Pr_CreditLimitStatusID =
        l_JsonObject["pr_CreditLimitStatusID"];
    l_ModCustomerQuery.Pr_CreditTermDID = l_JsonObject["pr_CreditTermDID"];
    l_ModCustomerQuery.Pr_CreditTermID = l_JsonObject["pr_CreditTermID"];
    l_ModCustomerQuery.Pr_PaymentDiscountTermDID =
        l_JsonObject["pr_PaymentDiscountTermDID"];
    l_ModCustomerQuery.Pr_PaymentDiscountTermID =
        l_JsonObject["pr_PaymentDiscountTermID"];
    l_ModCustomerQuery.Pr_PaymentMethodDID =
        l_JsonObject["pr_PaymentMethodDID"];
    l_ModCustomerQuery.Pr_PaymentMethodID = l_JsonObject["pr_PaymentMethodID"];
    l_ModCustomerQuery.Pr_SalesRepresentativeDID =
        l_JsonObject["pr_SalesRepresentativeDID"];
    l_ModCustomerQuery.Pr_SalesRepresentativeID =
        l_JsonObject["pr_SalesRepresentativeID"];
    l_ModCustomerQuery.Pr_PriceLevelDID = l_JsonObject["pr_PriceLevelDID"];
    l_ModCustomerQuery.Pr_PriceLevelID = l_JsonObject["pr_PriceLevelID"];
    l_ModCustomerQuery.Pr_SaleDiscountTermDID =
        l_JsonObject["pr_SaleDiscountTermDID"];
    l_ModCustomerQuery.Pr_SaleDiscountTermID =
        l_JsonObject["pr_SaleDiscountTermID"];
    l_ModCustomerQuery.Pr_RefferedByDID = l_JsonObject["pr_RefferedByDID"];
    l_ModCustomerQuery.Pr_RefferedByID = l_JsonObject["pr_RefferedByID"];
    l_ModCustomerQuery.Pr_NTNNo = l_JsonObject["pr_NTNNo"];
    l_ModCustomerQuery.Pr_STNNO = l_JsonObject["pr_STNNO"];
    l_ModCustomerQuery.Pr_CNICNO = l_JsonObject["pr_CNICNO"];
    l_ModCustomerQuery.Pr_FurtherTaxDID = l_JsonObject["pr_FurtherTaxDID"];
    l_ModCustomerQuery.Pr_FurtherTaxID = l_JsonObject["pr_FurtherTaxID"];
    l_ModCustomerQuery.Pr_List1 = l_JsonObject["pr_List1"];
    l_ModCustomerQuery.Pr_List2 = l_JsonObject["pr_List2"];
    l_ModCustomerQuery.Pr_List3 = l_JsonObject["pr_List3"];
    l_ModCustomerQuery.Pr_List4 = l_JsonObject["pr_List4"];
    l_ModCustomerQuery.Pr_List5 = l_JsonObject["pr_List5"];
    l_ModCustomerQuery.Pr_List6 = l_JsonObject["pr_List6"];
    l_ModCustomerQuery.Pr_List7 = l_JsonObject["pr_List7"];
    l_ModCustomerQuery.Pr_List8 = l_JsonObject["pr_List8"];
    l_ModCustomerQuery.Pr_List9 = l_JsonObject["pr_List9"];
    l_ModCustomerQuery.Pr_List10 = l_JsonObject["pr_List10"];
    l_ModCustomerQuery.Pr_String1 = l_JsonObject["pr_String1"];
    l_ModCustomerQuery.Pr_String2 = l_JsonObject["pr_String2"];
    l_ModCustomerQuery.Pr_String3 = l_JsonObject["pr_String3"];
    l_ModCustomerQuery.Pr_String4 = l_JsonObject["pr_String4"];
    l_ModCustomerQuery.Pr_String5 = l_JsonObject["pr_String5"];
    l_ModCustomerQuery.Pr_String6 = l_JsonObject["pr_String6"];
    l_ModCustomerQuery.Pr_String7 = l_JsonObject["pr_String7"];
    l_ModCustomerQuery.Pr_String8 = l_JsonObject["pr_String8"];
    l_ModCustomerQuery.Pr_String9 = l_JsonObject["pr_String9"];
    l_ModCustomerQuery.Pr_String10 = l_JsonObject["pr_String10"];
    l_ModCustomerQuery.Pr_Decimal1 = l_JsonObject["pr_Decimal1"].toDouble();
    l_ModCustomerQuery.Pr_Decimal2 = l_JsonObject["pr_Decimal2"].toDouble();
    l_ModCustomerQuery.Pr_Decimal3 = l_JsonObject["pr_Decimal3"].toDouble();
    l_ModCustomerQuery.Pr_Decimal4 = l_JsonObject["pr_Decimal4"].toDouble();
    l_ModCustomerQuery.Pr_Decimal5 = l_JsonObject["pr_Decimal5"].toDouble();
    l_ModCustomerQuery.Pr_Decimal6 = l_JsonObject["pr_Decimal6"].toDouble();
    l_ModCustomerQuery.Pr_Decimal7 = l_JsonObject["pr_Decimal7"].toDouble();
    l_ModCustomerQuery.Pr_Decimal8 = l_JsonObject["pr_Decimal8"].toDouble();
    l_ModCustomerQuery.Pr_Decimal9 = l_JsonObject["pr_Decimal9"].toDouble();
    l_ModCustomerQuery.Pr_Decimal10 = l_JsonObject["pr_Decimal10"].toDouble();
    l_ModCustomerQuery.Pr_Integer1 = l_JsonObject["pr_Integer1"];
    l_ModCustomerQuery.Pr_Integer2 = l_JsonObject["pr_Integer2"];
    l_ModCustomerQuery.Pr_Integer3 = l_JsonObject["pr_Integer3"];
    l_ModCustomerQuery.Pr_Integer4 = l_JsonObject["pr_Integer4"];
    l_ModCustomerQuery.Pr_Integer5 = l_JsonObject["pr_Integer5"];
    l_ModCustomerQuery.Pr_Integer6 = l_JsonObject["pr_Integer6"];
    l_ModCustomerQuery.Pr_Integer7 = l_JsonObject["pr_Integer7"];
    l_ModCustomerQuery.Pr_Integer8 = l_JsonObject["pr_Integer8"];
    l_ModCustomerQuery.Pr_Integer9 = l_JsonObject["pr_Integer9"];
    l_ModCustomerQuery.Pr_Integer10 = l_JsonObject["pr_Integer10"];
    l_ModCustomerQuery.Pr_DateTime1 =
        DateTime.parse(l_JsonObject["pr_DateTime1"]);
    l_ModCustomerQuery.Pr_DateTime2 =
        DateTime.parse(l_JsonObject["pr_DateTime2"]);
    l_ModCustomerQuery.Pr_DateTime3 =
        DateTime.parse(l_JsonObject["pr_DateTime3"]);
    l_ModCustomerQuery.Pr_DateTime4 =
        DateTime.parse(l_JsonObject["pr_DateTime4"]);
    l_ModCustomerQuery.Pr_DateTime5 =
        DateTime.parse(l_JsonObject["pr_DateTime5"]);
    l_ModCustomerQuery.Pr_DateTime6 =
        DateTime.parse(l_JsonObject["pr_DateTime6"]);
    l_ModCustomerQuery.Pr_DateTime7 =
        DateTime.parse(l_JsonObject["pr_DateTime7"]);
    l_ModCustomerQuery.Pr_DateTime8 =
        DateTime.parse(l_JsonObject["pr_DateTime8"]);
    l_ModCustomerQuery.Pr_DateTime9 =
        DateTime.parse(l_JsonObject["pr_DateTime9"]);
    l_ModCustomerQuery.Pr_DateTime10 =
        DateTime.parse(l_JsonObject["pr_DateTime10"]);
    l_ModCustomerQuery.Pr_Boolean1 = l_JsonObject["pr_Boolean1"];
    l_ModCustomerQuery.Pr_Boolean2 = l_JsonObject["pr_Boolean2"];
    l_ModCustomerQuery.Pr_Boolean3 = l_JsonObject["pr_Boolean3"];
    l_ModCustomerQuery.Pr_Boolean4 = l_JsonObject["pr_Boolean4"];
    l_ModCustomerQuery.Pr_Boolean5 = l_JsonObject["pr_Boolean5"];
    l_ModCustomerQuery.Pr_Boolean6 = l_JsonObject["pr_Boolean6"];
    l_ModCustomerQuery.Pr_Boolean7 = l_JsonObject["pr_Boolean7"];
    l_ModCustomerQuery.Pr_Boolean8 = l_JsonObject["pr_Boolean8"];
    l_ModCustomerQuery.Pr_Boolean9 = l_JsonObject["pr_Boolean9"];
    l_ModCustomerQuery.Pr_Boolean10 = l_JsonObject["pr_Boolean10"];
    l_ModCustomerQuery.Pr_FixedID = l_JsonObject["pr_FixedID"];
    l_ModCustomerQuery.Pr_BranchID = l_JsonObject["pr_BranchID"];
    return l_ModCustomerQuery;
  }

  List<ModCustomerQuery> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModCustomerQuery> l_ListModCustomerQuery =
        new List<ModCustomerQuery>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModCustomerQuery l_ModCustomerQuery = new ModCustomerQuery();
      l_ModCustomerQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModCustomerQuery.add(l_ModCustomerQuery);
    }
    return l_ListModCustomerQuery;
  }
}
