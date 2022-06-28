import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField(
      {Key? key,
      required this.onIconPressed,
      required this.placeHolderText,
      required this.searchController,
      required this.fillColor,
      required this.wantPadding})
      : super(key: key);

  final Function onIconPressed;
  final TextEditingController searchController;
  final String placeHolderText;
  final Color fillColor;
  final bool wantPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: wantPadding ? 25 : 0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () => onIconPressed(),
            icon: const Icon(
              Icons.search,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: placeHolderText,
          fillColor: fillColor,
          filled: true,
          hintStyle: GoogleFonts.roboto(
            color: ConstantColors.mainlyTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
