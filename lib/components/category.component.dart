import 'package:flutter/material.dart';
import 'package:gameplayapp/enum/categorias.enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Category extends StatefulWidget {
  final bool editMode;

  const Category({super.key, this.editMode = false});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CardCategoryClass> listaCategorias = [
    CardCategoryClass(nome: Categorias.ranqueada, selecionado: false),
    CardCategoryClass(nome: Categorias.campeonatos, selecionado: false),
    CardCategoryClass(nome: Categorias.casual, selecionado: false),
    CardCategoryClass(nome: Categorias.x1, selecionado: false)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 24.0, right: 16.0),
      child: Row(
        children: [
          CardCategory(
            image: 'ranked.png',
            categoryName: Categorias.ranqueada,
            editMode: widget.editMode,
            selecionado: listaCategorias[0].selecionado,
            callback: (val) async {
              if (val) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString(
                    'categoriaSelecionada', listaCategorias[0].nome);
              }
              setState(() {
                listaCategorias[0].selecionado = val;
                if (val) {
                  listaCategorias.asMap().forEach((index, category) {
                    if (index != 0) {
                      listaCategorias[index].selecionado = false;
                    }
                  });
                }
              });
            },
          ),
          CardCategory(
            image: 'x1.png',
            categoryName: Categorias.x1,
            editMode: widget.editMode,
            selecionado: listaCategorias[1].selecionado,
            callback: (val) async {
              if (val) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString(
                    'categoriaSelecionada', listaCategorias[1].nome);
              }
              setState(() {
                listaCategorias[1].selecionado = val;
                if (val) {
                  listaCategorias.asMap().forEach((index, category) {
                    if (index != 1) {
                      listaCategorias[index].selecionado = false;
                    }
                  });
                }
              });
            },
          ),
          CardCategory(
            image: 'casual.png',
            categoryName: Categorias.casual,
            editMode: widget.editMode,
            selecionado: listaCategorias[2].selecionado,
            callback: (val) async {
              if (val) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString(
                    'categoriaSelecionada', listaCategorias[2].nome);
              }
              setState(() {
                listaCategorias[2].selecionado = val;
                if (val) {
                  listaCategorias.asMap().forEach((index, category) {
                    if (index != 2) {
                      listaCategorias[index].selecionado = false;
                    }
                  });
                }
              });
            },
          ),
          CardCategory(
            image: 'ranked.png',
            categoryName: Categorias.campeonatos,
            editMode: widget.editMode,
            selecionado: listaCategorias[3].selecionado,
            callback: (val) async {
              if (val) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString(
                    'categoriaSelecionada', listaCategorias[3].nome);
              }

              setState(() {
                listaCategorias[3].selecionado = val;
                if (val) {
                  listaCategorias.asMap().forEach((index, category) {
                    if (index != 3) {
                      listaCategorias[index].selecionado = false;
                    }
                  });
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

typedef void BoolCallback(bool val);

class CardCategoryClass {
  String nome;
  bool selecionado;

  CardCategoryClass({required this.nome, required this.selecionado});
}

class CardCategory extends StatefulWidget {
  final String image;
  final String categoryName;
  final bool editMode;
  final BoolCallback callback;
  bool selecionado;

  CardCategory(
      {super.key,
      required this.image,
      required this.categoryName,
      this.editMode = false,
      required this.callback,
      required this.selecionado});

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  Widget retornaItemNormal() {
    return Container(
      width: 104,
      height: 120,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff243189), Color(0xff1B2565)]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            width: 48.0,
            height: 48.0,
            image: AssetImage("assets/categories/${widget.image}"),
          ),
          Text(
            widget.categoryName,
            style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontSize: 15.0,
            ),
          )
        ],
      ),
    );
  }

  Widget retornaItemSelecionavel() {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selecionado = !widget.selecionado;
          widget.callback(widget.selecionado);
        });
      },
      child: Container(
        width: 104,
        height: 120,
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xff243189)
                    .withOpacity(widget.selecionado ? 1 : 0.5),
                const Color(0xff1B2565)
                    .withOpacity(widget.selecionado ? 1 : 0.5)
              ]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 48.0,
              height: 48.0,
              image: AssetImage("assets/categories/${widget.image}"),
              opacity: AlwaysStoppedAnimation(widget.selecionado ? 1 : 0.5),
            ),
            Text(
              widget.categoryName,
              style: GoogleFonts.rajdhani(
                color: Colors.white.withOpacity(widget.selecionado ? 1 : 0.5),
                fontSize: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.editMode ? retornaItemSelecionavel() : retornaItemNormal();
  }
}
