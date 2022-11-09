import 'dart:convert';

import '../../ClassModules/cmCryptography.dart';
import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/ModUserProfile.dart';

class SlEUserLogin {
  Future<ModUserProfile?> Fnc_EUserProfile(String l_Email, String l_Password) async {
    try {
      final body = {

        "pr_EmailID":l_Email ,
        "pr_Password": new cmCryptography().Fnc_Encrypt_AES(l_Password),
        "pr_CompanyDID": "00000000-0000-0000-0000-000000000000"
      };

      //Uri.https('192.168.145.190','/apiUser/UserProfile/Post');
      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseERP('/UserProfileQuery/Fnc_Read_SP', l_UtfContent);
      print(l_response);
      if (l_response.statusCode == 200) {
        return Fnc_JsonToModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModUserProfile Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModUserProfile l_ModUserProfile = new ModUserProfile();

    l_ModUserProfile.Pr_PKGUID = l_JsonObject["pr_PKGUID"];
    l_ModUserProfile.Pr_EmailID = l_JsonObject["pr_EmailID"];
    l_ModUserProfile.Pr_FullName = l_JsonObject["pr_FullName"];
    l_ModUserProfile.Pr_ContactNo = l_JsonObject["pr_ContactNo"];
    l_ModUserProfile.Pr_Image = l_JsonObject["pr_Image"];

    return l_ModUserProfile;
  }

  //Method return list type
  List<ModUserProfile> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    //Declare Local Variable For list Of Model and instance

    List<ModUserProfile> l_ListModUserProfile =
    new List<ModUserProfile>.empty(growable: true);

    //Start Irritation From Json String

    for (dynamic l_JsonObject in l_JsonList) {
      ModUserProfile l_ModUserProfile = new ModUserProfile();
      l_ModUserProfile = Fnc_JsonToModel(l_JsonObject);
      l_ListModUserProfile.add(l_ModUserProfile);
    }
    return l_ListModUserProfile;
  }
}
