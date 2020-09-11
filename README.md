### Exmaples
    * Smooth Camera Follow
    * Maze generation algorithm

## Maze generation algorithm
![maze_algo](https://user-images.githubusercontent.com/7622553/92973337-5e076b80-f45a-11ea-87b1-2a25c47fcfb0.gif)

This algorithm is `recursive division method` to get a perfect maze. All the areas inside of it are reachable.
Each time, it will divide the areas called `chambers` in two smaller areas and will keep the proccess until all chambers are minimum sized. 

This is a modified version, The original algorithm was made by [xabi](https://xa.bi/)

### Instructions
To use it just call 
```
    var width = 41;
    var height = 41;
    List walls = RecursiveMaze()
        .build(width, height, orientationType: OrientationType.randomized);
```

You can see the demo in `examples/maze.dart`