final result = await kuzzle
  .collection
  .validateSpecifications('nyc-open-data', 'yellow-taxi', {
    'fields': {
      'license': {
        'type': 'string',
        'mandatory': true,
      },
    },
    'strict': false,
  });
