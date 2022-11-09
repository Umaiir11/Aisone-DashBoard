import 'package:aisonedashboard/Models/WModel/ModCompanyURLs.dart';
import 'package:aisonedashboard/ClassModules/cmGlobalVariables.dart';
import 'package:aisonedashboard/Screens/vi_AssignedBranches.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';
import '../ClassModules/cmCryptography.dart';
import '../Models/EModel/ModBranchSetting.dart';
import '../Models/EModel/ModItemQuery.dart';
import '../Models/WModel/ModCompanySettingQuery.dart';
import '../ServiceLayer/SlAisoneERP/SlEAssignedBranches.dart';
import '../ServiceLayer/SlAisoneWEB/SlWOnlineToken.dart';
import '../UserWidgets/UserLabels/UWLabels.dart';
import '../UserWidgets/UserLabels/Ulabels.dart';

class vi_CompanyLIst extends StatefulWidget {
  const vi_CompanyLIst({Key? key}) : super(key: key);

  @override
  State<vi_CompanyLIst> createState() => _vi_CompanyLIstState();
}

class _vi_CompanyLIstState extends State<vi_CompanyLIst> {
  cmCryptography l_cm_Encryption = new cmCryptography();

  int selectedIndeX = 0;
  int passIndeX = 0;

  @override
  void initState() {
    super.initState();
    FncstartupSettings();
  }

  //Labels
  ULabels lblCompanyList = new ULabels();
  ULabels lblCompanyName = new ULabels();

  //Find using Instance of a class.
  //Find the poupulated list and use that list instance to populate that card
  late RxList<ModCompanySettingQuery> l_ListCompanyList =
      Get.find(tag: "l_ListCompanyList");




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
          child: ResponsiveWrapper( maxWidth: 1200,
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
                  height: 32,
                ),
                SizedBox(
                  height: 170,
                  child: Image.asset("assets/com.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.cyanAccent,
                      child: lblCompanyList),
                ),

                const SizedBox(
                  height: 35,
                ),
                //Cards and Decorated Containers

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: l_ListCompanyList.length,
                  itemBuilder: (context, index) {
                    //get selected index on tap,
                    //after that got Company Did that index
                    return
                       Column(
                         children: [
                      InkWell(
                            onTap: () async {
                              if (await Fnc_OnlineToken() == true) {
                                if (await Fnc_OnlineAssignedBranches() == true)
                                  Get.to(() => vi_AssignedBranches());
                                Get.snackbar(
                                    "Company URl", cmGlobalVariables.Pb_ERPApiUrl!);
                              }

                              setState(() {
                                selectedIndeX = index;
                              });
                            },

                            //CARD
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
                                            gradient:LinearGradient(
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                lblCompanyName,
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                UWLabels(
                                                    text: l_ListCompanyList[index]
                                                        .Pr_CompanyName,
                                                    l_FontSize: 18,
                                                    color: Colors.black38),
                                                const SizedBox(height: 16),
                                                Wrap(
                                                  spacing: 5.0,
                                                  runSpacing: 5.0,
                                                  direction: Axis.vertical,
                                                  children: [
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        const Icon(
                                                          MdiIcons.gmail,
                                                          size: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        UWLabels(
                                                            text: l_ListCompanyList[
                                                                    index]
                                                                .Pr_EmailId,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
              ],
            ),
          )),
    );
  }

//============================DART=================================

  FncstartupSettings() {
    //Labels
    lblCompanyList.TxtText = "C O M P A N I E S";
    lblCompanyList.TxtFontSize = 30;
    lblCompanyList.color = Colors.black38;

    lblCompanyName.TxtText = "Company Name";
    lblCompanyName.TxtFontSize = 21;
    lblCompanyName.color = Colors.black87;
  }

  Future<bool> Fnc_OnlineToken() async {
    String email = l_ListCompanyList[selectedIndeX].Pr_EmailId;
    String uuid = l_ListCompanyList[selectedIndeX].Pr_CompanyDid;
    String Pass = Get.find(tag: "Pass");
    //APi Call CompanyUrls
    ModCompanyURLs? l_ModCompanyURLs =
        await new SlCompanyURLs().Fnc_CompanyURls(email, Pass, uuid);
    //dynamic token = l_ModCompanyURLs?.Pr_Token;

    String? l_Token = l_ModCompanyURLs?.Pr_Token;
    if (l_Token == null) {
      return false;
    }

    cmGlobalVariables.Pb_ERPApiUrl= l_ModCompanyURLs?.Pr_ApiErpUrl;
    cmGlobalVariables.Pb_Token = l_Token;
    return true;
  }

  Future<bool> Fnc_OnlineAssignedBranches() async {
    List<ModAssignedBranches>? l_listAssignedBranches =
        new List<ModAssignedBranches>.empty(growable: true);

    //Assigned Branches Api Call
    l_listAssignedBranches =
        await SlEAssignedBranches().Fnc_AssignedBranches();
    {
      if (l_listAssignedBranches == null) {
        Get.snackbar(
            "Alert", "No Branch Assigned, Please Contact Your Administrator");
        return false;
      }
      RxList<ModAssignedBranches>? Rx_AssignedBranches = <ModAssignedBranches>[].obs;
      Rx_AssignedBranches.addAll(l_listAssignedBranches);

      print(Rx_AssignedBranches);
      Get.put(Rx_AssignedBranches, tag: "Rx_AssignedBranches");
    }

    return true;
  }
}
