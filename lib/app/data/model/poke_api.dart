import 'dart:convert';

// To parse this JSON data, do
//
//     final pokeApi = pokeApiFromJson(jsonString);

List<PokeApi> pokeApiFromJson(str) =>
    List<PokeApi>.from(str.map((x) => PokeApi.fromJson(x)));

String pokeApiToJson(List<PokeApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokeApi {
  PokeApi({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.prevEvolution,
    this.nextEvolution,
  });

  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<Evolution> prevEvolution;
  List<Evolution> nextEvolution;

  factory PokeApi.fromJson(Map<String, dynamic> json) => PokeApi(
        id: json["id"] == null ? null : json["id"],
        num: json["num"] == null ? null : json["num"],
        name: json["name"] == null ? null : json["name"],
        img: json["img"] == null ? null : json["img"],
        type: json["type"] == null
            ? null
            : List<String>.from(json["type"].map((x) => x)),
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        candy: json["candy"] == null ? null : json["candy"],
        candyCount: json["candy_count"] == null ? null : json["candy_count"],
        egg: json["egg"] == null ? null : json["egg"],
        spawnChance: json["spawn_chance"] == null
            ? null
            : json["spawn_chance"].toDouble(),
        avgSpawns:
            json["avg_spawns"] == null ? null : json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"] == null ? null : json["spawn_time"],
        multipliers: json["multipliers"] == null
            ? null
            : List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: json["weaknesses"] == null
            ? null
            : List<String>.from(json["weaknesses"].map((x) => x)),
        prevEvolution: json["prev_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["prev_evolution"].map((x) => Evolution.fromJson(x))),
        nextEvolution: json["next_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["next_evolution"].map((x) => Evolution.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "num": num == null ? null : num,
        "name": name == null ? null : name,
        "img": img == null ? null : img,
        "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "candy": candy == null ? null : candy,
        "candy_count": candyCount == null ? null : candyCount,
        "egg": egg == null ? null : egg,
        "spawn_chance": spawnChance == null ? null : spawnChance,
        "avg_spawns": avgSpawns == null ? null : avgSpawns,
        "spawn_time": spawnTime == null ? null : spawnTime,
        "multipliers": multipliers == null
            ? null
            : List<dynamic>.from(multipliers.map((x) => x)),
        "weaknesses": weaknesses == null
            ? null
            : List<dynamic>.from(weaknesses.map((x) => x)),
        "prev_evolution": prevEvolution == null
            ? null
            : List<dynamic>.from(prevEvolution.map((x) => x.toJson())),
        "next_evolution": nextEvolution == null
            ? null
            : List<dynamic>.from(nextEvolution.map((x) => x.toJson())),
      };
}

class Evolution {
  Evolution({
    this.num,
    this.name,
  });

  String num;
  String name;

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"] == null ? null : json["num"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "num": num == null ? null : num,
        "name": name == null ? null : name,
      };
}
