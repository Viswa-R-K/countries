import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../country.dart';


class DetailsPage extends StatelessWidget {
  final Country country;
  const DetailsPage({Key? key,required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String cName;
    late String cSymbol;
    dynamic value = country.currency;
    dynamic va = value.values;
    va.forEach((element) {
      cName = element['name'];
      cSymbol = element['symbol'];
    });
    final dynamic language = country.languages.values;
    return Scaffold(
      appBar: AppBar(
        title: Text(country.Name),
        centerTitle: true,
      ),
      body: Center(
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  SizedBox(height: 200,width: 250,child:Image.network(country.flag) ,),
                  ListTile(
                    title: Text("Common Name"),
                    subtitle:Text(country.Name) ,
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Official Name"),
                    subtitle: Text(country.officialName),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Capital(s)"),
                    subtitle: Text(country.capitalCity.toString().replaceAll('[', '').replaceAll(']', '')),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Coordinates"),
                    subtitle: Text(country.latLng.toString().replaceAll('[', '').replaceAll(']', '')),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Currency"),
                    subtitle: Text('$cName[$cSymbol]'),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Languages"),
                    subtitle: Text(language.toString().replaceAll('(', '').replaceAll(')', '')),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Time Zones"),
                    subtitle: Text(country.timeZone.toString().replaceAll('[', '').replaceAll(']', '')),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Area Occupied"),
                    subtitle: Text('${country.areaOccupied} sq. km'),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Top Level Domains"),
                    subtitle: Text(country.topDomains.toString().replaceAll('[', '').replaceAll(']', '')),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Population"),
                    subtitle:Text(country.population.toString()) ,
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Phone Code"),
                    subtitle: Text('root = ${country.phoneCode['root']} \n'
                        'suffix = ${country.phoneCode['suffixes']}'),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Region"),
                    subtitle: Text(country.region),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Car Driving Side"),
                    subtitle: Text(country.carSide),
                  ),
                  const SizedBox(height: 2.5,),
                  ListTile(
                    title: Text("Google Map link"),
                    subtitle: InkWell(
                      child: Text(country.mapLink),
                      onTap: () => launchUrl(Uri.encodeFull(country.mapLink) as Uri),
                    ),
                  )

                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
