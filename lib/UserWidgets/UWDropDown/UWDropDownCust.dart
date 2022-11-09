import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../Models/EModel/ModCustomerQuery.dart';
import '../../ClassModules/cmGlobalVariables.dart';



class UWDropDownCust extends StatelessWidget {
  UWDropDownCust(
      {this.ItemAsString,
        this.OnChanged,
        this.LabelText,
        this.HintText,
      });

  final DropdownSearchItemAsString<ModCustomerQuery>? ItemAsString;
  final ValueChanged<ModCustomerQuery?>? OnChanged;
  final String? LabelText;
  final String? HintText;

  @override
  Widget build(BuildContext context) {
    InputDecoration l_InputDecoration = InputDecoration(

      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      labelText: LabelText,
      labelStyle: TextStyle(color: Colors.black54,fontSize: 25),
      hintText: HintText,
      //hintStyle: TextStyle(fontSize: 20),
      hintStyle:  TextStyle(color: Colors.black54,fontSize: 25),

      floatingLabelBehavior: FloatingLabelBehavior.always,

    );

    return DropdownSearch<ModCustomerQuery>(
      dropdownDecoratorProps:
      DropDownDecoratorProps(dropdownSearchDecoration: l_InputDecoration),
      popupProps:  PopupProps.menu(
        itemBuilder: _customPopupItemBuilder,
        fit: FlexFit.tight,
        menuProps: MenuProps(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            elevation: 2,
            backgroundColor: Colors.lightBlueAccent.shade100),
        searchFieldProps: TextFieldProps(
            style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: .5)),
        showSearchBox: true,
      ),
      dropdownBuilder: _customDropDownPrograms,
      asyncItems: (text) {
        return Fnc_ApiCall();
      },
      itemAsString: ItemAsString,
      onChanged: OnChanged,
    );

  }
  Future<List<ModCustomerQuery>> Fnc_ApiCall() async {

    List<ModCustomerQuery>? l_listModItemQuery =
    new List<ModCustomerQuery>.empty(growable: true);

    l_listModItemQuery = await cmGlobalVariables.Pbl_Rxlist_CustomerQuery;
    final l_ListModCustomerQuery = l_listModItemQuery!;
    return l_ListModCustomerQuery;
  }

}



Widget _customPopupItemBuilder(
    BuildContext context, ModCustomerQuery? item, bool isSelected) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child:Row(
      children: [


        Expanded(
          flex: 2,

          child: ListTile(
            title: Wrap(
              spacing: 8,
              children: [

                Text(item!.Pr_AccountID.toString(),
                  style:TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),
            subtitle:Text(item!.Pr_Telephone1.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 102, 100, 100),
                )),
            trailing: Text(item!.Pr_CityID.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 102, 100, 100),
                )),
          ),
        ),
      ],
    ),
  );
}

//This for Drop Down Values
Widget _customDropDownPrograms(BuildContext context, ModCustomerQuery? item) {
  return Container(
    child: (item == null)
        ? const ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text("   Search Customer By Name",
          textAlign: TextAlign.start,
        style:TextStyle(color: Colors.black26,fontSize: 21,),),
    )
        :  Row(
      children: [


        Expanded(
          flex: 2,

          child: ListTile(
            title: Wrap(
                spacing: 8,
              children: [

                  Text(item!.Pr_AccountID.toString(),
                  style:TextStyle(color: Colors.black54,fontSize: 21,fontWeight: FontWeight.bold),),
                ],
            ),
            subtitle:Text(item!.Pr_Telephone1.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 102, 100, 100),
                )),
            trailing: Text(item!.Pr_CityID.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 102, 100, 100),
                )),
          ),
        ),
      ],
    ),);
}
