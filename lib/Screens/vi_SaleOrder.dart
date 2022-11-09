import 'package:aisonedashboard/UserWidgets/UWButton/UWIconButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';

import '../Models/EModel/ModCustomerQuery.dart';
import '../Models/EModel/ModItemQuery.dart';
import '../Models/EModel/ModLocationQuery.dart';
import '../Models/EModel/ModSaleOrderDetailsFormQuery.dart';
import '../Models/EModel/ModTaxQuery.dart';
import '../Models/EModel/ModUomSelectionQuery.dart';
import '../UserWidgets/UWDropDown/UWDropDownCust.dart';
import '../UserWidgets/UWDropDown/UWDropDownItems.dart';
import '../UserWidgets/UWDropDown/UWDropDownLoc.dart';
import '../UserWidgets/UWDropDown/UWDropDownTax.dart';
import '../UserWidgets/UWDropDown/UWDropDownUOMSel.dart';
import '../UserWidgets/UserLabels/Ulabels.dart';
import '../UserWidgets/UserTextFields/SaleOrderItemsTextFields/UWNumTxtFields.dart';
import '../UserWidgets/UserTextFields/SaleOrderItemsTextFields/UWStrTxtFields.dart';
import '../UserWidgets/UserTextFields/UWDate/UWDate.dart';

TextEditingController Dis = new TextEditingController();
TextEditingController Dis2 = new TextEditingController();
String text = '';
String text2 = '';


UWDropDownItem l_UWDropDownItem = new UWDropDownItem();
UWDropDownLoc l_UWDropDownLoc = new UWDropDownLoc();
UWDropDownUOMSel l_UWDropDownUOMSel = new UWDropDownUOMSel();
UWDropDownTax l_UWDropDownTax = new UWDropDownTax();
UWStrTxtFields txtItemDescr = new UWStrTxtFields();
UWStrTxtFields txtUOM = new UWStrTxtFields();
UWNumTxtFields txtitemRate = new UWNumTxtFields();
UWNumTxtFields txtQuantity = new UWNumTxtFields();
UWNumTxtFields txtItemDiscunt = new UWNumTxtFields();
UWNumTxtFields txtItemDiscPerc = new UWNumTxtFields();
UWNumTxtFields txttotal = new UWNumTxtFields();

late ModSaleOrderDetailFormQuery SaleOrderModel2;

RxList<ModSaleOrderDetailFormQuery>? l_ListSaleOrderItems =
    <ModSaleOrderDetailFormQuery>[].obs;

//RxList<ModSaleOrderItems>? l_ListSaleOrderItems = <ModSaleOrderItems>[].obs;
var itemCount = 0.obs;
int OrderNo = 1;

//Selcted Data From Drop Down
late String? Selected_ItemDID;
late String? Selected_UOMDID;
late String? Selected_LocationDID;

late var total;

class vi_SaleOrder extends StatefulWidget {
  const vi_SaleOrder({Key? key}) : super(key: key);

  @override
  State<vi_SaleOrder> createState() => _vi_SaleOrderState();
}

class _vi_SaleOrderState extends State<vi_SaleOrder> {
  @override
  ULabels name = new ULabels();
  ULabels name2 = new ULabels();

  void initState() {
    Dis.text="0";
    Dis2.text="0";
    FncstartupSettings();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(now);
    print(formatted); // something like 2013-04-20
    dateinput.text = formatted;
    datte.txtController.text = formatted;
//set the initial value of text field
    super.initState();
  }

  //Labels
  ULabels lblSaleorder = new ULabels();
  ULabels lblTotal = new ULabels();

  UWDropDownCust l_UWDropDown = new UWDropDownCust();
  TextEditingController dateinput = TextEditingController();
  UWDate datte = new UWDate(
    txtController: new TextEditingController(),
    labelText: "",
    hintText: "",
  );
  UWIconButton l_UWIconButton = new UWIconButton(
    text: '',
  );

  TextEditingController txtname = new TextEditingController();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Shimmer.fromColors(
                          baseColor: Colors.black54,
                          highlightColor: Colors.lightBlueAccent.shade400,
                          child: lblSaleorder),
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    //RowWith two Widgets And Divider Vertical

                    Container(
                      width: 450,
                      height: 51.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        gradient: LinearGradient(colors: [
                          Colors.lightBlueAccent.shade200,
                          Colors.lightBlueAccent.shade200,
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight),

                        //color : Color.fromRGBO(183, 0, 77, 1),
                      ),
                      child: IntrinsicHeight(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(width: 150, child: Text("SO - $OrderNo")),
                          SizedBox(
                            height: 34,
                            child: VerticalDivider(thickness: 1.5),
                          ),
                          SizedBox(
                            width: 150,
                            child: datte,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        width: 450,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                          gradient: LinearGradient(
                              colors: [
                                Colors.lightBlueAccent.shade100,
                                Colors.lightBlueAccent.shade100,
                                Colors.lightBlue.shade300
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          //color : Color.fromRGBO(142, 242, 223, 0.9200000166893005),
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
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 80,
                                width: 550,
                                child: l_UWDropDown = new UWDropDownCust(
                                  ItemAsString:
                                      (ModCustomerQuery l_ModCustomerQuery) {
                                    return l_ModCustomerQuery.Pr_AccountID;
                                  },
                                  OnChanged: (ModCustomerQuery? data) {
                                    var aa = data?.Pr_AccountID;
                                  },
                                  LabelText: "    Customer Name",
                                ),
                              ),
                            ],
                          ),
                        )),

                    const SizedBox(
                      height: 3,
                    ),

                    const Divider(
                      endIndent: 79,
                      indent: 79,
                      thickness: 1.5,
                    ),
                    Row(children: [
                      if (l_ListSaleOrderItems == null) ...[
                        const Text(""),
                      ] else ...[
                        Expanded(
                          child: Obx(() => ListView.builder(
                                shrinkWrap: true,
                                itemCount: l_ListSaleOrderItems?.length,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width: 460,
                                        height: 79,
                                        child: Card(
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Stack(
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Colors.white,
                                                            Colors.white
                                                          ],
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      boxShadow: const [
                                                    BoxShadow(
                                                      offset: Offset(0, 4),
                                                      color: Colors.teal,
                                                      blurRadius: 10,
                                                    )
                                                  ])),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: ListView(
                                                      children: [
                                                        ListTile(
                                                          isThreeLine: true,
                                                          leading: Row(
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            children: [
                                                              SizedBox(
                                                                height: 30,
                                                                child: Image.asset(
                                                                    "assets/sent1.png"),
                                                              ),
                                                              SizedBox(
                                                                height: 48,
                                                                child:
                                                                    VerticalDivider(
                                                                  thickness: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          title: Wrap(
                                                              spacing: 8,
                                                              children: [
                                                                Text(
                                                                    'Item Name:'),
                                                                Text(l_ListSaleOrderItems!
                                                                    .value[index]
                                                                    .Pr_ItemDescr),
                                                              ]),
                                                          subtitle: Wrap(
                                                              spacing: 8,
                                                              children: [
                                                                Text('Quantity:'),
                                                                Text(l_ListSaleOrderItems!
                                                                    .value[index]
                                                                    .Pr_GroupID),
                                                                Text('Rate:'),
                                                                Text(l_ListSaleOrderItems!
                                                                    .value[index]
                                                                    .Pr_GroupID),
                                                                Text('Discount:'),
                                                                Text(l_ListSaleOrderItems!
                                                                    .value[index]
                                                                    .Pr_GroupID),
                                                              ]),
                                                          trailing: Text(
                                                              'Total: $total'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              )),
                        ),
                      ],
                    ]),
                    const SizedBox(
                      height: 8,
                    ),

                    SizedBox(
                        width: 130,
                        height: 43.5,
                        child: l_UWIconButton = UWIconButton(
                          onTap: () {
                            FncOnTap();
                          },
                          text: ' Add Items',
                        )),
                    const SizedBox(
                      height: 6,
                    ),

                    const SizedBox(
                      height: 3,
                    ),
                    const Divider(
                      endIndent: 79,
                      indent: 79,
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 3,
                    ),

                    Container(
                        width: 368,
                        height: 133,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 14,
                              left: 275,
                              child: Text(
                                '\45,000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 10,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                            top: 42,
                            left: 275,
                            child: SizedBox(
                              height: 20,
                              width: 120,
                              child: Center(
                                child: SizedBox(
                                  height: 10,
                                  width: 300,
                                  child: TextField(


                                      onChanged: (value) => setState(() => text = value),
                                    controller: Dis,
                                    style: TextStyle(
                                        fontSize: 10.5,
                                        height: 2.5,
                                        color: Colors.black),
                                    decoration: InputDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 17,
                              left: 23,
                              child: Text(
                                'Subtotal',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 12,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 42,
                              left: 23,
                              child: Text(
                                'Discount',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 12,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 87,
                              left: 23,
                              child: Text(
                                'GRAND TOTAL',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(215, 92, 23, 1),
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 12,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 84,
                              left: 275,
                              child: Text(
                                '\$44,000/-',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 12,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 38.5,
                              left: 79,
                              child: Container(
                                  width: 25,
                                  height: 14,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 25,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(1.5),
                                                topRight: Radius.circular(1.5),
                                                bottomLeft: Radius.circular(1.5),
                                                bottomRight: Radius.circular(1.5),
                                              ),
                                              color:
                                                  Color.fromRGBO(59, 114, 237, 1),
                                            ))),
                                    Positioned(
                                        top: 1,
                                        left: 3,
                                        child: Text(
                                          '$text',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 10,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                  ]))),

                          Positioned(
                              top: 62,
                              left: 23,
                              child: Text(
                                'Discount',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 12,
                                    letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                            top: 62,
                            left: 275,
                            child: SizedBox(
                              height: 20,
                              width: 120,
                              child: Center(
                                child: SizedBox(
                                  height: 10,
                                  width: 300,
                                  child: TextField(


                                    onChanged: (value) => setState(() => text2 = value),
                                    controller: Dis2,
                                    style: TextStyle(
                                        fontSize: 10.5,
                                        height: 2.5,
                                        color: Colors.black),

                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 58.5,
                              left: 79,
                              child: Container(
                                  width: 25,
                                  height: 14,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 25,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(1.5),
                                                topRight: Radius.circular(1.5),
                                                bottomLeft: Radius.circular(1.5),
                                                bottomRight: Radius.circular(1.5),
                                              ),
                                              color:
                                              Color.fromRGBO(59, 114, 237, 1),
                                            ))),
                                    Positioned(
                                        top: 1,
                                        left: 3,
                                        child: Text(
                                          '$text2 %',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 10,
                                              letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                  ]))),


                                           ])),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

//=====================DART===============

  FncstartupSettings() {
    //Labels
    lblSaleorder.TxtText = "S A L E - O R D E R";
    lblSaleorder.TxtFontSize = 30;
    lblSaleorder.color = Colors.black38;

    lblTotal.TxtText = "Total";
    lblTotal.TxtFontSize = 20;
    lblTotal.color = Colors.black38;

    name.TxtText = "Customer Name";
    name.TxtFontSize = 30;
    name.color = Colors.black38;

    name2.TxtText = "Sale Order";
    name2.TxtFontSize = 13;
    name2.color = Colors.black38;

    txtItemDescr.TxtHintText = " Enter Item Description";
    txtItemDescr.labelText = "Description";

    txtUOM.TxtHintText = "Enter Unit Of Measurement";
    txtUOM.labelText = "UOM";

    txtitemRate.TxtHintText = "Rate";
    txtitemRate.labelText = "Rate";
    txtQuantity.TxtHintText = "Quantity";
    txtQuantity.labelText = "Quantity";
    txtItemDiscunt.TxtHintText = "Discount";
    txtItemDiscunt.labelText = "Discount";
    txtItemDiscPerc.TxtHintText = "Percentage%";
    txtItemDiscPerc.labelText = "Discount";

    txttotal.TxtHintText = " Total";
    txttotal.labelText = "Total";
  }

  FncOnTap() {
    _onAlertWithCustomContentPressed(context);
    //Get.to(() => const vi_SaleOrderItems());
  }
}

_onAlertWithCustomContentPressed(context) {
  Alert(
      context: context,
      title: "Add Items",
      content: Column(
        children: <Widget>[
          SizedBox(
            width: 370,
            child: l_UWDropDownItem = new UWDropDownItem(
              ItemAsString: (ModItemQuery l_ModCustomerQuery) {
                return l_ModCustomerQuery.Pr_ItemID;
              },
              OnChanged: (ModItemQuery? data) {
                Selected_ItemDID = data?.Pr_ItemID;

                String? Selected_ItemDesc = data?.Pr_ItemDescr;
                txtItemDescr.txtController.text = Selected_ItemDesc!;
              },
              HintText: "Items",
              LabelText: "Item ID",
            ),
          ),
          const Divider(
            endIndent: 79,
            indent: 79,
            thickness: 1.5,
          ),
          const SizedBox(
            height: 2.5,
          ),
          SizedBox(width: 370, child: txtItemDescr),
          const Divider(
            endIndent: 79,
            indent: 79,
            thickness: 1.5,
          ),
          const SizedBox(
            height: 3.5,
          ),
          //UOM
          SizedBox(
            width: 370,
            height: 75,
            child: l_UWDropDownUOMSel = new UWDropDownUOMSel(
              ItemAsString: (ModUOMSelectionQuery l_ModUOMSelectionQuery) {
                return l_ModUOMSelectionQuery.Pr_UOMGroupID;
              },
              OnChanged: (ModUOMSelectionQuery? data) {
                //var aa = data?.Pr_ItemID;
                Selected_UOMDID = data?.Pr_UOMID;
                //txtItemDescr.txtController.text=Selected_Item;
              },
              HintText: "UOM",
              LabelText: "UOM ID",
            ),
          ),

          const Divider(
            endIndent: 79,
            indent: 79,
            thickness: 1.5,
          ),

          IntrinsicHeight(
            child: Row(children: [
              Flexible(flex: 9, child: txtQuantity),
              VerticalDivider(thickness: 1.5),
              Flexible(flex: 9, child: txtitemRate),
            ]),
          ),
          SizedBox(
            height: 4,
          ),
          const Divider(
            endIndent: 79,
            indent: 79,
            thickness: 1.5,
          ),
          IntrinsicHeight(
            child: Row(children: [
              Flexible(flex: 9, child: txtItemDiscunt),
              VerticalDivider(thickness: 1.5),
              Flexible(flex: 9, child: txtItemDiscPerc),
            ]),
          ),
          SizedBox(
            height: 4,
          ),
          const Divider(
            endIndent: 79,
            indent: 79,
            thickness: 1.5,
          ),

          //Loc
          SizedBox(
            width: 370,
            height: 75,
            child: l_UWDropDownTax = new UWDropDownTax(
              ItemAsString: (ModTaxQuery l_ModTaxQuery) {
                return l_ModTaxQuery.Pr_TaxID;
              },
              OnChanged: (ModTaxQuery? data) {
                //var aa = data?.Pr_ItemID;
                //Selected_Item = data?.Pr_ItemDescr;
                //txtItemDescr.txtController.text=Selected_Item;
              },
              HintText: "Tax",
              LabelText: "Tax ID",
            ),
          ),
          SizedBox(width: 370, child: txttotal),
          SizedBox(
            height: 3,
          ),
          const Divider(
            endIndent: 79,
            indent: 79,
            thickness: 1.5,
          ),
          SizedBox(
            width: 370,
            height: 75,
            child: l_UWDropDownLoc = new UWDropDownLoc(
              ItemAsString: (ModLocationQuery l_ModLocationQuery) {
                return l_ModLocationQuery.Pr_CityID;
              },
              OnChanged: (ModLocationQuery? data) {
                Selected_LocationDID = data?.Pr_PKGUID;
                //var aa = data?.Pr_ItemID;
                //Selected_Item = data?.Pr_ItemDescr;
                //txtItemDescr.txtController.text=Selected_Item;
              },
              HintText: "Location",
              LabelText: "Location ID",
            ),
          ),
          const Divider(
            endIndent: 79,
            indent: 79,
            thickness: 1.5,
          ),

          //Tax
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Fnc_Add_Values2(
              txtItemDescr.txtController.text,
              txtUOM.txtController.text,
              double.parse(txtitemRate.txtController.text),
              double.parse(txtQuantity.txtController.text),
              double.parse(txtItemDiscPerc.txtController.text),
              txtItemDiscunt.txtController.text,
            );
            //total =   txtitemRate.txtController.text * txtQuantity.txtController.text;
            var t1 = txtitemRate.txtController.text;
            var t2 = txtQuantity.txtController.text;
            total = t1 + t2;

            Navigator.pop(context, false);
            txtItemDescr.txtController.clear();
            txtUOM.txtController.clear();
            txtitemRate.txtController.clear();
            txtQuantity.txtController.clear();
            txtItemDiscunt.txtController.clear();
            txtItemDiscPerc.txtController.clear();
          },
          child: Text(
            "ADD",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

Fnc_Add_Values(String ItemDEsc, String UOM, String ItemRate, String Quantity,
    String DisQuantity, String Discount) {
  //SaleOrderModel = new ModSaleOrderItems(
  //  ItemDEsc: ItemDEsc,
  //  UOM: UOM,
  // ItemRate: ItemRate,
  // Quantity: Quantity,
  /// DisQuantity: DisQuantity,
  //  Discount: Discount);
  //Get.put(SaleOrderModel, tag: "SaleOrderModel");
  //print(SaleOrderModel);
  //l_ListSaleOrderItems?.add(SaleOrderModel);
  print(l_ListSaleOrderItems);
}

Fnc_Add_Values2(String ItemDEsc, String UOM, double ItemRate, double Quantity,
    double DisQuantity, String Discount) {
  SaleOrderModel2 = new ModSaleOrderDetailFormQuery(
      Pr_ItemDID: Selected_ItemDID!,
      Pr_ItemDescr: ItemDEsc,
      Pr_UOMDID: Selected_UOMDID!,
      Pr_FRate: ItemRate,
      Pr_Qty: Quantity,
      Pr_DiscPer: DisQuantity,
      Pr_TaxDID: '',
      Pr_LocationDID: Selected_LocationDID!);
  //Get.put(SaleOrderModel, tag: "SaleOrderModel");
  print(SaleOrderModel2);
  l_ListSaleOrderItems?.add(SaleOrderModel2);
  print(l_ListSaleOrderItems);
}
