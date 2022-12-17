import 'package:conexio_dart_api/model/school/school_list_model.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_getId_Detail.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List listas;
  List value;
  CustomSearchDelegate(this.listas, this.value);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    List listaIds = [];
    dynamic? ides;
    var name;
    if (listas.length == 0) {
      matchQuery.clear();
      matchQuery.add("Problema al cargar la lista");
    } else {
      matchQuery.clear();
      for (var fruit in listas) {
        name = getjson(fruit);
        //print("Imprimiendo metodod //////////// ${name.toString()}");
        if (name == null) {
          matchQuery.clear();
          matchQuery.add("Error el atributo no existe dentro de la instancia");

          break;
        }
        for (var datos = 1; datos <= value.length - 1; datos++) {
          if (name['${value[datos]}']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
            matchQuery.clear();
            matchQuery.add(name['${value[1]}']);
            print("Fuera del if del for 2 lista listaIds: " + name.toString());
            break;
          }
        }
      }
      if (matchQuery.length == 0) {
        matchQuery.clear();
        matchQuery.add("Dato no encontrado_______");
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        //var ident = listaIds[index];

        //for (var fruit in listas) {}

        return ListTile(
          title: Text(result),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SchoolGetIdDetail(listas[index])));
            print("Imprimiendo ldesde build resulta accion ontap: " +
                result.toString());
          },
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    if (listas.length == 0) {
      matchQuery.clear();
      matchQuery.add("Problema al cargar la lista");
    } else {
      matchQuery.clear();
      for (var fruit in listas) {
        var name = getjson(fruit);

        if (name == null) {
          matchQuery.clear();
          matchQuery.add("No se encontro el atributo");
          break;
        }
        for (var datos = 1; datos <= value.length - 1; datos++) {
          if (name['${value[datos]}']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
            //matchQuery.clear();

            matchQuery.add(name['${value[1]}'].toString());
            break;
          }
        }
        /*if (name['${value[1]}']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          matchQuery.add(name['${value[1]}'].toString());
        }*/
      }
      if (matchQuery.length == 0) {
        matchQuery.clear();
        matchQuery.add("Sugerencias no encontradas...");
      }
      print(
          "Final for buldSuggestions <=====================================>");
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        //var resu = name.toString();
        return ListTile(
          title: Text(result),
          onTap: () {
            /*Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SchoolGetIdDetail(listas[index])));
            print("Imprimiendo ldesde build resulta accion ontap: " +
                result.toString());*/
            print("hola: " + result.toString());
          },
        );
      },
    );
  }

  Map<String, dynamic>? getjson(dynamic fruit) {
    switch (value[0]) {
      case 'escuelas':
        Schols enco = fruit;
        var name = enco.toJson();
        return name;
      //break;

      default:
        return null;
    }
  }
}
