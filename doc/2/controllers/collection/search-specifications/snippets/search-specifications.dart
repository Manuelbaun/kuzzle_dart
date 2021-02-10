final result = await kuzzle
  .collection
  .searchSpecifications(
    'nyc-open-data',
    query: {
      'query': {
        'match_all': {}
      }
    }, 
    from: 0, 
    size: 50, 
    scroll: '10s');