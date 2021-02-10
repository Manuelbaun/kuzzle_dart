---
code: true
type: page
title: truncate
description: Remove all documents from a collection
---

# truncate

Removes all documents from a collection, while keeping the associated mappings.

<br/>

```dart
Future<Map<String, dynamic>> truncate(String index, String collection)
```

<br/>

| Arguments    | Type              | Description     |
| ------------ | ----------------- | --------------- |
| `index`      | <pre>String</pre> | Index name      |
| `collection` | <pre>String</pre> | Collection name |

## Usage

<<< ./snippets/truncate.dart
