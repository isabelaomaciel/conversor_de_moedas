import 'package:meta/meta.dart';
import 'dart:convert';

class HgBrasil {
  final String by;
  final bool validKey;
  final Results results;
  final double executionTime;
  final bool fromCache;

  HgBrasil({
    required this.by,
    required this.validKey,
    required this.results,
    required this.executionTime,
    required this.fromCache,
  });

  factory HgBrasil.fromRawJson(String str) => HgBrasil.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HgBrasil.fromJson(Map<String, dynamic> json) => HgBrasil(
    by: json["by"],
    validKey: json["valid_key"],
    results: Results.fromJson(json["results"]),
    executionTime: json["execution_time"],
    fromCache: json["from_cache"],
  );

  Map<String, dynamic> toJson() => {
    "by": by,
    "valid_key": validKey,
    "results": results.toJson(),
    "execution_time": executionTime,
    "from_cache": fromCache,
  };
}

class Results {
  final Currencies currencies;
  final Stocks stocks;
  final List<String> availableSources;
  final Bitcoin bitcoin;
  final List<Tax> taxes;

  Results({
    required this.currencies,
    required this.stocks,
    required this.availableSources,
    required this.bitcoin,
    required this.taxes,
  });

  factory Results.fromRawJson(String str) => Results.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    currencies: Currencies.fromJson(json["currencies"]),
    stocks: Stocks.fromJson(json["stocks"]),
    availableSources: List<String>.from(json["available_sources"].map((x) => x)),
    bitcoin: Bitcoin.fromJson(json["bitcoin"]),
    taxes: List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "currencies": currencies.toJson(),
    "stocks": stocks.toJson(),
    "available_sources": List<dynamic>.from(availableSources.map((x) => x)),
    "bitcoin": bitcoin.toJson(),
    "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
  };
}

class Bitcoin {
  final Bitstamp blockchainInfo;
  final Coinbase coinbase;
  final Bitstamp bitstamp;
  final Coinbase foxbit;
  final Bitstamp mercadobitcoin;

  Bitcoin({
    required this.blockchainInfo,
    required this.coinbase,
    required this.bitstamp,
    required this.foxbit,
    required this.mercadobitcoin,
  });

  factory Bitcoin.fromRawJson(String str) => Bitcoin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bitcoin.fromJson(Map<String, dynamic> json) => Bitcoin(
    blockchainInfo: Bitstamp.fromJson(json["blockchain_info"]),
    coinbase: Coinbase.fromJson(json["coinbase"]),
    bitstamp: Bitstamp.fromJson(json["bitstamp"]),
    foxbit: Coinbase.fromJson(json["foxbit"]),
    mercadobitcoin: Bitstamp.fromJson(json["mercadobitcoin"]),
  );

  Map<String, dynamic> toJson() => {
    "blockchain_info": blockchainInfo.toJson(),
    "coinbase": coinbase.toJson(),
    "bitstamp": bitstamp.toJson(),
    "foxbit": foxbit.toJson(),
    "mercadobitcoin": mercadobitcoin.toJson(),
  };
}

class Bitstamp {
  final String name;
  final List<String> format;
  final double last;
  final double buy;
  final double sell;
  final double variation;

  Bitstamp({
    required this.name,
    required this.format,
    required this.last,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  factory Bitstamp.fromRawJson(String str) => Bitstamp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bitstamp.fromJson(Map<String, dynamic> json) => Bitstamp(
    name: json["name"],
    format: List<String>.from(json["format"].map((x) => x)),
    last: json["last"]?.toDouble(),
    buy: json["buy"]?.toDouble(),
    sell: json["sell"]?.toDouble(),
    variation: json["variation"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "format": List<dynamic>.from(format.map((x) => x)),
    "last": last,
    "buy": buy,
    "sell": sell,
    "variation": variation,
  };
}

class Coinbase {
  final String name;
  final List<String> format;
  final double last;
  final double variation;

  Coinbase({
    required this.name,
    required this.format,
    required this.last,
    required this.variation,
  });

  factory Coinbase.fromRawJson(String str) => Coinbase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coinbase.fromJson(Map<String, dynamic> json) => Coinbase(
    name: json["name"],
    format: List<String>.from(json["format"].map((x) => x)),
    last: json["last"]?.toDouble(),
    variation: json["variation"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "format": List<dynamic>.from(format.map((x) => x)),
    "last": last,
    "variation": variation,
  };
}

class Currencies {
  final String source;
  final Ars usd;
  final Ars eur;


  Currencies({
    required this.source,
    required this.usd,
    required this.eur,

  });

  factory Currencies.fromRawJson(String str) => Currencies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    source: json["source"],
    usd: Ars.fromJson(json["USD"]),
    eur: Ars.fromJson(json["EUR"]),

  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "USD": usd.toJson(),
    "EUR": eur.toJson(),

  };
}

class Ars {
  final String name;
  final double buy;
  final double sell;
  final double variation;

  Ars({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  factory Ars.fromRawJson(String str) => Ars.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ars.fromJson(Map<String, dynamic> json) => Ars(
    name: json["name"],
    buy: json["buy"]?.toDouble(),
    sell: json["sell"]?.toDouble(),
    variation: json["variation"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "buy": buy,
    "sell": sell,
    "variation": variation,
  };
}

class Stocks {
  final Cac ibovespa;
  final Cac ifix;
  final Cac nasdaq;
  final Cac dowjones;
  final Cac cac;
  final Cac nikkei;

  Stocks({
    required this.ibovespa,
    required this.ifix,
    required this.nasdaq,
    required this.dowjones,
    required this.cac,
    required this.nikkei,
  });

  factory Stocks.fromRawJson(String str) => Stocks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stocks.fromJson(Map<String, dynamic> json) => Stocks(
    ibovespa: Cac.fromJson(json["IBOVESPA"]),
    ifix: Cac.fromJson(json["IFIX"]),
    nasdaq: Cac.fromJson(json["NASDAQ"]),
    dowjones: Cac.fromJson(json["DOWJONES"]),
    cac: Cac.fromJson(json["CAC"]),
    nikkei: Cac.fromJson(json["NIKKEI"]),
  );

  Map<String, dynamic> toJson() => {
    "IBOVESPA": ibovespa.toJson(),
    "IFIX": ifix.toJson(),
    "NASDAQ": nasdaq.toJson(),
    "DOWJONES": dowjones.toJson(),
    "CAC": cac.toJson(),
    "NIKKEI": nikkei.toJson(),
  };
}

class Cac {
  final String name;
  final String location;
  final double points;
  final double variation;

  Cac({
    required this.name,
    required this.location,
    required this.points,
    required this.variation,
  });

  factory Cac.fromRawJson(String str) => Cac.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cac.fromJson(Map<String, dynamic> json) => Cac(
    name: json["name"],
    location: json["location"],
    points: json["points"]?.toDouble(),
    variation: json["variation"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "location": location,
    "points": points,
    "variation": variation,
  };
}

class Tax {
  final DateTime date;
  final double cdi;
  final double selic;
  final double dailyFactor;
  final double selicDaily;
  final double cdiDaily;

  Tax({
    required this.date,
    required this.cdi,
    required this.selic,
    required this.dailyFactor,
    required this.selicDaily,
    required this.cdiDaily,
  });

  factory Tax.fromRawJson(String str) => Tax.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    date: DateTime.parse(json["date"]),
    cdi: json["cdi"]?.toDouble(),
    selic: json["selic"]?.toDouble(),
    dailyFactor: json["daily_factor"]?.toDouble(),
    selicDaily: json["selic_daily"]?.toDouble(),
    cdiDaily: json["cdi_daily"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "cdi": cdi,
    "selic": selic,
    "daily_factor": dailyFactor,
    "selic_daily": selicDaily,
    "cdi_daily": cdiDaily,
  };
}
