class food {
  String name;

  food(this.name);

  factory food.fromJson(Map<String, dynamic> data) {
    return food(data['name']);
  }
}

class drink {
  String name;

  drink(this.name);

  factory drink.fromJson(Map<String, dynamic> data) {
    return drink(data['name']);
  }
}

class menus {
  List foods;
  List drinks;

  menus(this.foods, this.drinks);

  factory menus.fromJson(Map<String, dynamic> data) {
    return menus((data['foods'] as List).map((e) => e).toList(),
        (data['drinks'] as List).map((e) => e).toList());
  }
}

class restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  String rating;
  menus menu;

  restaurant(this.id, this.name, this.description, this.pictureId, this.city,
      this.rating, this.menu);

  factory restaurant.fromJson(Map<String, dynamic> data) {
    return restaurant(
        data['id'],
        data['name'],
        data['description'],
        data['pictureId'],
        data['city'],
        data['rating'].toString(),
        menus.fromJson(data['menus']));
  }
}
