Animating Using Aseprite
Will Blanton
images/animating_aseprite/cover.gif

---

# Intro

This tutorial is going to quickly cover animating a character for a game in Aseprite.

---

# Start Simple

![](images/animating_aseprite/0_simple.png)

When I start off animating a new character, I like to start off very simple - just draw the basic shape of the character and make sure it reads ok.

---

# Add Some Detail

![](images/animating_aseprite/1_detail.png)

At this point I add a little bit of detail. Don't worry about adding every bit of detail at this point, it will just make animating a pain!

---

# Keyframes

![](images/animating_aseprite/2_keyframes.gif)

Now we'll start animating! Press `Alt+N` twice to create two new frames of animation. These will be keyframes in your animation, the two frames with the most extreme poses of the animation. We're creating a run cycle, so it will be when both legs are as far apart as they get - one frame with the left foot in front, and the other with the right.

---

# In Between Frames

![](images/animating_aseprite/3_inbetweens.gif)

Next, we'll add some inbetween frames to smooth out the action between our two keyframes. I'm adding two frames between each keyframe for a total of 6 frames in our run cycle. Note that the character bounces as they run!

---

# Adding a Tag

![](images/animating_aseprite/4_tags.png)

To see our animation in action, we need to add a tag! Click and drag to select all of your frames, right click on them, and click `New Tag`. We'll name it `run` and press `OK`. Now you can press `Enter` to watch our animation play out!

---

# Tweak Timing

![](images/animating_aseprite/5_timing.png)

Sometimes we need to tweak the timing of our animations, to do that, let's select all of our frames again, right click, and press `Frame Properties`. Change duration to `50ms`. Next, double click on your original keyframes to bring up the same window and set their durations both to `100ms`. This will hold your keyframes for an extra 50ms - making your keyframes look punchier!

![](images/animating_aseprite/punch.gif)

---

# Secondary Animation

Secondary animation means animating things that may be dependent on the primary action in an animation. In this case I'm making the head wag back and forth as the body twists mid-run. Your character could have waving hair, a cape that flows behind them, or (my personal favorite) a floppy baseball cap!

![](images/animating_aseprite/secondary.gif)

---

# Next Steps

Beyond this you could try cleaning up the animation! In motion there may be lots of tweaks to be made that you didn't notice while drawing frames. Did you know Aseprite has an [onion-skin mode](https://www.aseprite.org/docs/onion-skinning/) that can help out with that?

There is a wealth of great resources out on the internet to help you with animating! One of my favorites is [Mariel Cartwright's](https://twitter.com/kinucakes) great GDC talk [Fluid and Powerful Animations ithin Frame Restrictions](https://www.youtube.com/watch?v=Mw0h9WmBlsw)!