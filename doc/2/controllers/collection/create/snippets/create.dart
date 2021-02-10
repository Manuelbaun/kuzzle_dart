await kuzzle
  .collection
  .create(
    'nyc-open-data',
    'yellow-taxi',
    mapping: <String, dynamic>{
  'properties': <String, dynamic>{
    'license': <String, dynamic>{
      'type': 'keyword',
    },
  },
});