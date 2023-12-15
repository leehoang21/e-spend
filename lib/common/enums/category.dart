enum CategoryType {
  expense,
  revenue,
  debtsAndLoan,
  eating,
  drinking,
  restaurant,
  coffee,
  move,
  maintenance,
  parking,
  taxi,
  oil,
  friendAndLover,
  family,
  children,
  homeRepair,
  homeService,
  pets,
  traveling,
  shopping,
  clothes,
  accessory,
  electronicDevice,
  donate,
  wedding,
  funeral,
  charity,
  billsAndUtilities,
  electricBill,
  rentHouse,
  tvBill,
  gasBill,
  waterBill,
  investment,
  other,
  education,
  book,
  course,
  heath,
  personalHygiene,
  healthcare,
  medicine,
  business,
  sellThings,
  salary,
  bonus,
  livingExpense,
  awarded,
  otherRevenue,
  debtCollection,
  borrow,
  loan,
  pay,
  debt,
}

extension CategoryTypeExtension on CategoryType {
  String get title {
    switch (this) {
      case CategoryType.expense:
        return 'EXPENSES';
      case CategoryType.revenue:
        return 'REVENUE';
      case CategoryType.debtsAndLoan:
        return 'DEBTS_AND_LOAN';
      case CategoryType.eating:
        return 'EATING';
      case CategoryType.drinking:
        return 'DRINKING';
      case CategoryType.restaurant:
        return 'RESTAURANT';
      case CategoryType.coffee:
        return 'COFFEE';
      case CategoryType.move:
        return 'MOVE';
      case CategoryType.maintenance:
        return 'MAINTENANCE';
      case CategoryType.parking:
        return 'PARKING';
      case CategoryType.taxi:
        return 'TAXI';
      case CategoryType.oil:
        return 'OIL';
      case CategoryType.friendAndLover:
        return 'FRIEND_AND_LOVER';
      case CategoryType.family:
        return 'FAMILY';
      case CategoryType.children:
        return 'CHILDREN';
      case CategoryType.homeRepair:
        return 'HOME_REPAIR';
      case CategoryType.homeService:
        return 'HOME_SERVICE';
      case CategoryType.pets:
        return 'PETS';
      case CategoryType.traveling:
        return 'TRAVELING';
      case CategoryType.shopping:
        return 'SHOPPING';
      case CategoryType.clothes:
        return 'CLOTHES';
      case CategoryType.accessory:
        return 'ACCESSORY';
      case CategoryType.electronicDevice:
        return 'ELECTRONIC_DEVICE';
      case CategoryType.donate:
        return 'DONATE';
      case CategoryType.wedding:
        return 'WEDDING';
      case CategoryType.funeral:
        return 'FUNERAL';
      case CategoryType.charity:
        return 'CHARITY';
      case CategoryType.billsAndUtilities:
        return 'BILLS_AND_UTILITIES';
      case CategoryType.electricBill:
        return 'ELECTRIC_BILL';
      case CategoryType.rentHouse:
        return 'RENT_HOUSE';
      case CategoryType.tvBill:
        return 'TV_BILL';
      case CategoryType.gasBill:
        return 'GAS_BILL';
      case CategoryType.waterBill:
        return 'WATER_BILL';
      case CategoryType.investment:
        return 'INVESTMENT';
      case CategoryType.other:
        return 'OTHER';
      case CategoryType.education:
        return 'EDUCATION';
      case CategoryType.book:
        return 'BOOK';
      case CategoryType.course:
        return 'COURSE';
      case CategoryType.heath:
        return 'HEATH';
      case CategoryType.personalHygiene:
        return 'PERSONAL_HYGIENE';
      case CategoryType.healthcare:
        return 'HEALTHCARE';
      case CategoryType.medicine:
        return 'MEDICINE';
      case CategoryType.business:
        return 'BUSINESS';
      case CategoryType.sellThings:
        return 'SELL_THINGS';
      case CategoryType.salary:
        return 'SALARY';
      case CategoryType.bonus:
        return 'BONUS';
      case CategoryType.livingExpense:
        return 'LIVING_EXPENSE';
      case CategoryType.awarded:
        return 'AWARDED';
      case CategoryType.otherRevenue:
        return 'OTHER';
      case CategoryType.debtCollection:
        return 'DEBT_COLLECTION';
      case CategoryType.borrow:
        return 'BORROW';
      case CategoryType.loan:
        return 'LOAN';
      case CategoryType.pay:
        return 'PAY';
      case CategoryType.debt:
        return 'DEBT';
      default:
        return '';
    }
  }

  String get type {
    switch (this) {
      case CategoryType.expense:
        return 'EXPENSES';
      case CategoryType.revenue:
        return 'REVENUE';
      case CategoryType.debtsAndLoan:
        return 'DEBTS_AND_LOAN';
      case CategoryType.eating:
        return 'EXPENSES';
      case CategoryType.drinking:
        return 'EXPENSES';
      case CategoryType.restaurant:
        return 'EXPENSES';
      case CategoryType.coffee:
        return 'EXPENSES';
      case CategoryType.move:
        return 'EXPENSES';
      case CategoryType.maintenance:
        return 'EXPENSES';
      case CategoryType.parking:
        return 'EXPENSES';
      case CategoryType.taxi:
        return 'EXPENSES';
      case CategoryType.oil:
        return 'EXPENSES';
      case CategoryType.friendAndLover:
        return 'EXPENSES';
      case CategoryType.family:
        return 'EXPENSES';
      case CategoryType.children:
        return 'EXPENSES';
      case CategoryType.homeRepair:
        return 'EXPENSES';
      case CategoryType.homeService:
        return 'EXPENSES';
      case CategoryType.pets:
        return 'EXPENSES';
      case CategoryType.traveling:
        return 'EXPENSES';
      case CategoryType.shopping:
        return 'EXPENSES';
      case CategoryType.clothes:
        return 'EXPENSES';
      case CategoryType.accessory:
        return 'EXPENSES';
      case CategoryType.electronicDevice:
        return 'EXPENSES';
      case CategoryType.donate:
        return 'EXPENSES';
      case CategoryType.wedding:
        return 'EXPENSES';
      case CategoryType.funeral:
        return 'EXPENSES';
      case CategoryType.charity:
        return 'EXPENSES';
      case CategoryType.billsAndUtilities:
        return 'EXPENSES';
      case CategoryType.electricBill:
        return 'EXPENSES';
      case CategoryType.rentHouse:
        return 'EXPENSES';
      case CategoryType.tvBill:
        return 'EXPENSES';
      case CategoryType.gasBill:
        return 'EXPENSES';
      case CategoryType.waterBill:
        return 'EXPENSES';
      case CategoryType.investment:
        return 'EXPENSES';
      case CategoryType.other:
        return 'EXPENSES';
      case CategoryType.education:
        return 'EXPENSES';
      case CategoryType.book:
        return 'EXPENSES';
      case CategoryType.course:
        return 'EXPENSES';
      case CategoryType.heath:
        return 'EXPENSES';
      case CategoryType.personalHygiene:
        return 'EXPENSES';
      case CategoryType.healthcare:
        return 'EXPENSES';
      case CategoryType.medicine:
        return 'EXPENSES';
      case CategoryType.business:
        return 'EXPENSES';
      case CategoryType.sellThings:
        return 'EXPENSES';
      case CategoryType.salary:
        return 'REVENUE';
      case CategoryType.bonus:
        return 'REVENUE';
      case CategoryType.livingExpense:
        return 'REVENUE';
      case CategoryType.awarded:
        return 'REVENUE';
      case CategoryType.otherRevenue:
        return 'REVENUE';
      case CategoryType.debtCollection:
        return 'DEBTS_AND_LOAN';
      case CategoryType.borrow:
        return 'DEBTS_AND_LOAN';
      case CategoryType.loan:
        return 'DEBTS_AND_LOAN';
      case CategoryType.pay:
        return 'DEBTS_AND_LOAN';
      case CategoryType.debt:
        return 'DEBTS_AND_LOAN';
      default:
        return '';
    }
  }

  CategoryType get categoryType {
    switch (this) {
      case CategoryType.expense:
        return CategoryType.expense;
      case CategoryType.revenue:
        return CategoryType.revenue;
      case CategoryType.debtsAndLoan:
        return CategoryType.debtsAndLoan;
      case CategoryType.eating:
        return CategoryType.expense;
      case CategoryType.drinking:
        return CategoryType.expense;
      case CategoryType.restaurant:
        return CategoryType.expense;
      case CategoryType.coffee:
        return CategoryType.expense;
      case CategoryType.move:
        return CategoryType.expense;
      case CategoryType.maintenance:
        return CategoryType.expense;
      case CategoryType.parking:
        return CategoryType.expense;
      case CategoryType.taxi:
        return CategoryType.expense;
      case CategoryType.oil:
        return CategoryType.expense;
      case CategoryType.friendAndLover:
        return CategoryType.expense;
      case CategoryType.family:
        return CategoryType.expense;
      case CategoryType.children:
        return CategoryType.expense;
      case CategoryType.homeRepair:
        return CategoryType.expense;
      case CategoryType.homeService:
        return CategoryType.expense;
      case CategoryType.pets:
        return CategoryType.expense;
      case CategoryType.traveling:
        return CategoryType.expense;
      case CategoryType.shopping:
        return CategoryType.expense;
      case CategoryType.clothes:
        return CategoryType.expense;
      case CategoryType.accessory:
        return CategoryType.expense;
      case CategoryType.electronicDevice:
        return CategoryType.expense;
      case CategoryType.donate:
        return CategoryType.expense;
      case CategoryType.wedding:
        return CategoryType.expense;
      case CategoryType.funeral:
        return CategoryType.expense;
      case CategoryType.charity:
        return CategoryType.expense;
      case CategoryType.billsAndUtilities:
        return CategoryType.expense;
      case CategoryType.electricBill:
        return CategoryType.expense;
      case CategoryType.rentHouse:
        return CategoryType.expense;
      case CategoryType.tvBill:
        return CategoryType.expense;
      case CategoryType.gasBill:
        return CategoryType.expense;
      case CategoryType.waterBill:
        return CategoryType.expense;
      case CategoryType.investment:
        return CategoryType.expense;
      case CategoryType.other:
        return CategoryType.expense;
      case CategoryType.education:
        return CategoryType.expense;
      case CategoryType.book:
        return CategoryType.expense;
      case CategoryType.course:
        return CategoryType.expense;
      case CategoryType.heath:
        return CategoryType.expense;
      case CategoryType.personalHygiene:
        return CategoryType.expense;
      case CategoryType.healthcare:
        return CategoryType.expense;
      case CategoryType.medicine:
        return CategoryType.expense;
      case CategoryType.business:
        return CategoryType.expense;
      case CategoryType.sellThings:
        return CategoryType.expense;
      case CategoryType.salary:
        return CategoryType.revenue;
      case CategoryType.bonus:
        return CategoryType.revenue;
      case CategoryType.livingExpense:
        return CategoryType.revenue;
      case CategoryType.awarded:
        return CategoryType.revenue;
      case CategoryType.otherRevenue:
        return CategoryType.revenue;
      case CategoryType.debtCollection:
        return CategoryType.debt;
      case CategoryType.borrow:
        return CategoryType.debt;
      case CategoryType.loan:
        return CategoryType.loan;
      case CategoryType.pay:
        return CategoryType.loan;
      case CategoryType.debt:
        return CategoryType.debt;
      default:
        return CategoryType.expense;
    }
  }
}
