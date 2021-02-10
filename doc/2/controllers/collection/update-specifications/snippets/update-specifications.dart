final result = await kuzzle
  .collection
  .updateSpecifications('nyc-open-data', 'yellow-taxi', {
    'fields': {
      'license': {
        'type': 'string',
        'mandatory': true,
      },
    },
    'strict': false,
  });
