await kuzzle
  .collection
  .updateMapping('nyc-open-data', 'yellow-taxi', {
      'dynamic': false,
      '_meta': {
        'area': 'Panipokhari',
      },
      'properties': {
        'plate': { 'type': 'keyword' },
      },
    });