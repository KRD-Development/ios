# (iOS) Core Data Tutorial

## Objective
This is a repository to store the starter and final versions of the app for my Core Data tutorial on Medium.

### Tutorial Links
Part 1: [(iOS) Core Data Tutorial — Part 1: Terminology](https://link.medium.com/0cZ3jzMU8U)

Part 2: [(iOS) Core Data Tutorial — Part 2: Build a ToDo app with Core Data](https://link.medium.com/KtOnc1JU8U)

## App Overview
This is a ToDo app which is built using Core Data. The final app has the following functionalities.

- Add ToDos
- Swipe to delete a ToDo
- Realtime update of UI using `NSFetchedResultsController`

## ToDo Entity attributes
- todoName: String
- todoDescription: String
- dateCreated: Date  
  Using this attribute for sorting.
- todoImage: Binary Data  
  `Allow External Storage` is set to be true.