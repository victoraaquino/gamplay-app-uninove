import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({super.key});

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
        children: const [
          CardCategory(
            image: 'ranked.png',
            categoryName: 'Ranqueada',
          ),
          CardCategory(
            image: 'x1.png',
            categoryName: 'Duleo 1x1',
          ),
          CardCategory(
            image: 'casual.png',
            categoryName: 'Diversão',
          ),
          CardCategory(
            image: 'ranked.png',
            categoryName: 'Campeonatos',
          ),
        ],
      ),
    );
  }
}

class CardCategory extends StatefulWidget {
  const CardCategory(
      {super.key, required this.image, required this.categoryName});

  final String image;
  final String categoryName;

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  @override
  Widget build(BuildContext context) {
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
}
