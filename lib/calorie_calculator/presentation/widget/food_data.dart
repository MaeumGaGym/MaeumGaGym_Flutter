List<FoodDataModel> basicsFoodData = [
  FoodDataModel(
    image: 'assets/image/core_icon/logo.png',
    foodName: '감자',
    g: 215,
    selected: true,
    category: ['전체', '채소'],
    kcal: 430,
    plate: '중접시',
    unitValue: 1,
    unit: '줄',
    constantG: 215,
    isGram: false,
  ),
  FoodDataModel(
    image: 'assets/image/core_icon/logo.png',
    foodName: '감자',
    g: 215,
    selected: true,
    category: ['전체', '채소'],
    kcal: 430,
    plate: '중접시',
    unitValue: 1,
    unit: '줄',
    constantG: 215,
    isGram: false,
  ),
  FoodDataModel(
    image: 'assets/image/core_icon/logo.png',
    foodName: '감자',
    g: 215,
    selected: true,
    category: ['전체', '채소'],
    kcal: 430,
    plate: '중접시',
    unitValue: 1,
    unit: '줄',
    constantG: 215,
    isGram: false,
  ),
  FoodDataModel(
    image: 'assets/image/core_icon/logo.png',
    foodName: '감자',
    g: 215,
    selected: true,
    category: ['전체', '채소'],
    kcal: 430,
    plate: '중접시',
    unitValue: 1,
    unit: '줄',
    constantG: 215,
    isGram: false,
  ),
];

class FoodDataModel {
  String image, foodName, plate, unit;
  int g, kcal, unitValue, constantG;
  List<String> category;
  bool selected, isGram;

  FoodDataModel({
    required this.image,
    required this.foodName,
    required this.plate,
    required this.unit,
    required this.g,
    required this.selected,
    required this.kcal,
    required this.unitValue,
    required this.constantG,
    required this.category,
    required this.isGram,
  });

  FoodDataModel copyWith({
    String? image,
    String? foodName,
    String? plate,
    String? unit,
    int? g,
    bool? selected,
    int? kcal,
    int? unitValue,
    int? constantG,
    List<String>? category,
    bool? isGram,
  }) {
    return FoodDataModel(
      image: image ?? this.image,
      foodName: foodName ?? this.foodName,
      plate: plate ?? this.plate,
      unit: unit ?? this.unit,
      g: g ?? this.g,
      selected: selected ?? this.selected,
      kcal: kcal ?? this.kcal,
      unitValue: unitValue ?? this.unitValue,
      constantG: constantG ?? this.constantG,
      category: category ?? this.category,
      isGram: isGram ?? this.isGram,
    );
  }
}
