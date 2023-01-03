import 'package:flutter/material.dart';

typedef VoidCallbacParam(int index);

class BottomNavigatorBarMunicipio extends StatelessWidget {
  VoidCallbacParam voidCallbackParam;
  int currentIndex;

  BottomNavigatorBarMunicipio(
    this.voidCallbackParam,
    this.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: voidCallbackParam,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Listar Municipios",
          // backgroundColor: Colrs.green.shade900,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar Municipio",
        ),
        /* BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: "Actualizar Municipio",
        ),*/
      ],
    );
  }
}
