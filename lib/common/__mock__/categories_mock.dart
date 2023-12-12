import '../../data/models/category_model.dart';

class MockData {
  static List<CategoryModel> categoriesData = [
    const CategoryModel(
      name: 'EATING',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'EXPENSES',
          type: 'COFFEE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'DRINKING',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'RESTAURANT',
        ),
      ],
    ),
    const CategoryModel(
      name: 'FRIEND_AND_LOVER',
      type: 'EXPENSES',
    ),
    const CategoryModel(
      name: 'MOVE',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'MAINTENANCE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'PARKING',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'TAXI',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'OIL',
        ),
      ],
    ),
    const CategoryModel(
      name: 'FAMILY',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'CHILDREN',
          type: 'EXPENSES',
        ),
        CategoryModel(
          name: 'HOME_REPAIR',
          type: 'EXPENSES',
        ),
        CategoryModel(
          name: 'HOME_SERVICE',
          type: 'EXPENSES',
        ),
        CategoryModel(
          name: 'PETS',
          type: 'EXPENSES',
        ),
      ],
    ),
    const CategoryModel(
      name: 'TRAVELING',
      type: 'EXPENSES',
    ),
    const CategoryModel(
      name: 'SHOPPING',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'CLOTHES',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'ACCESSORY',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'ELECTRONIC_DEVICE',
        ),
      ],
    ),
    const CategoryModel(
      name: 'DONATE',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'WEDDING',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'FUNERAL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'CHARITY',
        ),
      ],
    ),
    const CategoryModel(
      name: 'BILLS_AND_UTILITIES',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'ELECTRIC_BILL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'RENT_HOUSE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'TV_BILL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'GAS_BILL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'WATER_BILL',
        ),
      ],
    ),
    const CategoryModel(
      name: 'INVESTMENT',
      type: 'EXPENSES',
    ),
    const CategoryModel(
      name: 'OTHER',
      type: 'EXPENSES',
    ),
    const CategoryModel(
      name: 'EDUCATION',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'BOOK',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'COURSE',
        ),
      ],
    ),
    const CategoryModel(
      name: 'HEALTH',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'PERSONAL_HYGIENE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'HEALTHCARE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'MEDICINE',
        ),
      ],
    ),
    const CategoryModel(
      name: 'BUSINESS',
      type: 'EXPENSES',
    ),
    const CategoryModel(
      name: 'SELL_THINGS',
      type: 'REVENUE',
    ),
    const CategoryModel(
      name: 'SALARY',
      type: 'REVENUE',
    ),
    const CategoryModel(
      name: 'BONUS',
      type: 'REVENUE',
    ),
    const CategoryModel(
      name: 'LIVING_EXPENSE',
      type: 'REVENUE',
    ),
    const CategoryModel(
      name: 'AWARDED',
      type: 'REVENUE',
    ),
    const CategoryModel(
      name: 'OTHER',
      type: 'REVENUE',
    ),
    const CategoryModel(
      name: 'DEBT_COLLECTION',
      type: 'DEBTS_AND_LOAN',
    ),
    const CategoryModel(
      name: 'BORROW',
      type: 'DEBTS_AND_LOAN',
    ),
    const CategoryModel(
      name: 'LOAN',
      type: 'DEBTS_AND_LOAN',
    ),
    const CategoryModel(
      name: 'PAY',
      type: 'DEBTS_AND_LOAN',
    ),
  ];
}
