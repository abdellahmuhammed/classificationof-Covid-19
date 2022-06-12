class CovidStatics {
  dynamic updated;
  dynamic country;
  CountryInfo countryInfo;
  dynamic cases;
  dynamic todayCases;
  dynamic deaths;
  dynamic todayDeaths;
  dynamic recovered;
  dynamic active;
  dynamic tests;
  CovidStatics(
      {this.updated,
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.active,
        this.tests,
        });

  CovidStatics.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    active = json['active'];
    tests = json['tests'];
  }
}

class CountryInfo {
  dynamic iId;
  dynamic iso2;
  dynamic iso3;
  dynamic lat;
  dynamic long;
  dynamic flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = json['lat'];
    long = json['long'];
    flag = json['flag'];
  }

}
