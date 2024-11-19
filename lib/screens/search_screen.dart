import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showFilters = false;
  bool showSuggestions = true;
  double minPrice = 5;
  double maxPrice = 250;

  List<String> trendingSearches = [
    "Trending Item 1",
    "Discount 50%",
    "Previous Search"
  ];
  List<String> sortOptions = [
    "Popular",
    "Lowest Price",
    "Highest Price",
    "Best Match",
    "Nearby"
  ];
  String selectedSortOption = "Popular";
  String deliveryOption = "Regular Delivery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          onTap: () {
            setState(() {
              showSuggestions = true;
              showFilters = false;
            });
          },
          onChanged: (value) {
            setState(() {
              showSuggestions = false;
            });
          },
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(Icons.filter_list, color: Colors.grey),
              onPressed: () {
                setState(() {
                  showFilters = !showFilters;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Suggestions/Results Section
          if (showSuggestions)
            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: trendingSearches.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.local_offer, color: Colors.blueAccent),
                    title: Text(
                      trendingSearches[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      setState(() {
                        showSuggestions = false;
                        showFilters = false;
                      });
                    },
                  ),
                );
              },
            ),

          // Filter Section
          if (showFilters)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Sort Options
                    Text(
                      "Sort By",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: sortOptions.map((option) {
                        return ChoiceChip(
                          label: Text(option),
                          selected: selectedSortOption == option,
                          selectedColor: Colors.blueAccent,
                          labelStyle: TextStyle(
                            color: selectedSortOption == option
                                ? Colors.white
                                : Colors.black,
                          ),
                          onSelected: (selected) {
                            setState(() {
                              selectedSortOption = option;
                            });
                          },
                        );
                      }).toList(),
                    ),

                    // Price Range Slider
                    SizedBox(height: 20),
                    Text(
                      "Price Range",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    RangeSlider(
                      values: RangeValues(minPrice, maxPrice),
                      min: 5,
                      max: 250,
                      divisions: 10,
                      labels: RangeLabels(
                        "\$${minPrice.round()}",
                        "\$${maxPrice.round()}",
                      ),
                      activeColor: Colors.blueAccent,
                      onChanged: (values) {
                        setState(() {
                          minPrice = values.start;
                          maxPrice = values.end;
                        });
                      },
                    ),

                    // Delivery Options
                    SizedBox(height: 20),
                    Text(
                      "Delivery Options",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ChoiceChip(
                          label: Text("Regular Delivery"),
                          selected: deliveryOption == "Regular Delivery",
                          selectedColor: Colors.blueAccent,
                          labelStyle: TextStyle(
                            color: deliveryOption == "Regular Delivery"
                                ? Colors.white
                                : Colors.black,
                          ),
                          onSelected: (selected) {
                            setState(() {
                              deliveryOption = "Regular Delivery";
                            });
                          },
                        ),
                        ChoiceChip(
                          label: Text("Emergency Delivery"),
                          selected: deliveryOption == "Emergency Delivery",
                          selectedColor: Colors.redAccent,
                          labelStyle: TextStyle(
                            color: deliveryOption == "Emergency Delivery"
                                ? Colors.white
                                : Colors.black,
                          ),
                          onSelected: (selected) {
                            setState(() {
                              deliveryOption = "Emergency Delivery";
                            });
                          },
                        ),
                      ],
                    ),

                    // Apply Button
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showFilters = false;
                        });
                      },
                      child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(
                            vertical: 14, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
