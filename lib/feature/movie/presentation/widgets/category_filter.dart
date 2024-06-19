import 'package:flutter/material.dart';
import 'package:movie_series_app/feature/movie/presentation/pages/movie_list_page.dart';

class CategoryFilter extends StatefulWidget {
  final List<Category> categories;
  final Function(Category) onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  CategoryFilterState createState() => CategoryFilterState();
}

class CategoryFilterState extends State<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  for (var cat in widget.categories) {
                    cat.activeState = false;
                  }
                  category.activeState = true;
                });
                widget.onCategorySelected(category);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: category.activeState ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                child: Center(
                  child: Text(
                    category.name,
                    style:  TextStyle(color: category.activeState ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
