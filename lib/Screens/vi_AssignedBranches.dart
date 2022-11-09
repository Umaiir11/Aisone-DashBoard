import 'package:aisonedashboard/Screens/Drawer.dart';
import 'package:aisonedashboard/UserWidgets/UserLabels/Ulabels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';

import '../ClassModules/cmGlobalVariables.dart';
import '../Models/EModel/ModBranchSetting.dart';
import '../Models/EModel/ModParPendingVoucher.dart';
import '../Models/EModel/ModPendingDeliveryNote.dart';
import '../Models/EModel/ModPendingSaleOrder.dart';
import '../Models/EModel/ModSaleInvoiceListCht.dart';
import '../Models/ModChartPoints.dart';
import '../ServiceLayer/SlAisoneERP/SLEPendingDeliveryNote.dart';
import '../ServiceLayer/SlAisoneERP/SLESaleInvoiceListCht.dart';
import '../ServiceLayer/SlAisoneERP/SlEPendingSaleOrder.dart';
import '../UserWidgets/UserLabels/UWLabels.dart';
List<Mod_Chartpoints> chartData = [];

class vi_AssignedBranches extends StatefulWidget {
  const vi_AssignedBranches({Key? key}) : super(key: key);

  @override
  State<vi_AssignedBranches> createState() => _vi_AssignedBranchesState();
}

class _vi_AssignedBranchesState extends State<vi_AssignedBranches> {
  @override
  void initState() {
    super.initState();
    FncSaleInvList();
    FncPendingSO();
    FncPendingDN();
    FncstartupSettings();
  }

  //labels
  ULabels lblbranchList = new ULabels();
  ULabels lblbranchName = new ULabels();

  late RxList<ModAssignedBranches> Rx_AssignedBranches =
      Get.find(tag: "Rx_AssignedBranches");

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFD1FFFF),
              Color(0x3A88CDF8),
              Color(0xFF65DCDC),
            ],
            stops: [0.1, 0.5, 0.7, 0.9],
          ),
        ),
        child: ResponsiveWrapper(
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 170,
              child: Image.asset("assets/aa.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Shimmer.fromColors(
                  baseColor: Colors.black26,
                  highlightColor: Colors.cyanAccent,
                  child: lblbranchList),
            ),
            const SizedBox(
              height: 35,
            ),
            //Cards and Decorated Containers

            ListView.builder(
              shrinkWrap: true,
              itemCount: Rx_AssignedBranches.length,
              itemBuilder: (context, index) {
                //get selected index on tap,
                //after that got Company Did that index
                return Column(
                  children: [
                    InkWell(
                      onTap: () async {

                        if (await FncSaleInvList() != true) {

                        Get.snackbar("Please Wait", "Data Is Loading");
                        } else {
                          Fnc_PopChart();
                          Get.put(chartData, tag: "chartData");
                        Get.to(() => vi_Drawer());
                        }




                        Get.to(() => vi_Drawer());


                      },
                      child: SizedBox(
                        width: 450,
                        height: 140,
                        child: Card(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.lightBlueAccent.shade100,Colors.lightBlueAccent.shade100, Colors.lightBlue.shade300],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          color: Colors.teal,
                                          blurRadius: 10,
                                        )
                                      ])),
                              Positioned.fill(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                        "assets/company.png",
                                        height: 64,
                                        width: 64,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          lblbranchName,
                                          SizedBox(
                                            height: 12,
                                          ),
                                          UWLabels(
                                              text: Rx_AssignedBranches[index]
                                                  .pr_BranchName,
                                              l_FontSize: 18,
                                              color: Colors.black38),
                                          const SizedBox(height: 16),
                                          Wrap(
                                            spacing: 10.0,
                                            runSpacing: 10.0,
                                            direction: Axis.vertical,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  const Icon(
                                                    MdiIcons.googleMaps,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  UWLabels(
                                                      text: Rx_AssignedBranches[index]
                                                          .pr_Address,
                                                      l_FontSize: 18,
                                                      color: Colors.black38),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: const TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    letterSpacing: .5)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(
              height: 13,
            ),
          ]),
        ),
      ),
    );
  }

  //=================DART==================

  FncstartupSettings() {
    //Labels
    lblbranchList.TxtText = "B R A N C H E S";
    lblbranchList.TxtFontSize = 30;
    lblbranchList.color = Colors.black38;

    lblbranchName.TxtText = "Company Name";
    lblbranchName.TxtFontSize = 21;
    lblbranchName.color = Colors.black87;
  }

  Future<bool> FncSaleInvList() async {
    List<ModSaleInvoiceList>? l_list_SaleinvList =
    new List<ModSaleInvoiceList>.empty(growable: true);
    l_list_SaleinvList = await SlESaleInvoiceListCht().Fnc_SaleInvoiceListcht();

    if (l_list_SaleinvList == null) {
      Get.snackbar("Alert", "Please Contact Your Administrator");
      return false;
    }
    cmGlobalVariables.Pbl_Rxlist_SaleInvList?.addAll(l_list_SaleinvList);

    return true;
  }

  Future<bool> FncPendingSO() async {
    List<Mod_PendingSaleOrder>? l_PendingSaleOrder =
    new List<Mod_PendingSaleOrder>.empty(growable: true);
    l_PendingSaleOrder = await SlEPendingSaleOrder().Fnc_PendingSaleOrder();

    if (l_PendingSaleOrder == null) {
      Get.snackbar("Alert", "Please Contact Your Administrator");
      return false;
    }
    cmGlobalVariables.l_list_PendingSO?.addAll(l_PendingSaleOrder);
    print("xasd");

    return true;
  }

  Future<bool> FncPendingDN() async {

    List<Mod_PendingDeliveryNote>? l_PendingDeliveryNote =
    new List<Mod_PendingDeliveryNote>.empty(growable: true);
    l_PendingDeliveryNote = await SlEPendingDeliveryNote().Fnc_PendingDeliveryNote();

    if (l_PendingDeliveryNote == null) {
      Get.snackbar("Alert", "Please Contact Your Administrator");
      return false;
    }
    cmGlobalVariables.l_list_PendingDN?.addAll(l_PendingDeliveryNote);
    print("xasd");

    return true;
  }


  Fnc_PopChart() {

    for (int i = 0; i < cmGlobalVariables.Pbl_Rxlist_SaleInvList!.length; i++) {
      // points

      final DateFormat formatter = DateFormat('yy');
      final String Date2 = formatter
          .format(cmGlobalVariables.Pbl_Rxlist_SaleInvList![i].Pr_VDate);

      var Date = DateFormat.MMM()
          .format(cmGlobalVariables.Pbl_Rxlist_SaleInvList![i].Pr_VDate);

      var fDate = Date + '/' + Date2;
      Mod_Chartpoints l_Mod_Chartpoints = new Mod_Chartpoints(
          fDate, cmGlobalVariables.Pbl_Rxlist_SaleInvList![i].Pr_CGrandTotal);

      chartData.add(l_Mod_Chartpoints);

    }
  }

}

