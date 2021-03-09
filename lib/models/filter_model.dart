class Filter {
  const Filter(
      {this.skip, this.dateFrom, this.dateTo, this.chef, this.popular});

  final int? skip;
  final DateTime? dateFrom, dateTo;
  final String? chef;
  final bool? popular;

  Filter copyWith({
    int? skip,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? chef,
    bool? popular,
  }) =>
      Filter(
        skip: skip ?? this.skip,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        chef: chef ?? this.chef,
        popular: popular ?? this.popular,
      );

  Map<String, dynamic> toMap() => {
        if (skip != null) 'skip': skip,
        if (dateFrom != null) 'date_from': dateFrom!.toIso8601String() + 'Z',
        if (dateTo != null) 'date_to': dateTo!.toIso8601String() + 'Z',
        if (chef != null) 'chef': chef,
        if (popular != null) 'popular': popular,
      };
}
