final result = await kuzzle
  .collection
  .exists('nyc-open-data', 'yellow-taxi');