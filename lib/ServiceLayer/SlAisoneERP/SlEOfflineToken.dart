import 'dart:convert';

import '../../ClassModules/cmCryptography.dart';
import '../../ClassModules/cmHttpCalls.dart';

class SlEOfflineToken {
  Future<String?> Fnc_OfflineTokenApiCall(
      String l_EmailID, String l_Password,String IpAddress) async {
    try {
      Map<String, String> Pr_OfflineApi = {
        'pr_EmailID': l_EmailID,
        'pr_Password': new cmCryptography().Fnc_Encrypt_AES(l_Password),
        'pr_CompanyDID': "00000000-0000-0000-0000-000000000000"
      };
      String l_jsonString = json.encode(Pr_OfflineApi);
      List<int> l_UtfContent = utf8.encode(l_jsonString);
      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseOfflineToken('/ApiOfflineToken/Post', l_UtfContent);
      try {
        if (l_response.statusCode == 200) {
          return json.decode(json.encode(l_response.body));
        }
      } catch (ex) {
        print(ex.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
