
import 'package:aisonedashboard/Screens/vi_Login.dart';
import 'package:aisonedashboard/UserWidgets/UWButton/UWBUtton.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';

import '../ClassModules/cmCryptography.dart';
import '../Models/EModel/ModItemQuery.dart';
import '../UserWidgets/UWDropDown/UWDropDownItems.dart';
import '../UserWidgets/UserLabels/Ulabels.dart';
import '../UserWidgets/UserTextFields/SaleOrderItemsTextFields/UWNumTxtFields.dart';
import '../UserWidgets/UserTextFields/SaleOrderItemsTextFields/UWStrTxtFields.dart';

class vi_SaleOrderItems extends StatefulWidget {
  const vi_SaleOrderItems({Key? key}) : super(key: key);

  @override
  State<vi_SaleOrderItems> createState() => _vi_SaleOrderItemsState();
}

class _vi_SaleOrderItemsState extends State<vi_SaleOrderItems> {
  @override
  void initState() {
    super.initState();
    FncstartupSettings();
  }
  //labels
  ULabels lblSaleorderItems = new ULabels();

  cmCryptography l_cm_Encryption = new cmCryptography();

  UWDropDownItem l_UWDropDownItem = new UWDropDownItem(
  );
  UWButton l_UWButton = new UWButton(
    text: '',
  );

  UWStrTxtFields txtItemDescr = new UWStrTxtFields();
  UWStrTxtFields txtUOM = new UWStrTxtFields();
  UWNumTxtFields txtitemRate = new UWNumTxtFields();
  UWNumTxtFields txtQuantity = new UWNumTxtFields();
  UWNumTxtFields txtItemDiscunt = new UWNumTxtFields();
  UWNumTxtFields txtItemDiscPerc = new UWNumTxtFields();

  UWButton lUWButton = new UWButton(text: "text");

  DropdownSearch aa = new DropdownSearch();

  //CustomField cf = new CustomField(hintText: "HI", Test:,);

  @override
  //Find using Instance of a class.
  //Find the poupulated list and use that list instance to populate that card
  //late RxList<ModCompanySettingQuery> l_ListCompanyList =
  //Get.find(tag: "l_ListCompanyList");
  @override
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 65,
                ),
                SizedBox(
                  height: 70,
                  child: Image.asset("assets/SaleOrderItems.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.cyanAccent,
                    child: lblSaleorderItems
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //Fields

                SizedBox(
                  width: 370,
                  child: l_UWDropDownItem = new UWDropDownItem(
                    ItemAsString: (ModItemQuery l_ModCustomerQuery) {
                      return l_ModCustomerQuery.Pr_ItemID;
                    },
                    OnChanged: (ModItemQuery? data) {
                      var aa = data?.Pr_ItemID;
                    },
                    HintText: "Items",
                    LabelText: "Item ID",
                  ),
                ),

                // txtItemDescription(decor),
                const SizedBox(
                  height: 3.5,
                ),
                const Divider(
                  endIndent: 79,
                  indent: 79,
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 3.5,
                ),
                SizedBox(
                    // width: 370, child: cf
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
                SizedBox(width: 370, child: txtUOM),
                const Divider(
                  endIndent: 79,
                  indent: 79,
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 10.5,
                ),
                IntrinsicHeight(
                  child: Row(children: [
                    Flexible(
                      flex: 8,
                      child: SizedBox(
                        width: 55,
                      ),
                    ),
                    Flexible(flex: 13, child: txtitemRate),
                    VerticalDivider(thickness: 1.5),
                    Flexible(flex: 13, child: txtQuantity),
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
                    Flexible(
                      flex: 8,
                      child: SizedBox(
                        width: 55,
                      ),
                    ),
                    Flexible(flex: 13, child: txtItemDiscunt),
                    VerticalDivider(thickness: 1.5),
                    Flexible(flex: 13, child: txtItemDiscPerc),
                  ]),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(130.0, 0.0, 130.0, 0.0),
                  child: SizedBox(
                      width: 170,
                      child: l_UWButton = new UWButton(
                        onTap: () {
                          FncOnTap();
                        },
                        text: 'Save Data',
                      )),
                ),
              ],
            ),
          )),
    );
  }




//============================DART=================================

  FncstartupSettings() {
    //Labels
    lblSaleorderItems.TxtText = "Item Selection";
    lblSaleorderItems.TxtFontSize = 30;
    lblSaleorderItems.color = Colors.black38;

    txtItemDescr.TxtHintText = " Enter Item Description";
    txtItemDescr.labelText = "Description";
    txtUOM.TxtHintText="Enter Unit Of Measurement";
    txtUOM.labelText="UOM";

    txtitemRate.TxtHintText = "Items";
    txtitemRate.labelText = "Items";
    txtQuantity.TxtHintText = "Quantity";
    txtQuantity.labelText = "Quantity";
    txtItemDiscunt.TxtHintText = "Dis Quantity";
    txtItemDiscunt.labelText = "Quantity";
    txtItemDiscPerc.TxtHintText = "Percentage%";
    txtItemDiscPerc.labelText = "Discount";

  }


  FncOnTap() {
    Get.to(() => const vi_login());
  }
}
