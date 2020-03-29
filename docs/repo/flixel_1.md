Starting a HaxeFlixel Project
Will Blanton
images/flixel_1/cover.png

---

# Intro

This guide is a supplement to the [Getting Started](http://haxeflixel.com/documentation/getting-started/) guide on the official HaxeFlixel site. Go do that first!

Here you'll go through some things I usually do when starting a project.

---

# Editing Project.xml

Your `Project.xml` has a bunch of settings that you may want to tweak! Let's go through some now!

Find the line that looks like this:

```xml
<app title="MyProject" file="MyProject" main="Main" version="0.0.1" company="HaxeFlixel" />
```

During the course of your project, your game's name may change. I wouldn't worry about changing the name of the directory or anything like that, but you will want to change the `title` and `file` to reflect the game's current name! You should also change `company` to your company or name. You can change `version` as you update your game too.

Next we'll take a look at some `window` options:

```xml
<window width="480" height="640" fps="60" background="#000000" hardware="true" vsync="false" />
```

Here you may want to change the width and height of your game! For instance, if you wanted to make a game that looks like it could have been one released on GameBoy, you'd want to change your width and height to something like `width="160" height="144"` - or even better, you can set it higher so people don't have to squint: `width="640" height="576"`. Don't worry, you can set your game's resolution independently from your window's resolution, we'll cover that later!

Under the `Libraries` section you'll see flixel and several others. Don't worry about this right now, but once you get a hang of what libraries you like using, it's nice to go ahead and set them up right off the bat.

Under the `Haxedefines` section you'll see a bunch of haxedef entries. These can tell the compiler to ignore or not ignore sections of flixel's (or your own) code! You don't need to know exactly how this works right now, but it's good to read through these so you can have an understanding of features that you may want to turn on or off in the future!

If you do want to know more about Haxedefines, you can read up on [Conditional Compilation](https://haxe.org/manual/lf-condition-compilation.html) in Haxe!

---

# Editing Main.hx

Open up `Main.hx` - this is the entry point for your program! If you write a piece of code that isn't referenced by this class or by code referenced by this class (or by code referenced by code referenced by this class, etc.) your program will never run it!

Check out this line in particular:

```haxe
addChild(new FlxGame(0, 0, PlayState));
```

This is where your game is first set up! `FlxGame`'s constructor takes a bunch of arguments:
- GameWidth and GameHeight - this is the size of your game! On the last page we talked about making a game mimicking the GameBoy, and we talked about setting the window's width and height to 640 and 576. If we wanted our game to look like it's still at 160 by 144 pixels, we'd set `GameWidth` to 160 and `GameHeight` to 144! Leaving these at 0, flixel will automatically set the size of your game to the size of the window.
- InitialState - this is the first `FlxState` your game will load. If you wanted to add a `TitleScreen` or `MenuState` you'd want to replace `PlayState` with whichever state you'd want to appear when your game first loads.
- Zoom - All of the rest of the arguments are omitted in the original code, but you can set them if you want! Zoom will set the default zoom levels of all of your cameras in game.
- UpdateFramerate and DrawFramerate - These will set the framerate of all the logic (`UpdateFramerate`) and graphics (`DrawFramerate`) in your game. They both default to 60.
- SkipSplash - if you set this to false, it will skip the Flixel splash screen when your game starts.

---

# Creating import.hx

Sometimes as you're coding it might get annoying constantly importing classes. Maybe you find yourself importing `flixel.FlxSprite` into almost every class you're making. By using `import.hx` you're able to import things once and have access to them across your entire project, making your code cleaner and your work faster!

Create a file called `import.hx` in your source folder (it should be in the same place as `Main.hx`) and import any classes you want access to across your entire project! I wouldn't recommend putting _everything_ in here, just things you use all the time!

Example `import.hx`:
```haxe
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
```

---

# Next Steps

From here you're mostly on your own! Check out more tutorials, experiment, and have fun!

Here are some little tips that will hopefully serve you well:
- Compile and run now, and often! It's inevitable that you'll run into bugs while making your game. If you test your game often you'll hopefully catch bugs as you code them.
- Code quickly and fix things as you go. It's important to learn the right way of doing things, but it's also really important to fail fast! You're going to screw up a lot, and rather than spinning your wheels afraid to do something the wrong way, it's often way easier to just go at your natural pace and learn from your mistakes!
- On the same token, if you start to feel like your code is getting out of hand, don't be afraid to start over! I personally only get decent at something after doing it several times. That could mean rewriting a few hundred lines of code to apply lessons I've learned since writing it the first time, and in most cases that's usually a lot easier and quicker than trying to wrangle a mess of code into submission.

Good luck!