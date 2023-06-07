import 'package:flutter/material.dart';
import 'package:gameplayapp/enum/categorias.enum.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  final bool editMode;

  const Category({super.key, this.editMode = false});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
          ),
          CardCategory(
            image: 'x1.png',
            categoryName: Categorias.x1,
            editMode: widget.editMode,
          ),
          CardCategory(
            image: 'casual.png',
            categoryName: Categorias.casual,
            editMode: widget.editMode,
          ),
          CardCategory(
            image: 'ranked.png',
            categoryName: Categorias.campeonatos,
            editMode: widget.editMode,
          ),
        ],
      ),
    );
  }
}

class CardCategory extends StatefulWidget {
  final String image;
  final String categoryName;
  final bool editMode;

  const CardCategory(
      {super.key,
      required this.image,
      required this.categoryName,
      this.editMode = false});

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  bool selecionado = false;

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
          selecionado = !selecionado;
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
                const Color(0xff243189).withOpacity(selecionado ? 1 : 0.5),
                const Color(0xff1B2565).withOpacity(selecionado ? 1 : 0.5)
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
              opacity: AlwaysStoppedAnimation(selecionado ? 1 : 0.5),
            ),
            Text(
              widget.categoryName,
              style: GoogleFonts.rajdhani(
                color: Colors.white.withOpacity(selecionado ? 1 : 0.5),
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
