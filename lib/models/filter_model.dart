class Filter {
  Filter({this.skip, this.dateFrom, this.dateTo, this.chef});

  final int? skip;
  final DateTime? dateFrom, dateTo;
  final String? chef;

  Map<String, dynamic> toMap() => {
        if (skip != null) 'skip': skip,
        if (dateFrom != null) 'date_from': dateFrom!.toIso8601String() + 'Z',
        if (dateTo != null) 'date_to': dateTo!.toIso8601String() + 'Z',
        if (chef != null) 'chef': chef,
      };
}
