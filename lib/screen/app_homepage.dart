import 'package:flutter/material.dart';
import 'package:sample/utilis/widgets/bottom_custom_navigation_bar.dart';
import 'package:sample/utilis/widgets/custom_textfield.dart';
import 'package:sample/utilis/widgets/custom_widget.dart';
import '../data/repository/home_model.dart';
import '../data/repository/home_repository.dart';
import '../data/repository/local_db.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Model>>? eventsFuture;
  List<Model> allEvents = [];
  List<Model> filteredEvents = [];
  String searchQuery = "";
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      List<Model> events = await fetchEventsFromApi();
      setState(() {
        allEvents = events;
        filteredEvents = events;
      });
    } catch (e) {
      print('Fetching events from API failed: $e');
      try {
        List<Model> localEvents = await DatabaseHelper.getAllEvents();
        setState(() {
          allEvents = localEvents;
          filteredEvents = localEvents;
        });
      } catch (e) {
        print('Fetching events from local database failed: $e');
      }
    }
  }

  void searchEvents(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredEvents = allEvents;
      } else {
        filteredEvents = allEvents.where((event) {
          return event.title!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void filterEvents(String? category) {
    setState(() {
      selectedCategory = category;
      if (category == null || category.isEmpty) {
        filteredEvents = allEvents;
      } else {
        filteredEvents = allEvents.where((event) {
          return event.eventCategory == category;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('DEMO APP'),
        elevation: 10,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              onChanged: searchEvents,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton<String>(
                hint: Text("Select Category"),
                value: selectedCategory,
                onChanged: filterEvents,
                items: <String>['sports', 'Entertainment', 'Fitness']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(width: 10,),
            ],

          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                Model event = filteredEvents[index];
                return CustomContainer(
                  model: event,
                  title: event.title ?? "",
                  imageurl: event.image?.isNotEmpty == true ? event.image![0] : "",
                  likes: event.likes ?? 0,
                  description: event.description ?? "",
                  comments: event.comments?.length ?? 0,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    ),);
  }
}
