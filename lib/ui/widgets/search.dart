import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
  });
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF767680).withOpacity(.12),
        border: Border.all(
            color: const Color(0xFF767680).withOpacity(.12), width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search User',
            prefixIcon: Icon(
              Icons.search,
              color: const Color(0xFF3C3C43).withOpacity(.6),
            )),
      ),
    );
  }
}
