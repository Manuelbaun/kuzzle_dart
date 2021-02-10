---
code: true
type: page
title: deleteSpecifications
description: Delete validation specifications for a collection
---

# deleteSpecifications

Deletes validation specifications for a collection.

<br/>

```dart
Future<Map<String, dynamic>> deleteSpecifications(
    String index, String collection)
```

<br/>

| Arguments    | Type              | Description     |
| ------------ | ----------------- | --------------- |
| `index`      | <pre>String</pre> | Index name      |
| `collection` | <pre>String</pre> | Collection name |

## Returns

Returns a `Future<Map<String, dynamic>>`.

## Usage

<<< ./snippets/delete-specifications.dart