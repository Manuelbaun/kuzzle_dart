final result = await kuzzle
  .collection
  .getMapping('nyc-open-data', 'yellow-taxi');
