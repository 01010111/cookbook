Autotiling
Will Blanton
images/autotiling/cover.png

---

# Intro

Autotiling is a great way to automatically generate art using a set number of tiles - you could use it for terrain, roadways, any much, much more.

This tutorial is done in Haxe, it's pretty similar to Javascript, but it's a little bit different. You'll also need a way of displaying Tilemaps - I'm not going to cover that here!

---

# Making a Tileset

The first thing you'll need to do is create a tileset! It will be a grid of 16 different tiles, each of them will be created as if they have a relationship to a tile above it, below it, to the left, and to the right. Take a look at this image:

![](images/autotiling/autotiles.png)

Travelling across it from left to right and then top to bottom you'll notice:
- Every other tile is created to link up with a tile above it.
- Every four tiles, the third and fourth tile have links to tiles below them.
- Every eight tiles, the fifth, sixth, seventh and eighth tiles have links to tiles to the left of them.
- The last eight tiles have links to tiles to the right of them.
- Every relationship between tiles (cardinally) is covered!

---

# Set up Autotiling

The code to make the process of autotiling automatic is pretty easy! We just assume that an incoming array is made up of `0`'s and `1`'s and we want the output to be an array with indexes to tiles in our tileset.

First, let's set up the function, we need an input for a 2D Array, and it will output another 2D Array:

```haxe
function autotile(input:Array<Array<Int>>):Array<Array<Int>> {
	var out = [];

	return out;
}
```

Next, we need to loop through all the tile indexes of the input array:

```haxe
function autotile(input:Array<Array<Int>>):Array<Array<Int>> {
	var out = [];
	for (j in 0...input.length) for (i in 0...input[j].length) {

	}
	return out;
}
```

Let's go ahead and set a default value for out output array, we'll check to make sure that the output has a nested array, then we'll set the default value of every index in it to 0:

```haxe
function autotile(input:Array<Array<Int>>):Array<Array<Int>> {
	var out = [];
	for (j in 0...input.length) for (i in 0...input[j].length) {
		if (out[j] == null) out[j] = [];
		out[j][i] = 0;
	}
	return out;
}
```

The next step is to skip any autotiling logic if the input index at this position is `0` - we'll keep our output index at `0` and continue on:

```haxe
function autotile(input:Array<Array<Int>>):Array<Array<Int>> {
	var out = [];
	for (j in 0...input.length) for (i in 0...input[j].length) {
		if (out[j] == null) out[j] = [];
		out[j][i] = 0;
		if (input[j][i] == 0) continue;
	}
	return out;
}
```

Now, the magic part, we'll check every direction in the input array, and add the correct number according to the current tile's relationship to the ones around it, in this order: UP, DOWN, LEFT, and RIGHT:

```haxe
function autotile(input:Array<Array<Int>>):Array<Array<Int>> {
	var out = [];
	for (j in 0...input.length) for (i in 0...input[j].length) {
		if (out[j] == null) out[j] = [];
		out[j][i] = 0;
		if (input[j][i] == 0) continue;
		if (input[j - 1][i] == 1) out[j][i] += 1;
		if (input[j + 1][i] == 1) out[j][i] += 2;
		if (input[j][i - 1] == 1) out[j][i] += 4;
		if (input[j][i + 1] == 1) out[j][i] += 8;
	}
	return out;
}
```

You might run into some problems with this code - for instance, if you're checking the tile above the current tile, and the current tile is at the top of the array, you won't have anything to check! So let's add some logic to make sure we don't check for tiles that don't exist:

```haxe
function autotile(input:Array<Array<Int>>):Array<Array<Int>> {
	var out = [];
	for (j in 0...input.length) for (i in 0...input[j].length) {
		if (out[j] == null) out[j] = [];
		out[j][i] = 0;
		if (input[j][i] == 0) continue;
		if (j > 0 && input[j - 1][i] == 1) out[j][i] += 1;
		if (j < input.length - 1 && input[j + 1][i] == 1) out[j][i] += 2;
		if (i > 0 && input[j][i - 1] == 1) out[j][i] += 4;
		if (i < input[j].length - 1 && input[j][i + 1] == 1) out[j][i] += 8;
	}
	return out;
}
```

That should do it! Let's take it for a spin!

---

# Testing It Out

The cover for this tutorial was made by initializing an array with random values, and then running our `autotile()` function on it:

```haxe
var data = [for (i in 0...20) [for (i in 0...20) Math.random() > 0.25 ? 1 : 0]];
data = autotile(data);
```

Try manually creating an array for your tilemap:

```haxe
var data = [
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 1, 1, 1, 0],
	[0, 1, 1, 1, 1, 1, 1, 0],
	[0, 1, 1, 0, 0, 1, 1, 0],
	[0, 1, 1, 0, 0, 1, 1, 0],
	[0, 1, 1, 1, 1, 1, 1, 0],
	[0, 1, 1, 1, 1, 1, 1, 0],
	[0, 0, 0, 0, 0, 0, 0, 0],
];
```

![](images/autotiling/manual.png)

---

# Next Steps

Now that you know how to use autotiling, there are tons of things you can try with it!
- Try it with diagonals (notice how many more tiles you need!)
- Try it along with procedural map generation like [this one](http://www.roguebasin.com/index.php?title=Basic_BSP_Dungeon_generation)!
- Think of other fun things to do with this! They don't have to have anything to do with tiles!