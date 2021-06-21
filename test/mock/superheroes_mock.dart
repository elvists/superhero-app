import 'package:superhero/model/appearance.dart';
import 'package:superhero/model/biography.dart';
import 'package:superhero/model/connections.dart';
import 'package:superhero/model/images.dart';
import 'package:superhero/model/powerstats.dart';
import 'package:superhero/model/superhero.dart';
import 'package:superhero/model/work.dart';

List<Superhero> mockSuperHeroesLongerList = [
  Superhero(
    name: "Black Widow",
    appearance: Appearance(race: "Human", gender: "Female"),
  ),
  Superhero(
    name: "Wonder Woman",
    appearance: Appearance(race: "Amazon", gender: "Female"),
  ),
  Superhero(
    name: "Captain Marvel",
    appearance: Appearance(race: "Human-Kree", gender: "Female"),
  ),
  Superhero(
    name: "Captain America",
    appearance: Appearance(race: "Human", gender: "Male"),
  ),
  Superhero(
    name: "Iron Man",
    appearance: Appearance(race: "Human", gender: "Male"),
  ),
  Superhero(
    name: "Ronin",
    appearance: Appearance(race: "Human", gender: "Male"),
  ),
  Superhero(
    name: "Hulk",
    appearance: Appearance(race: "Human / Radiation", gender: "Male"),
  ),
  Superhero(
    name: "Doctor Strange",
    appearance: Appearance(race: "Human", gender: "Male"),
  ),
  Superhero(
    name: "Batman",
    appearance: Appearance(race: "Human", gender: "Male"),
  ),
  Superhero(
    name: "Flash",
    appearance: Appearance(race: "Human", gender: "Male"),
  ),
  Superhero(
    name: "Superman",
    appearance: Appearance(race: "Kryptonian", gender: "Male"),
  ),
];

Superhero mockSuperHero = Superhero(
  name: "Captain Marvel",
  appearance: Appearance(
    race: "Human-Kree",
    gender: "Female",
    height: ["5'11", "180 cm"],
    weight: ["165 lb", "74 kg"],
    eyeColor: "Blue",
    hairColor: "Blond",
  ),
  biography: Biography(
    fullName: "Carol Danvers",
    alterEgos: "Binary, Warbird",
    aliases: [
      "Ace",
      "Binary",
      "Lady Marvel",
      "Warbird",
      "others used during her espionage career"
    ],
    placeOfBirth: "Boston, Massachusetts",
    firstAppearance: "Ms. Marvel #1",
    publisher: "Binary",
    alignment: "good",
  ),
  connections: Connections(
    groupAffiliation:
        "currently Avengers, former companion to the X-Men (as Carol Danvers), former member of the Starjammers (as Binary), Former Avenger (as Ms. Marvel)",
    relatives:
        "Marie Danvers (mother), Joseph Danvers, Sr. (father), Joseph Danvers, Jr. (brother), Steve Danvers (brother, deceased), Marcus Immortus (Danvers) (\"son\", deceased)",
  ),
  work: Work(
    occupation:
        "Former National Aeronautics and Space Administration security Chief, former magazine editor, former freelance writer, former military intelligence officer.",
    base: "Avengers Mansion",
  ),
  powerstats: Powerstats(
    intelligence: 84,
    strength: 88,
    speed: 71,
    durability: 95,
    power: 100,
    combat: 90,
  ),
  images: Images(sm: ""),
);

List<Superhero> mockSuperHeroesList = [
  Superhero(
    id: 1,
    name: "Batman",
    appearance: Appearance(race: "Human", gender: "Male"),
    images: Images(sm: ""),
  ),
  Superhero(
    id: 2,
    name: "Superman",
    appearance: Appearance(race: "Kryptonian", gender: "Male"),
    images: Images(sm: ""),
  ),
  Superhero(
    id: 3,
    name: "Captain Marvel",
    appearance: Appearance(race: "Human-Kree", gender: "Female"),
    images: Images(sm: ""),
  )
];
