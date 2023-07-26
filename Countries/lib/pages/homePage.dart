
import 'package:countries/pages/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../country.dart';
import '../theme_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Country>> futureCountry;


  @override
  void initState() {
    super.initState();
    futureCountry = CountryService().getCountry();
  }

  void runSearch(String keyword){
    late Future<List<Country>> result;
    if(keyword.isNotEmpty){
      result = CountryService().getCountrySearch(keyword);
    }
    else{
      result = CountryService().getCountry();
    }
    setState(() {
      futureCountry = result;
    });
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              SwitchListTile(value: themeState.getDarkTheme,
                  onChanged: (value){
                setState(() {
                  themeState.setDarkTheme = value;
                });
                  },
              secondary: Icon(themeState.getDarkTheme? Icons.dark_mode_outlined : Icons.light_mode_outlined),
              title: Text(themeState.getDarkTheme? "Dark Mode": "Light Mode"),)

            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextField(
              onChanged: runSearch,
              decoration: InputDecoration(
                  labelText: "Search Country",
                  labelStyle: TextStyle(
                      fontSize: 18
                  ),
                  suffixIcon: Icon(Icons.search_outlined)
              ),
            ),
            const SizedBox(height: 20,),
            FutureBuilder<List<Country>>(future: futureCountry,
              builder: (context,AsyncSnapshot snapshot){
                if (snapshot.hasData){
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context,index){
                        Country country = snapshot.data[index];
                        return ListTile(
                          title: Text(country.Name),
                          subtitle: Text(country.officialName),
                          onTap:() => navigate(context,country),
                          leading: SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.network(country.flag),
                          ),
                        );
                      },
                      separatorBuilder: (context,index){
                        return const Divider(color: Colors.blue,);
                      },
                      itemCount: snapshot.data.length,
                    ),
                  );
                } else if (snapshot.hasError){
                  return Text("ERROR ${snapshot.error}\n\n "
                      "Try Checking \n"
                      "The Internet Connection\n"
                      "The Spelling");
                }
                return CircularProgressIndicator();
              },

            ),
          ],
        ),
      ),
    );
  }
  void navigate(context,Country country){
    Navigator.push(context ,MaterialPageRoute(builder: (context) => DetailsPage(country: country)));
  }

}

