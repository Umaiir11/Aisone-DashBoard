import 'package:aisonedashboard/Screens/vi_ItemsListQuery.dart';
import 'package:aisonedashboard/Screens/vi_SaleOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:sn_progress_dialog/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../ClassModules/cmGlobalVariables.dart';
import '../Models/EModel/ModBranchSetting.dart';
import '../Models/EModel/ModCustomerQuery.dart';
import '../Models/EModel/ModItemQuery.dart';
import '../Models/EModel/ModPendingDeliveryNote.dart';
import '../Models/EModel/ModPendingSaleOrder.dart';
import '../Models/ModChartPoints.dart';
import '../ServiceLayer/SlAisoneERP/SlEItemQuery.dart';
import '../ServiceLayer/SlAisoneERP/SleCustomerQuery.dart';
import '../UserWidgets/UserLabels/Ulabels.dart';

late List<Mod_Chartpoints> chartData2 = Get.find(tag: "chartData");
late PendingSOGrid l_PendingSOGrid;
late PendingDNGrid l_PendingDNGrid;
int PendingSaleOrder = cmGlobalVariables.l_list_PendingSO.length;
int PendingDeliveryNote = cmGlobalVariables.l_list_PendingDN.length;

double PendingSaleOrderTotal = 0;
var PendingSaleOrderTotal1 = PendingSaleOrderTotal.round();
double PendingSaleOrderDNTotal = 0;
var PendingSaleOrderDNTotal2 = PendingSaleOrderDNTotal.round();


class vi_Drawer extends StatefulWidget {
  const vi_Drawer({Key? key}) : super(key: key);

  @override
  State<vi_Drawer> createState() => _vi_DrawerState();
}

class _vi_DrawerState extends State<vi_Drawer> {
  @override
  void initState() {
    super.initState();
    FncstartupSettings();
    FncCustomerQuery();
    FncCustomerQuery();
    l_PendingSOGrid = PendingSOGrid(
        list_PendingSaleOrder: cmGlobalVariables.l_list_PendingSO);

    l_PendingDNGrid = PendingDNGrid(
        list_PendingDeliveryNote: cmGlobalVariables.l_list_PendingDN);
    FncTotal();
  }

  ULabels lblDrawer = new ULabels();
  ULabels lblDrawerTile1 = new ULabels();
  ULabels lblDrawerTile2 = new ULabels();
  ULabels lblDrawerTile3 = new ULabels();

  ULabels lblDrawerTile4 = new ULabels();
  ULabels lblDrawerTile5 = new ULabels();
  ULabels lblDrawerTile6 = new ULabels();
  ULabels lblDrawerTile7 = new ULabels();
  ULabels lblDrawerTile8 = new ULabels();
  ULabels lblDrawerTile9 = new ULabels();
  ULabels lblDrawerTile10 = new ULabels();
  ULabels lblDrawerTile11 = new ULabels();
  ULabels lblDrawerTile12 = new ULabels();

  int selectedIndex = 0;

  late RxList<ModAssignedBranches> l_Rx_listBranchSettting =
      Get.find(tag: "Rx_AssignedBranches");
  GlobalKey<ScaffoldState> scafKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: 270,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/users.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.person_sharp,
                                    size: 14, color: Colors.indigo),
                              ),
                              TextSpan(
                                text: cmGlobalVariables.Pb_UserName,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  MdiIcons.bank,
                                  size: 14,
                                  color: Colors.indigo,
                                ),
                              ),
                              TextSpan(
                                text: l_Rx_listBranchSettting[selectedIndex]
                                    .pr_BranchName,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.alternate_email,
                                    size: 14, color: Colors.indigo),
                              ),
                              TextSpan(
                                text: cmGlobalVariables.Pb_UserEmail,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.maps_home_work_outlined,
                                    size: 14, color: Colors.indigo),
                              ),
                              TextSpan(
                                text: l_Rx_listBranchSettting[selectedIndex]
                                    .pr_Address,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),

                  ListTile(
                    selected: selectedIndex == 0,
                    leading: Icon(
                      Icons.desktop_mac_outlined,
                      size: 28,
                    ),
                    title: lblDrawerTile1,
                    onTap: () async {
                      changeIndex(0);

                      Get.snackbar("Please Wait", "Data Is Loading");

                      ProgressDialog pd = ProgressDialog(context: context);
                      pd.show(
                        max: 100,
                        msg: 'File Downloading...',
                        completed: Completed(),
                        // Completed values can be customized
                        // Completed(completedMsg: "Downloading Done !", completedImage: AssetImage("assets/completed.png"), closedDelay: 2500,),
                        progressBgColor: Colors.transparent,
                      );

                      pd.isOpen();
                      if (await FncItemQuery() != true) {
                        Get.snackbar("Please Wait", "Data Is Loading");
                        if (FncCustomerQuery() != true) {
                          Get.snackbar("Please Wait", "Data Is Loading");
                        } else {
                          pd.close();
                          Get.to(() => vi_SaleOrder());
                        }
                      } else {
                        pd.close();
                        Get.to(() => vi_SaleOrder());
                      }

                      //}
                    },
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  //tile2
                  ListTile(
                      selected: selectedIndex == 1,
                      leading: Icon(
                        Icons.library_books_outlined,
                        size: 28,
                      ),
                      title: lblDrawerTile2,
                      onTap: () async {
                        changeIndex(1);
                        Get.snackbar("Please Wait", "Data Is Loading");
                        if (await FncItemQuery() != true) {
                          Get.snackbar("Please Wait", "Data Is Loading");
                        } else {
                          Get.to(() => GroupListViewDemo());
                        }
                      }),
                  SizedBox(
                    height: 1,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  //tile2
                ],
              ),
            ],
          ),
        ),
      ),
      key: scafKey,
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
              Color(0xFF88ECF8),
              Color(0xFF65DCDC),
            ],
            stops: [0.1, 0.5, 0.7, 0.9],
          ),
        ),
        child: SingleChildScrollView(
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
            child: Stack(children: <Widget>[
              Container(
                height: 500,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                height: 220,
                width: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent.shade200,
                    Colors.lightBlueAccent.shade200,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 55, left: 163),
                      child: lblDrawerTile10,
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 42, left: 12),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      scafKey.currentState?.openDrawer();
                    },
                  )),
              Container(
                margin: EdgeInsets.only(top: 110, left: 112),
                child: Text(
                  "80",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 73),
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/inc.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 80),
                child: Text(
                  "Present",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110, left: 212),
                child: Text(
                  "30",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 173),
                child: SizedBox(
                  height: 35,
                  child: Image.asset("assets/dec.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 190),
                child: Text(
                  "Absent",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110, left: 312),
                child: Text(
                  "7",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 273),
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/inc.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 290),
                child: Text(
                  "On Leave",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 180, left: 20),
                width: 215,
                height: 75,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 5),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 100),
                      child: lblDrawerTile8,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 45, left: 100),
                        child: Text(
                          "RS: 45415",
                          style: TextStyle(color: Colors.black38, fontSize: 23),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 7),
                      child: SizedBox(
                        height: 35,
                        child: Image.asset("assets/cashr.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 180, left: 250),
                width: 215,
                height: 75,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 5),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 100),
                      child: lblDrawerTile8,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 45, left: 100),
                        child: Text(
                          "RS: 45415",
                          style: TextStyle(color: Colors.black38, fontSize: 23),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 7),
                      child: SizedBox(
                        height: 35,
                        child: Image.asset("assets/cashp.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 276, left: 20),
                  height: 352,
                  width: 440,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 5),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    gradient: LinearGradient(colors: [
                      Colors.lightBlueAccent.shade100,
                      Colors.lightBlueAccent.shade100,
                      Colors.lightBlue.shade300
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: SfCartesianChart(
                    title: ChartTitle(text: "Sale Invoice List"),
                    series: <CartesianSeries>[
                      ColumnSeries<Mod_Chartpoints, String>(
                        dataSource: chartData2,
                        xValueMapper: (Mod_Chartpoints data, _) => data.x,
                        yValueMapper: (Mod_Chartpoints data, _) => data.y,
                      )
                    ],
                    primaryXAxis: CategoryAxis(),
                  )),



              //Grid
              Container(
                width: 440,
                height: 200,
                margin: EdgeInsets.only(top: 650, left: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 5),
                        blurRadius: 4)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: SfDataGrid(
                    source: l_PendingSOGrid,
                    shrinkWrapColumns: true,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    columnWidthMode: ColumnWidthMode.fitByColumnName,
                    footerFrozenRowsCount: 21,
                    columns: [
                      GridColumn(
                          width: 70,
                          columnName: 'Pr_VoucherNo',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'V No',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 70,
                          columnName: 'Pr_VDate',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Date',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 120,
                          columnName: 'Pr_AccountID',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Account',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 90,
                          columnName: 'Pr_FGrandTotal',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Total',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 90,
                          columnName: 'Pr_StageID',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Stage',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 90,
                          columnName: 'Pr_PQty',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Qty',
                                overflow: TextOverflow.ellipsis,
                              ))),
                    ],
                    stackedHeaderRows: <StackedHeaderRow>[
                      StackedHeaderRow(cells: [
                        StackedHeaderCell(
                            columnNames: [
                              'Pr_VoucherNo',
                              'Pr_VDate',
                              'Pr_AccountID',
                              'Pr_FGrandTotal'

                            ],
                            child: Container(
                                alignment: Alignment.centerLeft,
                                color: const Color(0xFFF1F1F1),
                                    child: Text(
                                  '  $PendingSaleOrder  Pending Orders',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5),
                                ))),
                        StackedHeaderCell(
                            columnNames: ['Pr_StageID', 'Pr_PQty'],
                            child: Container(alignment: Alignment.centerLeft ,

                                color: const Color(0xFFF1F1F1),
                            child: Text(
                            '  $PendingSaleOrderTotal1',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .5),
                            )

                            ))
                      ])
                    ]

                ),
              ),


              //Grid
              Container(
                width: 440,
                height: 200,
                margin: EdgeInsets.only(top: 870, left: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 5),
                        blurRadius: 4)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: SfDataGrid(
                    source: l_PendingDNGrid,
                    shrinkWrapColumns: true,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    columnWidthMode: ColumnWidthMode.fitByColumnName,
                    footerFrozenRowsCount: 21,
                    columns: [
                      GridColumn(
                          width: 70,
                          columnName: 'Pr_VoucherNo',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'D No',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 120,
                          columnName: 'Pr_AccountID',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Account',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 90,
                          columnName: 'Pr_FGrandTotal',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Total',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 90,
                          columnName: 'Pr_StageID',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Stage',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          width: 90,
                          columnName: 'Pr_PQty',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Qty',
                                overflow: TextOverflow.ellipsis,
                              ))),

                    ],


                    stackedHeaderRows: <StackedHeaderRow>[
                      StackedHeaderRow(cells: [
                        StackedHeaderCell(
                            columnNames: [
                              'Pr_VoucherNo',
                              'Pr_AccountID',
                              'Pr_FGrandTotal'

                            ],
                            child: Container(
                                alignment: Alignment.centerLeft,
                                color: const Color(0xFFF1F1F1),
                                child: Text(
                                  '  $PendingDeliveryNote  Pending Delivery Notes',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5),
                                ))),
                        StackedHeaderCell(
                            columnNames: ['Pr_StageID', 'Pr_PQty'],
                            child: Container(alignment: Alignment.centerLeft ,

                                color: const Color(0xFFF1F1F1),
                                child: Text(
                                  '  $PendingSaleOrderDNTotal2',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5),
                                )

                            ))
                      ])
                    ]


                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  //=================DART==================

  Future<bool> FncCustomerQuery() async {
    List<ModCustomerQuery>? l_list_CustomerQuery =
        new List<ModCustomerQuery>.empty(growable: true);

    l_list_CustomerQuery = await SlECustomerQuery().Fnc_CustomerQuery();
    if (l_list_CustomerQuery == null) {
      Get.snackbar("Alert", "Please Contact Your Administrator");
      return false;
    }
    cmGlobalVariables.Pbl_Rxlist_CustomerQuery?.addAll(l_list_CustomerQuery);
    return true;
  }

  Future<bool> FncItemQuery() async {
    List<ModItemQuery>? l_list_ItemQuery =
        new List<ModItemQuery>.empty(growable: true);
    l_list_ItemQuery = await SlEItemQueryOnline().Fnc_ItemQueryOnline();

    if (l_list_ItemQuery == null) {
      Get.snackbar("Alert", "Please Contact Your Administrator");
      return false;
    }

    cmGlobalVariables.l_list_ItemQuery?.addAll(l_list_ItemQuery);
    cmGlobalVariables.Pbl_Rxlist_ItemQuery?.addAll(l_list_ItemQuery);
    //_empdatas = EmployeeDataSource(employees: cmGlobalVariables.l_list_ItemQuery);
    return true;
  }

  FncstartupSettings() {
    //Labels
    lblDrawer.TxtText = "D R A W E R";
    lblDrawer.TxtFontSize = 15;
    lblDrawer.color = Colors.black38;

    lblDrawerTile1.TxtText = "Sale Order";
    lblDrawerTile1.TxtFontSize = 17;
    lblDrawerTile1.color = Colors.black38;

    lblDrawerTile2.TxtText = "Items List";
    lblDrawerTile2.TxtFontSize = 17;
    lblDrawerTile2.color = Colors.black38;

    lblDrawerTile3.TxtText = "Chart";
    lblDrawerTile3.TxtFontSize = 17;
    lblDrawerTile3.color = Colors.black38;

    lblDrawerTile4.TxtText = "   Pending Sale Order";
    lblDrawerTile4.TxtFontSize = 12;
    lblDrawerTile4.color = Colors.black;

    lblDrawerTile5.TxtText = "Pending Delivery Notes";
    lblDrawerTile5.TxtFontSize = 12;
    lblDrawerTile5.color = Colors.black38;

    lblDrawerTile6.TxtText = "BANK BALANCE";
    lblDrawerTile6.TxtFontSize = 18;
    lblDrawerTile6.color = Colors.black38;

    lblDrawerTile7.TxtText = "CASH BALANCE";
    lblDrawerTile7.TxtFontSize = 18;
    lblDrawerTile7.color = Colors.black38;

    lblDrawerTile8.TxtText = "TOTAL";
    lblDrawerTile8.TxtFontSize = 18;
    lblDrawerTile8.color = Colors.black38;

    lblDrawerTile9.TxtText = "PAYABLE";
    lblDrawerTile9.TxtFontSize = 18;
    lblDrawerTile9.color = Colors.black38;

    lblDrawerTile10.TxtText = " Sales Dashboard";
    lblDrawerTile10.TxtFontSize = 20;
    lblDrawerTile10.color = Colors.black38;

    lblDrawerTile11.TxtText = " Pending Sale Orders";
    lblDrawerTile11.TxtFontSize = 20;
    lblDrawerTile11.color = Colors.black38;

    lblDrawerTile12.TxtText = " Pending Delivery Notes";
    lblDrawerTile12.TxtFontSize = 20;
    lblDrawerTile12.color = Colors.black38;
  }

  FncTotal() {
    for (int i = 0; i < cmGlobalVariables.l_list_PendingSO.length; i++) {
      PendingSaleOrderTotal = PendingSaleOrderTotal +
          cmGlobalVariables.l_list_PendingSO[i].Pr_FGrandTotal;
    }
    print(PendingSaleOrderTotal);

    for (int i = 0; i < cmGlobalVariables.l_list_PendingDN.length; i++) {
      PendingSaleOrderDNTotal = PendingSaleOrderDNTotal +
          cmGlobalVariables.l_list_PendingSO[i].Pr_FGrandTotal;
    }

    print(PendingSaleOrderDNTotal);
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class PendingSOGrid extends DataGridSource {
  PendingSOGrid({required List<Mod_PendingSaleOrder> list_PendingSaleOrder}) {
    dataGridRows = list_PendingSaleOrder
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Pr_VoucherNo', value: dataGridRow.Pr_VoucherNo),
              DataGridCell<DateTime>(
                  columnName: 'Pr_VDate', value: dataGridRow.Pr_VDate),
              DataGridCell<String>(
                  columnName: 'Pr_AccountID', value: dataGridRow.Pr_AccountID),
              DataGridCell<double>(
                  columnName: 'Pr_FGrandTotal',
                  value: dataGridRow.Pr_FGrandTotal),
              DataGridCell<String>(
                  columnName: 'Pr_StageID', value: dataGridRow.Pr_StageID),
              DataGridCell<double>(
                  columnName: 'Pr_PQty', value: dataGridRow.Pr_PQty),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(dataGridCell.value.toString(),
              style: ( //dataGridCell.columnName == 'Pr_AccountID' ||
                      dataGridCell.columnName == 'Pr_FGrandTotal' ||
                          dataGridCell.columnName == 'Pr_VoucherNo')
                  ? TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                  : null));
    }).toList());
  }
}

class PendingDNGrid extends DataGridSource {
  PendingDNGrid(
      {required List<Mod_PendingDeliveryNote> list_PendingDeliveryNote}) {
    dataGridRows = list_PendingDeliveryNote
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Pr_VoucherNo', value: dataGridRow.Pr_VoucherNo),
              DataGridCell<String>(
                  columnName: 'Pr_AccountID', value: dataGridRow.Pr_AccountID),
              DataGridCell<double>(
                  columnName: 'Pr_FGrandTotal',
                  value: dataGridRow.Pr_FGrandTotal),
              DataGridCell<String>(
                  columnName: 'Pr_StageID', value: dataGridRow.Pr_StageID),
              DataGridCell<double>(
                  columnName: 'Pr_PQty', value: dataGridRow.Pr_PQty),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(dataGridCell.value.toString(),
              style: ( //dataGridCell.columnName == 'Pr_AccountID' ||
                      dataGridCell.columnName == 'Pr_FGrandTotal' ||
                          dataGridCell.columnName == 'Pr_VoucherNo')
                  ? TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                  : null));
    }).toList());
  }
}
