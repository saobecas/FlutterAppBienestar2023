import 'package:flutter/material.dart';

typedef VoidCallbacParam(int index);

class BottomNavigatorBarRegion extends StatelessWidget {
  VoidCallbacParam voidCallbackParam;
  int currentIndex;

  BottomNavigatorBarRegion(
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
          label: "Listar Regiones",
          // backgroundColor: Colrs.green.shade900,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar Region",
        ),
        /* BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: "Actualizar Region",
        ),*/
      ],
    );
  }
}
