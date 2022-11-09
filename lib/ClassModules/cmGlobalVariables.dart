import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../Models/EModel/ModCustomerQuery.dart';
import '../Models/EModel/ModItemQuery.dart';
import '../Models/EModel/ModPendingDeliveryNote.dart';
import '../Models/EModel/ModPendingSaleOrder.dart';
import '../Models/EModel/ModSaleInvoiceList.dart';
import '../Models/EModel/ModSaleInvoiceListCht.dart';

class cmGlobalVariables {
  static String Pb_WebAPIURL = "www.aisonesystems.com";
  static String? Pb_ERPApiUrl = "";
  static String? Pb_ERP_API = "";
  static String? Pb_Token;
  static bool Pb_isOffline = false;
  static String? Pb_UserDID;

  static String? Pb_UserName;
  static String? Pb_UserEmail;
  static String? Pb_UserNumber;

  static RxList<ModCustomerQuery>? Pbl_Rxlist_CustomerQuery =
      <ModCustomerQuery>[].obs;
  static RxList<ModItemQuery>? Pbl_Rxlist_ItemQuery =
      <ModItemQuery>[].obs;

  static RxList<ModSaleInvoiceList>? Pbl_Rxlist_SaleInvList =
      <ModSaleInvoiceList>[].obs;

  static RxList<Mod_PendingSaleOrder>? Pbl_Rxlist_PendingSO =
      <Mod_PendingSaleOrder>[].obs;

  static List<ModItemQuery> l_list_ItemQuery =
  new List<ModItemQuery>.empty(growable: true);

  static List<Mod_PendingSaleOrder> l_list_PendingSO =
  new List<Mod_PendingSaleOrder>.empty(growable: true);

  static List<Mod_PendingDeliveryNote> l_list_PendingDN =
  new List<Mod_PendingDeliveryNote>.empty(growable: true);

}
