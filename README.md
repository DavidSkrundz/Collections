# Collections

[![](https://img.shields.io/badge/Swift-4.2-orange.svg)][1]
[![](https://img.shields.io/badge/os-macOS%20|%20Linux-lightgray.svg)][1]
[![](https://travis-ci.com/DavidSkrundz/Collections.svg?branch=master)][2]
[![](https://codebeat.co/badges/d53737b4-70d6-440e-b28d-b54d2ceb5e50)][3]
[![](https://codecov.io/gh/DavidSkrundz/Collections/branch/master/graph/badge.svg)][4]

[1]: https://swift.org/download/#releases
[2]: https://travis-ci.com/DavidSkrundz/Collections
[3]: https://codebeat.co/projects/github-com-davidskrundz-collections
[4]: https://codecov.io/gh/DavidSkrundz/Collections

Various Collections and Data Structures

## Importing

```Swift
.package(url: "https://github.com/DavidSkrundz/Collections.git", .upToNextMinor(from: "1.2.0"))
```

Import one of the following:

- Generator
- Graph
- Pair

## `Generator`

Implements to `Iterator` but also allows reversing (`previous() -> Element?`)

## `Graph`

A basic graph class that implements:

```Swift
func neighbours(of vertex: Vertex<T>) -> [Vertex<T>]
func reachable(from vertex: Vertex<T>) -> [Vertex<T>]
reachable(from vertex: Vertex<T>, where canReach: (_ distance: Int, _ edge: U?) -> Bool) -> [Vertex<T>]
```

## `pair(_:_:)`

Like `zip(_:_:)` but returns a `Sequence` containing the cartesian product (all pairs) of the two sequences
