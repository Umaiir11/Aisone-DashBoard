import 'dart:convert';

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModSaleInvoiceList.dart';
import '../../Models/EModel/ModTaxQuery.dart';

class SlESaleInvoiceList {
  Future<List<Mod_SaleInvoiceList>?> Fnc_SaleInvoiceList() async {
    try {
      //" Where UserDID = '" & Pb_UserDID.ToString & "' and IsAssigned = 1"

      final body = {
        "Pr_FromDate" :"2001-01-01",
        "Pr_ToDate":"2030-01-01",
        "Pr_FilterWhereClause":"",
        "Pr_ReportWhereClause":"",
        "Pr_ReportOrderByClause":"",
        "Pr_Stage":"0" ,
        "Pr_Branchid" : "1"
      };
      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseERPBoth('/RptSaleInvoiceList/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Mod_SaleInvoiceList Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    Mod_SaleInvoiceList l_ModI_SaleInvoiceList = new Mod_SaleInvoiceList();

    l_ModI_SaleInvoiceList.Pr_SIMain_PKGUID = l_JsonObject["pr_SIMain_PKGUID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_SrNo = l_JsonObject["pr_SIMain_SrNo"];
    l_ModI_SaleInvoiceList.Pr_SIMain_VNO = l_JsonObject["pr_SIMain_VNO"];
    l_ModI_SaleInvoiceList.Pr_SIMain_VoucherNo = l_JsonObject["pr_SIMain_VoucherNo"];
    l_ModI_SaleInvoiceList.Pr_SIMain_AccountDID = l_JsonObject["pr_SIMain_AccountDID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_ShippingLocationID = l_JsonObject["pr_SIMain_ShippingLocationID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_ShippingAddress = l_JsonObject["pr_SIMain_ShippingAddress"];
    l_ModI_SaleInvoiceList.Pr_SIMain_BillingAddress = l_JsonObject["pr_SIMain_BillingAddress"];
    l_ModI_SaleInvoiceList.Pr_SIMain_ContactPersonID = l_JsonObject["pr_SIMain_ContactPersonID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_CustomerRefNo = l_JsonObject["pr_SIMain_CustomerRefNo"];
    l_ModI_SaleInvoiceList.Pr_SIMain_RefNo = l_JsonObject["pr_SIMain_RefNo"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Remarks = l_JsonObject["pr_SIMain_Remarks"];
    l_ModI_SaleInvoiceList.Pr_SIMain_VDate = DateTime.parse(l_JsonObject["pr_SIMain_VDate"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_PaymentTerms = l_JsonObject["pr_SIMain_PaymentTerms"];
    l_ModI_SaleInvoiceList.Pr_SIMain_CashBankID = l_JsonObject["pr_SIMain_CashBankID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_CreditTermsID = l_JsonObject["pr_SIMain_CreditTermsID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_DueDate = DateTime.parse(l_JsonObject["pr_SIMain_DueDate"]);
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_ExRate = l_JsonObject["pr_SIMain_ExRate"].toDouble();
    l_ModI_SaleInvoiceList.Pr_SIMain_PostedID = l_JsonObject["pr_SIMain_PostedID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_SaleDiscountTermID = l_JsonObject["pr_SIMain_SaleDiscountTermID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_PaymentDiscountTermsID = l_JsonObject["pr_SIMain_PaymentDiscountTermsID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_DiscountAccountID = l_JsonObject["pr_SIMain_DiscountAccountID"];
    l_ModI_SaleInvoiceList.Pr_SIMain_SaleRepresentativeID = l_JsonObject["pr_SIMain_SaleRepresentativeID"];
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FCharges = l_JsonObject["pr_SIMain_FCharges"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CCharges = l_JsonObject["pr_SIMain_CCharges"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FTotal = l_JsonObject["pr_SIMain_FTotal"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CTotal = l_JsonObject["pr_SIMain_CTotal"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FDisc = l_JsonObject["pr_SIMain_FDisc"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CDisc = l_JsonObject["pr_SIMain_CDisc"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_DiscPer = l_JsonObject["pr_SIMain_DiscPer"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FDiscPer = l_JsonObject["pr_SIMain_FDiscPer"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CDiscPer = l_JsonObject["pr_SIMain_CDiscPer"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FTaxableAmount = l_JsonObject["pr_SIMain_FTaxableAmount"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CTaxableAmount = l_JsonObject["pr_SIMain_CTaxableAmount"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FTax = l_JsonObject["pr_SIMain_FTax"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CTax = l_JsonObject["pr_SIMain_CTax"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FGrandTotal = l_JsonObject["pr_SIMain_FGrandTotal"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CGrandTotal = l_JsonObject["pr_SIMain_CGrandTotal"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FReceiving = l_JsonObject["pr_SIMain_FReceiving"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CReceiving = l_JsonObject["pr_SIMain_CReceiving"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_FBalance = l_JsonObject["pr_SIMain_FBalance"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_CBalance = l_JsonObject["pr_SIMain_CBalance"].toDouble();
    l_ModI_SaleInvoiceList.Pr_SIMain_List1 = l_JsonObject["pr_SIMain_List1"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List2 = l_JsonObject["pr_SIMain_List2"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List3 = l_JsonObject["pr_SIMain_List3"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List4 = l_JsonObject["pr_SIMain_List4"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List5 = l_JsonObject["pr_SIMain_List5"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List6 = l_JsonObject["pr_SIMain_List6"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List7 = l_JsonObject["pr_SIMain_List7"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List8 = l_JsonObject["pr_SIMain_List8"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List9 = l_JsonObject["pr_SIMain_List9"];
    l_ModI_SaleInvoiceList.Pr_SIMain_List10 = l_JsonObject["pr_SIMain_List10"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String1 = l_JsonObject["pr_SIMain_String1"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String2 = l_JsonObject["pr_SIMain_String2"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String3 = l_JsonObject["pr_SIMain_String3"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String4 = l_JsonObject["pr_SIMain_String4"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String5 = l_JsonObject["pr_SIMain_String5"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String6 = l_JsonObject["pr_SIMain_String6"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String7 = l_JsonObject["pr_SIMain_String7"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String8 = l_JsonObject["pr_SIMain_String8"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String9 = l_JsonObject["pr_SIMain_String9"];
    l_ModI_SaleInvoiceList.Pr_SIMain_String10 = l_JsonObject["pr_SIMain_String10"];
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal1 = l_JsonObject["pr_SIMain_Decimal1"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal2 = l_JsonObject["pr_SIMain_Decimal2"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal3 = l_JsonObject["pr_SIMain_Decimal3"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal4 = l_JsonObject["pr_SIMain_Decimal4"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal5 = l_JsonObject["pr_SIMain_Decimal5"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal6 = l_JsonObject["pr_SIMain_Decimal6"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal7 = l_JsonObject["pr_SIMain_Decimal7"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal8 = l_JsonObject["pr_SIMain_Decimal8"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal9 = l_JsonObject["pr_SIMain_Decimal9"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_SIMain_Decimal10 = l_JsonObject["pr_SIMain_Decimal10"].toDouble();
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer1 = l_JsonObject["pr_SIMain_Integer1"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer2 = l_JsonObject["pr_SIMain_Integer2"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer3 = l_JsonObject["pr_SIMain_Integer3"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer4 = l_JsonObject["pr_SIMain_Integer4"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer5 = l_JsonObject["pr_SIMain_Integer5"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer6 = l_JsonObject["pr_SIMain_Integer6"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer7 = l_JsonObject["pr_SIMain_Integer7"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer8 = l_JsonObject["pr_SIMain_Integer8"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer9 = l_JsonObject["pr_SIMain_Integer9"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Integer10 = l_JsonObject["pr_SIMain_Integer10"];
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime1 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime1"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime2 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime2"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime3 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime3"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime4 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime4"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime5 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime5"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime6 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime6"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime7 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime7"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime8 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime8"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime9 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime9"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_DateTime10 = DateTime.parse(l_JsonObject["pr_SIMain_DateTime10"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean1 = l_JsonObject["pr_SIMain_Boolean1"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean2 = l_JsonObject["pr_SIMain_Boolean2"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean3 = l_JsonObject["pr_SIMain_Boolean3"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean4 = l_JsonObject["pr_SIMain_Boolean4"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean5 = l_JsonObject["pr_SIMain_Boolean5"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean6 = l_JsonObject["pr_SIMain_Boolean6"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean7 = l_JsonObject["pr_SIMain_Boolean7"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean8 = l_JsonObject["pr_SIMain_Boolean8"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean9 = l_JsonObject["pr_SIMain_Boolean9"];
    l_ModI_SaleInvoiceList.Pr_SIMain_Boolean10 = l_JsonObject["pr_SIMain_Boolean10"];
    l_ModI_SaleInvoiceList.Pr_SIMain_CB = l_JsonObject["pr_SIMain_CB"];
    l_ModI_SaleInvoiceList.Pr_SIMain_CreatedBy = l_JsonObject["pr_SIMain_CreatedBy"];
    l_ModI_SaleInvoiceList.Pr_SIMain_CDate = DateTime.parse(l_JsonObject["pr_SIMain_CDate"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_MB = l_JsonObject["pr_SIMain_MB"];
    l_ModI_SaleInvoiceList.Pr_SIMain_ModifiedBy = l_JsonObject["pr_SIMain_ModifiedBy"];
    l_ModI_SaleInvoiceList.Pr_SIMain_MDate = DateTime.parse(l_JsonObject["pr_SIMain_MDate"]);
    l_ModI_SaleInvoiceList.Pr_SIMain_BranchID = l_JsonObject["pr_SIMain_BranchID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_PKGUID = l_JsonObject["pr_Accounts_PKGUID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_AccountID = l_JsonObject["pr_Accounts_AccountID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Abbreviation = l_JsonObject["pr_Accounts_Abbreviation"];
    l_ModI_SaleInvoiceList.Pr_Accounts_AccountCode = l_JsonObject["pr_Accounts_AccountCode"];
    l_ModI_SaleInvoiceList.Pr_Accounts_ActiveID = l_JsonObject["pr_Accounts_ActiveID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CurrencyCode = l_JsonObject["pr_Accounts_CurrencyCode"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CompanyName = l_JsonObject["pr_Accounts_CompanyName"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Descr = l_JsonObject["pr_Accounts_Descr"];
    l_ModI_SaleInvoiceList.Pr_Accounts_SaleChannelID = l_JsonObject["pr_Accounts_SaleChannelID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CustomerTypeID = l_JsonObject["pr_Accounts_CustomerTypeID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CarrierID = l_JsonObject["pr_Accounts_CarrierID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Telephone1 = l_JsonObject["pr_Accounts_Telephone1"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Telephone2 = l_JsonObject["pr_Accounts_Telephone2"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Mobile1 = l_JsonObject["pr_Accounts_Mobile1"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Mobile2 = l_JsonObject["pr_Accounts_Mobile2"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Fax = l_JsonObject["pr_Accounts_Fax"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Email = l_JsonObject["pr_Accounts_Email"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Address = l_JsonObject["pr_Accounts_Address"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Website = l_JsonObject["pr_Accounts_Website"];
    l_ModI_SaleInvoiceList.Pr_Accounts_AreaID = l_JsonObject["pr_Accounts_AreaID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CountryID = l_JsonObject["pr_Accounts_CountryID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CityID = l_JsonObject["pr_Accounts_CityID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_DistrictID = l_JsonObject["pr_Accounts_DistrictID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_ProvinceID = l_JsonObject["pr_Accounts_ProvinceID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Zip = l_JsonObject["pr_Accounts_Zip"];
    l_ModI_SaleInvoiceList.Pr_Accounts_ZoneID = l_JsonObject["pr_Accounts_ZoneID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CreditLimit = l_JsonObject["pr_Accounts_CreditLimit"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CreditLimitStatusID = l_JsonObject["pr_Accounts_CreditLimitStatusID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CreditTermID = l_JsonObject["pr_Accounts_CreditTermID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_PaymentDiscountTermID = l_JsonObject["pr_Accounts_PaymentDiscountTermID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_PaymentMethodID = l_JsonObject["pr_Accounts_PaymentMethodID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_SalesRepresentativeID = l_JsonObject["pr_Accounts_SalesRepresentativeID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_PriceLevelID = l_JsonObject["pr_Accounts_PriceLevelID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_SaleDiscountTermID = l_JsonObject["pr_Accounts_SaleDiscountTermID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_RefferedByID = l_JsonObject["pr_Accounts_RefferedByID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_NTNNo = l_JsonObject["pr_Accounts_NTNNo"];
    l_ModI_SaleInvoiceList.Pr_Accounts_STNNo = l_JsonObject["pr_Accounts_STNNo"];
    l_ModI_SaleInvoiceList.Pr_Accounts_CNICNo = l_JsonObject["pr_Accounts_CNICNo"];
    l_ModI_SaleInvoiceList.Pr_Accounts_FurtherTaxID = l_JsonObject["pr_Accounts_FurtherTaxID"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List1 = l_JsonObject["pr_Accounts_List1"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List2 = l_JsonObject["pr_Accounts_List2"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List3 = l_JsonObject["pr_Accounts_List3"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List4 = l_JsonObject["pr_Accounts_List4"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List5 = l_JsonObject["pr_Accounts_List5"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List6 = l_JsonObject["pr_Accounts_List6"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List7 = l_JsonObject["pr_Accounts_List7"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List8 = l_JsonObject["pr_Accounts_List8"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List9 = l_JsonObject["pr_Accounts_List9"];
    l_ModI_SaleInvoiceList.Pr_Accounts_List10 = l_JsonObject["pr_Accounts_List10"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String1 = l_JsonObject["pr_Accounts_String1"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String2 = l_JsonObject["pr_Accounts_String2"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String3 = l_JsonObject["pr_Accounts_String3"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String4 = l_JsonObject["pr_Accounts_String4"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String5 = l_JsonObject["pr_Accounts_String5"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String6 = l_JsonObject["pr_Accounts_String6"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String7 = l_JsonObject["pr_Accounts_String7"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String8 = l_JsonObject["pr_Accounts_String8"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String9 = l_JsonObject["pr_Accounts_String9"];
    l_ModI_SaleInvoiceList.Pr_Accounts_String10 = l_JsonObject["pr_Accounts_String10"];
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal1 = l_JsonObject["pr_Accounts_Decimal1"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal2 = l_JsonObject["pr_Accounts_Decimal2"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal3 = l_JsonObject["pr_Accounts_Decimal3"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal4 = l_JsonObject["pr_Accounts_Decimal4"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal5 = l_JsonObject["pr_Accounts_Decimal5"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal6 = l_JsonObject["pr_Accounts_Decimal6"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal7 = l_JsonObject["pr_Accounts_Decimal7"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal8 = l_JsonObject["pr_Accounts_Decimal8"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal9 = l_JsonObject["pr_Accounts_Decimal9"].toDouble();
    lat: l_ModI_SaleInvoiceList.Pr_Accounts_Decimal10 = l_JsonObject["pr_Accounts_Decimal10"].toDouble();
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer1 = l_JsonObject["pr_Accounts_Integer1"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer2 = l_JsonObject["pr_Accounts_Integer2"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer3 = l_JsonObject["pr_Accounts_Integer3"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer4 = l_JsonObject["pr_Accounts_Integer4"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer5 = l_JsonObject["pr_Accounts_Integer5"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer6 = l_JsonObject["pr_Accounts_Integer6"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer7 = l_JsonObject["pr_Accounts_Integer7"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer8 = l_JsonObject["pr_Accounts_Integer8"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer9 = l_JsonObject["pr_Accounts_Integer9"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Integer10 = l_JsonObject["pr_Accounts_Integer10"];
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime1 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime1"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime2 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime2"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime3 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime3"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime4 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime4"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime5 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime5"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime6 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime6"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime7 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime7"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime8 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime8"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime9 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime9"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_DateTime10 = DateTime.parse(l_JsonObject["pr_Accounts_DateTime10"]);
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean1 = l_JsonObject["pr_Accounts_Boolean1"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean2 = l_JsonObject["pr_Accounts_Boolean2"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean3 = l_JsonObject["pr_Accounts_Boolean3"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean4 = l_JsonObject["pr_Accounts_Boolean4"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean5 = l_JsonObject["pr_Accounts_Boolean5"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean6 = l_JsonObject["pr_Accounts_Boolean6"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean7 = l_JsonObject["pr_Accounts_Boolean7"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean8 = l_JsonObject["pr_Accounts_Boolean8"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean9 = l_JsonObject["pr_Accounts_Boolean9"];
    l_ModI_SaleInvoiceList.Pr_Accounts_Boolean10 = l_JsonObject["pr_Accounts_Boolean10"];
    return l_ModI_SaleInvoiceList;
  }

  List<Mod_SaleInvoiceList> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<Mod_SaleInvoiceList> l_ListModI_SaleInvoiceList = new List<Mod_SaleInvoiceList>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      Mod_SaleInvoiceList l_ModI_SaleInvoiceList = new Mod_SaleInvoiceList();
      l_ModI_SaleInvoiceList = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_SaleInvoiceList.add(l_ModI_SaleInvoiceList);
    }
    return l_ListModI_SaleInvoiceList;
  }


}
