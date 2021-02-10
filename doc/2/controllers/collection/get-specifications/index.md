---
code: true
type: page
title: getSpecifications
description: Returns the validation specifications
---

# getSpecifications

Returns the validation specifications associated to the given index and collection.

<br/>

```dart
Future<Map<String, dynamic>> getSpecifications(
    String index, String collection)
```

<br/>

| Arguments    | Type              | Description     |
| ------------ | ----------------- | --------------- |
| `index`      | <pre>String</pre> | Index name      |
| `collection` | <pre>String</pre> | Collection name |

## Returns

Returns a `Future<Map<String, dynamic>>` representing the collection specifications.

## Usage

<<< ./snippets/get-specifications.dart