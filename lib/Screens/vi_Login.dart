import 'dart:async';

import 'package:aisonedashboard/Screens/vi_AssignedBranches.dart';
import 'package:aisonedashboard/Screens/vi_CompanyLIst.dart';
import 'package:aisonedashboard/ServiceLayer/SlAisoneERP/SlEOfflineToken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shimmer/shimmer.dart';

import '../ClassModules/cmGlobalVariables.dart';
import '../Models/EModel/ModBranchSetting.dart';
import '../Models/ModUserProfile.dart';
import '../Models/WModel/ModCompanySettingQuery.dart';
import '../ServiceLayer/SlAisoneERP/SIEUserProfile.dart';
import '../ServiceLayer/SlAisoneERP/SlEAssignedBranches.dart';
import '../ServiceLayer/SlAisoneWEB/SlWLogin.dart';
import '../ServiceLayer/SlAisoneWEB/SlWUserProfile.dart';
import '../UserWidgets/UWButton/UWBUtton.dart';
import '../UserWidgets/UserLabels/Ulabels.dart';
import '../UserWidgets/UserTextFields/UWFields/UWTxtIP.dart';
import '../UserWidgets/UserTextFields/UWFields/UWTxtString.dart';

bool Reset = true;
final RoundedLoadingButtonController _btnController1 =
    RoundedLoadingButtonController();

class vi_login extends StatefulWidget {
  const vi_login({key}) : super(key: key);

  @override
  State<vi_login> createState() => _vi_loginState();
}

class _vi_loginState extends State<vi_login> {
  @override
  late Box box1;
  bool isChecked = false;

  void initState() {
    super.initState();

    createBox();
    Reset = true;
    FncstartupSettings();
    _btnController1.reset();
    _btnController1.stateStream.listen((value) {
      print(value);
    });
  }

  void createBox() async {
    box1 = await Hive.openBox("name");
    GetData();
  }
  void GetData() {
    if (box1.get('txtEmail') != null) {
      txtEmail.txtController.text = box1.get('txtEmail');
      isChecked = true;
    };

    if (box1.get('txtIPAddress') != null) {
      txtIPAddress.txtController.text = box1.get('txtIPAddress');
      isChecked = true;
    };

    if (box1.get('txtPass') != null) {
      txtPass.text = box1.get('txtPass');
    };
  }

  UWTxtString txtEmail = new UWTxtString();
  UWTxtIP txtIPAddress = new UWTxtIP();
  TextEditingController txtPass = new TextEditingController();

  ULabels lblLogin = new ULabels();
  ULabels lblcredentials = new ULabels();
  ULabels lblAppmode = new ULabels();

  UWButton l_UWButton = new UWButton(
    text: '',
  );

  bool G_isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    Widget togglepassword() {
      return IconButton(
        onPressed: () {
          setState(() {
            G_isSecurePassword = !G_isSecurePassword;
          });
        },
        icon: G_isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        color: Colors.indigo,
      );
    }

    //=============================================
    DateTime timeBackPressed = DateTime.now();

    return WillPopScope(
      onWillPop: () async {
        //current time and last time we press the back back button
        final difference = DateTime.now().difference(timeBackPressed);
        //in case 2 back button presses is greater then 2 ,then we only show warning
        bool isExitWarning = difference >= Duration(seconds: 3);

        //current state intime
        timeBackPressed = DateTime.now();

        //Stay in application
        if (isExitWarning) {
          final alert = "Press back again to exist";
          Fluttertoast.showToast(
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.lightBlue,
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              msg: alert,
              fontSize: 14);

          return false;
        }
        //Exit from  application
        else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: GestureDetector(
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
            //color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            // we use child container property and used most important property column that accepts multiple widgets

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
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    height: 250,
                    child: Image.asset("assets/aisonr.png"),
                  ),
                  const SizedBox(
                    height: 29.0,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: lblLogin),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: lblcredentials),
                  const SizedBox(
                    height: 55,
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 370,
                          child: Visibility(child: txtEmail),
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
                        SizedBox(
                          width: 370,
                          child: TextFormField(
                            obscureText: G_isSecurePassword,
                            controller: txtPass,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(color: Colors.black26),
                              labelText: ' Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.white38)),
                              prefixIcon: const Icon(MdiIcons.fingerprint,
                                  size: 20, color: Colors.indigo),
                              suffixIcon: togglepassword(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Remember me"),
                      Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            isChecked = !isChecked;
                            setState(() {});
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Visibility(
                    visible: cmGlobalVariables.Pb_isOffline,
                    child: const Divider(
                      endIndent: 79,
                      indent: 79,
                      thickness: 1.5,
                    ),
                  ),
                  SizedBox(
                    width: 370,
                    child: Visibility(
                        visible: cmGlobalVariables.Pb_isOffline,
                        child: txtIPAddress),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: 200,
                    child: RoundedLoadingButton(
                        elevation: 5.0,
                        borderRadius: 5,
                        resetAfterDuration: Reset,
                        resetDuration: Duration(seconds: 3),
                        child: Text('Login',
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    letterSpacing: .5))),
                        controller: _btnController1,
                        onPressed: () {
                          FncOnTap();
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Shimmer.fromColors(
                        baseColor: Colors.black38,
                        highlightColor: Colors.cyanAccent,
                        child: lblAppmode),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: FlutterSwitch(
                    inactiveColor: Color(0xFF0082C8),
                    activeColor: Colors.redAccent,
                    activeText: 'Offline',
                    inactiveText: 'Online',
                    width: 77.0,
                    height: 33.0,
                    valueFontSize: 10.5,
                    toggleSize: 20.0,
                    value: cmGlobalVariables.Pb_isOffline,
                    borderRadius: 35.0,
                    padding: 7.0,
                    showOnOff: true,
                    onToggle: (bool value) {
                      setState(() {
                        cmGlobalVariables.Pb_isOffline = value;

                        if (cmGlobalVariables.Pb_isOffline == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.redAccent,
                              action: SnackBarAction(
                                label: "",
                                onPressed: () {},
                              ),
                              content: const Text(' Mode Offline'),
                              duration: const Duration(milliseconds: 750),
                              width: 280.0,
                              // Width of the SnackBar.
                              padding: const EdgeInsets.symmetric(
                                horizontal:
                                    20.0, // Inner padding for SnackBar content.
                              ),

                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color(0xFF0082C8),
                              action: SnackBarAction(
                                label: "",
                                onPressed: () {},
                              ),
                              content: const Text(' Mode Offline'),
                              duration: const Duration(milliseconds: 750),
                              width: 280.0,
                              // Width of the SnackBar.
                              padding: const EdgeInsets.symmetric(
                                horizontal:
                                    20.0, // Inner padding for SnackBar content.
                              ),

                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          );
                        }
                      });
                    },
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    //=============================================
  }

  //#region Startup
  FncstartupSettings() {
    //TextFields
    txtEmail.TxtHintText = "Enter Email";
    txtEmail.labelText = "Email";
    txtIPAddress.TxtHintText = "Enter Server IP";
    txtIPAddress.labelText = "Server IP";

    //Labels
    lblLogin.TxtText = "Login";
    lblLogin.TxtFontSize = 30;
    lblLogin.color = Colors.black38;

    lblcredentials.TxtText = "Please Enter Your Credentials";
    lblcredentials.TxtFontSize = 12;
    lblcredentials.color = Colors.black38;

    lblAppmode.TxtText = "Application Mode";
    lblAppmode.TxtFontSize = 30;
    lblAppmode.color = Colors.black38;
  }

//#endregion

  //#region Events

  FncOnTap() async {
//==================Validations

    login_DB();
    void _doSomething(RoundedLoadingButtonController controller) async {
      Timer(Duration(seconds: 3), () async {
        controller.reset();
        if (Fnc_ValidateLogin() == false) {
          Reset = false;
        } else {
          Reset = false;
          if (cmGlobalVariables.Pb_isOffline == true) {
            if (await Fnc_OfflineProcedures() == true) {
              Get.to(() => const vi_AssignedBranches());
            }
          } else {
            if (await Fnc_WValidateUser() == true) {
              if (await Fnc_OnlineProcedures() == true) {
                Get.to(() => const vi_CompanyLIst());
              }
            }
          }
        }
      });
    }



    if (Fnc_ValidateLogin() == false) {
      return;
    }

    if (cmGlobalVariables.Pb_isOffline == true) {
      if (await Fnc_OfflineProcedures() == true) {
        Get.to(() => const vi_AssignedBranches());
      }
    } else {
      if (await Fnc_WValidateUser() == true) {
        if (await Fnc_OnlineProcedures() == true) {
          Get.to(() => const vi_CompanyLIst());
        }
      }
    }
  }

//#endregion

//#region Validations
  bool Fnc_ValidateLogin() {
    if (txtEmail.txtController.text.isEmpty == true) {
      Get.snackbar("ALERT", "Email is required ");
      return false;
    }

    if (txtPass.text.isEmpty == true) {
      Get.snackbar("ALERT", "Password is required ");
      return false;
    }
    if (cmGlobalVariables.Pb_isOffline == true) {
      if (txtIPAddress.txtController.text.isEmpty) {
        Get.snackbar("ALERT", "Ip is required ");
        return false;
      }
    }

    return true;
  }

  Future<bool> Fnc_WValidateUser() async {
    ModUserProfile? l_ModUserProfile = await new SlwUserLogin().Fnc_UserProfile(
        txtEmail.txtController.text.toString(), txtPass.text.toString());
    if (l_ModUserProfile == null) {
      Get.snackbar("Alert", "Invalid Login Information");
      return false;
    }
    cmGlobalVariables.Pb_UserDID = l_ModUserProfile.Pr_PKGUID;
    cmGlobalVariables.Pb_UserName = l_ModUserProfile.Pr_FullName;
    cmGlobalVariables.Pb_UserEmail = l_ModUserProfile.Pr_EmailID;
    cmGlobalVariables.Pb_UserNumber = l_ModUserProfile.Pr_ContactNo;

    Get.snackbar("Alert", "Login Successful");

    return true;
  }

  Future<bool> Fnc_EValidateUser() async {
    ModUserProfile? l_ModUserProfile = await new SlEUserLogin()
        .Fnc_EUserProfile(
            txtEmail.txtController.text.toString(), txtPass.text.toString());
    if (l_ModUserProfile == null) {
      Get.snackbar("Alert", "Invalid Login Information");
      return false;
    }
    cmGlobalVariables.Pb_UserDID = l_ModUserProfile.Pr_PKGUID;

    Get.snackbar("Alert", "Login Successful");

    return true;
  }

//#endregion

  Future<bool> Fnc_OnlineProcedures() async {
    List<ModCompanySettingQuery>? l_list_CompanyList =
        new List<ModCompanySettingQuery>.empty(growable: true);

    l_list_CompanyList = await new SlwLogin().WLogin_Api_Call(
        txtEmail.txtController.text.toString(), txtPass.text.toString());

    if (l_list_CompanyList == null) {
      Get.snackbar("Alert", "Invalid Login Information");
      return false;
    }
    RxList<ModCompanySettingQuery>? l_Rxlist_CompanyList =
        <ModCompanySettingQuery>[].obs;
    l_Rxlist_CompanyList.addAll(l_list_CompanyList);
    //Put that list to an container
    Get.put(l_Rxlist_CompanyList, tag: "l_ListCompanyList");

    return true;
  }

  Future<bool> Fnc_OfflineProcedures() async {
    String? l_Token;
    //offlineCall 1st
    cmGlobalVariables.Pb_ERPApiUrl = txtIPAddress.txtController.text.toString();

    l_Token = await new SlEOfflineToken().Fnc_OfflineTokenApiCall(
        txtEmail.txtController.text.toString(),
        txtPass.text.toString(),
        txtIPAddress.txtController.text.toString());

    if (l_Token == null) {
      Get.snackbar("Alert", "Invalid Login Information");
      return false;
    }
    cmGlobalVariables.Pb_Token = l_Token;
    cmGlobalVariables.Pb_ERPApiUrl = txtIPAddress.txtController.text.toString();
    //forcheck
    cmGlobalVariables.Pb_ERP_API = txtIPAddress.txtController.text.toString();

    //2ndCall

    List<ModAssignedBranches>? l_list_AssignedBranches =
        new List<ModAssignedBranches>.empty(growable: true);

    //cmGlobalVariables.Pb_AisoneErpURL = cmGlobalVariables.Pb_AisoneErpURL;
    l_list_AssignedBranches =
        await new SlEAssignedBranches().Fnc_AssignedBranches();

    if (l_list_AssignedBranches == null) {
      Get.snackbar(
          "Alert", "No Branch Assigned, Please Contact Your Administrator");
      return false;
    }

    RxList<ModAssignedBranches>? l_Rxlist_AssignedBranches =
        <ModAssignedBranches>[].obs;
    l_Rxlist_AssignedBranches.addAll(l_list_AssignedBranches);

    //Put that list to an container
    Get.put(l_Rxlist_AssignedBranches, tag: "Rx_AssignedBranches");

    Get.snackbar("Info", "Login Successful");

    return true;
  }

  void login_DB() {
    if (isChecked) {
      box1.put('txtEmail', txtEmail.txtController.text);
      box1.put('txtIPAddress', txtIPAddress.txtController.text);
      box1.put('txtPass', txtPass.text);
    }
  }
}
