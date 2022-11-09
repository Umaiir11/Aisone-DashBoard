import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../Models/EModel/ModItemQuery.dart';
import '../../ClassModules/cmGlobalVariables.dart';

var SelectedItem;

class UWDropDownItem extends StatelessWidget {
  UWDropDownItem({
    this.ItemAsString,
    this.OnChanged,
    this.LabelText,
    this.HintText,
  });

  final DropdownSearchItemAsString<ModItemQuery>? ItemAsString;
  final ValueChanged<ModItemQuery?>? OnChanged;
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
      hintText: HintText,
      hintStyle: TextStyle(color: Colors.black26),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );

    return DropdownSearch<ModItemQuery>(
      selectedItem: SelectedItem,
      dropdownDecoratorProps:
          DropDownDecoratorProps(dropdownSearchDecoration: l_InputDecoration),
      popupProps: const PopupProps.menu(
        itemBuilder: _customPopupItemBuilder,
        fit: FlexFit.tight,
        menuProps: MenuProps(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            elevation: 2,
            backgroundColor: Color(0xFF88ECF8)),
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

  Future<List<ModItemQuery>> Fnc_ApiCall() async {


    List<ModItemQuery>? l_listModItemQuery =
        new List<ModItemQuery>.empty(growable: true);

    l_listModItemQuery = await cmGlobalVariables.Pbl_Rxlist_ItemQuery;

    final l_ListModCustomerQuery = l_listModItemQuery!;
    return l_ListModCustomerQuery;
  }
}

Widget _customDropDownPrograms(BuildContext context, ModItemQuery? item) {
  return Container(
    child: (item == null)
        ? const ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Search Items",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 13, color: Color.fromARGB(235, 158, 158, 158))),
          )
        : Row(
            children: [
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Wrap(
                    spacing: 8,
                    children: [
                      Text(
                        item!.Pr_ItemID.toString(),
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Text(item!.Pr_ItemDescr.toString(),
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

Widget _customPopupItemBuilder(
    BuildContext context, ModItemQuery? item, bool isSelected) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: ListTile(
            title: Wrap(
              spacing: 8,
              children: [
                Text(
                  item!.Pr_ItemID.toString(),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Text(item!.Pr_ItemDescr.toString(),
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
