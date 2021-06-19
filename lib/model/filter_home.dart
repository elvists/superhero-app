class FilterHome {
  String search;
  bool isFemaleSelected;
  bool isMaleSelected;

  FilterHome(
      {this.search = "",
      this.isFemaleSelected = true,
      this.isMaleSelected = true});

  get isAllGenresSelected => isFemaleSelected && isFemaleSelected;
  get isNoneGenresSelected => !isFemaleSelected && !isFemaleSelected;
}
