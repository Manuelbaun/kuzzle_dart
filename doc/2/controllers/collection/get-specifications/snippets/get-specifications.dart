final result = await kuzzle
  .collection
  .getSpecifications('nyc-open-data', 'yellow-taxi');