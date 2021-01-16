enum CardRace {
  equip,
  beast,
  normal,
  rock,
  ritual,
  fairy,
  insect,
  dragon,
  machine,
  warrior,
  field,
  fiend,
  dinosaur,
  spellcaster,
  continuous,
  zombie,
  mai,
  keith,
  beastWarrior,
  yamiYugi,
  kaiba,
  wingedBeast,
  quickPlay,
  bonz,
  mako,
  counter,
  aqua,
  weevil,
  fish,
  yugi,
  david,
  rex,
  odion,
  christine,
  reptile,
  ishizu,
  joey,
  yamiMarik,
  joeyWheeler,
  seaSerpent,
  yamiBakura,
  pegasus,
  espaRoba,
  setoKaiba,
  pyro,
  andrew,
  arkana,
  maiValentine,
  divineBeast,
  teaGardner,
  ishizuIshtar,
  emma,
  lumisUmbra,
  unknown,
}

CardRace parseCardRace(String value) {
  switch (value.toLowerCase()) {
    case 'equip':
      return CardRace.equip;
    case 'beast':
      return CardRace.beast;
    case 'normal':
      return CardRace.normal;
    case 'rock':
      return CardRace.rock;
    case 'ritual':
      return CardRace.ritual;
    case 'fairy':
      return CardRace.fairy;
    case 'insect':
      return CardRace.insect;
    case 'dragon':
      return CardRace.dragon;
    case 'machine':
      return CardRace.machine;
    case 'warrior':
      return CardRace.warrior;
    case 'field':
      return CardRace.field;
    case 'fiend':
      return CardRace.fiend;
    case 'dinosaur':
      return CardRace.dinosaur;
    case 'spellcaster':
      return CardRace.spellcaster;
    case 'continuous':
      return CardRace.continuous;
    case 'zombie':
      return CardRace.zombie;
    case 'mai':
      return CardRace.mai;
    case 'keith':
      return CardRace.keith;
    case 'beast-warrior':
      return CardRace.beastWarrior;
    case 'yami yugi':
      return CardRace.yamiYugi;
    case 'kaiba':
      return CardRace.kaiba;
    case 'winged beast':
      return CardRace.wingedBeast;
    case 'quick-play':
      return CardRace.quickPlay;
    case 'bonz':
      return CardRace.bonz;
    case 'mako':
      return CardRace.mako;
    case 'counter':
      return CardRace.counter;
    case 'aqua':
      return CardRace.aqua;
    case 'weevil':
      return CardRace.weevil;
    case 'fish':
      return CardRace.fish;
    case 'yugi':
      return CardRace.yugi;
    case 'david':
      return CardRace.david;
    case 'rex':
      return CardRace.rex;
    case 'odion':
      return CardRace.odion;
    case 'christine':
      return CardRace.christine;
    case 'reptile':
      return CardRace.reptile;
    case 'ishizu':
      return CardRace.ishizu;
    case 'joey':
      return CardRace.joey;
    case 'yami marik':
      return CardRace.yamiMarik;
    case 'joey wheeler':
      return CardRace.joeyWheeler;
    case 'sea serpent':
      return CardRace.seaSerpent;
    case 'yami bakura':
      return CardRace.yamiBakura;
    case 'pegasus':
      return CardRace.pegasus;
    case 'espa roba':
      return CardRace.espaRoba;
    case 'seto kaiba':
      return CardRace.setoKaiba;
    case 'pyro':
      return CardRace.pyro;
    case 'andrew':
      return CardRace.andrew;
    case 'arkana':
      return CardRace.arkana;
    case 'mai valentine':
      return CardRace.maiValentine;
    case 'divine-beast':
      return CardRace.divineBeast;
    case 'tea gardner':
      return CardRace.teaGardner;
    case 'ishizu ishtar':
      return CardRace.ishizuIshtar;
    case 'emma':
      return CardRace.emma;
    case 'lumis umbra':
      return CardRace.lumisUmbra;
    default:
      return CardRace.unknown;
  }
}
