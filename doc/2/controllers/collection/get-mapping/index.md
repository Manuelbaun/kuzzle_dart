---
code: true
type: page
title: getMapping
description: Returns the collection mapping
---

# getMapping

Returns the collection mapping.

<br/>

```dart
Future<Map<String, dynamic>> getMapping(String index, String collection,
      {bool includeKuzzleMeta = false})
```

<br/>

| Arguments    | Type              | Description     |
| ------------ | ----------------- | --------------- |
| `index`      | <pre>String</pre> | Index name      |
| `collection` | <pre>String</pre> | Collection name |
| `includeKuzzleMeta`| <pre>bool</pre> | Wether or not you want to include the metadata mapping |

## Returns

Returns a `Future<Map<String, dynamic>>` representing the collection mapping.

## Usage

<<< ./snippets/get-mapping.dart
