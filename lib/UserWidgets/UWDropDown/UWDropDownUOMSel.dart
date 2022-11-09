import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../Models/EModel/ModUomSelectionQuery.dart';
import '../../ServiceLayer/SlAisoneERP/SlEUomSelQuery.dart';

class UWDropDownUOMSel extends StatelessWidget {
  UWDropDownUOMSel({
    this.ItemAsString,
    this.OnChanged,
    this.LabelText,
    this.HintText,
  });

  final DropdownSearchItemAsString<ModUOMSelectionQuery>? ItemAsString;
  final ValueChanged<ModUOMSelectionQuery?>? OnChanged;
  final String? LabelText;
  final String? HintText;

  @override
  Widget build(BuildContext context) {
    InputDecoration l_InputDecoration = InputDecoration(
      labelText: LabelText,
      hintText: HintText,
      hintStyle: TextStyle(color: Colors.black26),
      floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon:Icon(MdiIcons.accountHardHat, size: 20, color: Colors.indigo),
      border: OutlineInputBorder(
        gapPadding: 3.0,
      ),
    );

    return DropdownSearch<ModUOMSelectionQuery>(
      dropdownDecoratorProps:
          DropDownDecoratorProps(dropdownSearchDecoration: l_InputDecoration),
      popupProps: PopupProps.menu(
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
      //dropdownBuilder: _customDropDownPrograms,
      asyncItems: (text) {
        return Fnc_ApiCall();
      },
      itemAsString: ItemAsString,
      onChanged: OnChanged,
    );
  }

  Future<List<ModUOMSelectionQuery>> Fnc_ApiCall() async {
    List<ModUOMSelectionQuery>? l_listModUOM =
        new List<ModUOMSelectionQuery>.empty(growable: true);

    l_listModUOM = await SlEUomSelectionQuery().Fnc_UomQuery();
    final l_ListModCustomerQuery = l_listModUOM!;
    return l_ListModCustomerQuery;
  }
}

Widget _customPopupItemBuilder(
    BuildContext context, ModUOMSelectionQuery? item, bool isSelected) {
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
                  item!.Pr_UOMID.toString(),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Text(item!.Pr_UOMGroupID.toString(),
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
Widget _customDropDownPrograms(
    BuildContext context, ModUOMSelectionQuery? item) {
  return Container(
    child: (item == null)
        ? const ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "   Uom",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black26,
                fontSize: 11,
              ),
            ),
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
                        item!.Pr_UOMID.toString(),
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Text(item!.Pr_UOMGroupID.toString(),
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
