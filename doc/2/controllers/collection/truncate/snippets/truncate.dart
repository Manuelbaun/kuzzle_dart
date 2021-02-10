await kuzzle
  .collection
  .truncate('nyc-open-data', 'yellow-taxi');