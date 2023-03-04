## bayesian reasoning

Bayesian reasoning involves stepping through your thought process when you’re confronted with a situation to
recognize when you’re making probabilistic assumptions, and then using those assumptions to update your
beliefs about the world.

let's consider an example,

> "_Bayesian reasoning involves stepping through your thought process when you’re confronted with a situation
> to recognize when you’re making probabilistic assumptions, and then using those assumptions to update your
> beliefs about the world._"

## bayesian analysis

### observing data

Founding your beliefs on data is a key component of Bayesian reasoning. Before you can draw any conclusions
about the scene (such as claiming what you see is a UFO), you need to understand the data you’re observing,
in this case:

- An extremely bright light outside your window
- A saucer-shaped object hovering in the air

$$\text{P(bright light outside window, saucer-shaped object in sky) = very low}$$

> "_The probability of observing bright lights outside the window and a
> saucer-shaped object in the sky is very low._"

In probability theory, we use a comma to separate events when we’re looking at the combined probability of
multiple events. Note that this data does not contain anything specific about UFOs; it’s simply made up of
your observations.

### prior believes

You are able to wake up in the morning, make your coffee, and drive to work without doing a lot of analysis
because you hold prior beliefs about how the world works. Our prior beliefs are collections of beliefs
we’ve built up over a lifetime of experiences (that is, of observing data).

$$\text{P(bright light outside window, saucer-shaped object in sky | experience on Earth) = very low}$$

> "_The probability of observing bright lights and a saucer-shaped object
> in the sky, given our experience on Earth, is very low._"

We can add more than one piece of prior knowledge, too, if more than one variable is going to significantly
affect the probability. Suppose that it’s July 4th, and you live in the United States.

$$P(\text{bright light outside window, saucer-shaped object in sky | July 4th, experience on Earth) = low}$$

### forming a hypothesis

$D$ - bright light outside window, saucer-shaped object in sky
$X$ - prior experience

_hypothesis_, a model about how the world works that makes a prediction. Hypotheses can come in many forms.

$H_1$ = A UFO is in my backyard!

$H_1$ predicts the data $D$, when we observe our data given our hypothesis, the probability of the data
increases. Formally we write this as:

$$P(D \mid H_1, X) \gg P(D \mid X)$$

> "_The probability of seeing bright lights and a saucer-shaped object in the sky,
> given my belief that this is a UFO and my prior experience, is much higher than
> just seeing bright lights and a saucer-shaped object in the sky without
> explanation._"

### gathering more evidence and updating beliefs

To collect more data, we need to make more observations. In our scenario, you look out your window to
see what you can observe:

> "_As you look toward the bright light outside, you notice more lights in the
> area. You also see that the large saucer-shaped object is held up by wires,
> and notice a camera crew. You hear a loud clap and someone call out “Cut!”_"

You have, very likely, instantly changed your mind about what you think is happening in this scene. Your
inference before was that you might be witnessing a UFO. Now, with this new evidence, you realize it looks
more like someone is shooting a movie nearby.

- started with $H_1$
- in isolation, $H_1$, given your experience, is extremely unlikely: $P(H_1 \mid X) = \text{very, very low}$
- However, it was the only useful explanation you could come up with given the data you had available.
  When you observed additional data, you immediately realized that there’s another possible hypothesis,

  $H_2$ = A film is being made outside your window

In isolation, the probability of this hypothesis is also intuitively very low (unless you happen to
live near a movie studio):

$$P(H_2 \mid X) = \text{very low}$$

Now, however, there’s another possible explanation a movie being filmed, so you have formed an alternate
hypothesis. Considering alternate hypotheses is the process of comparing multiple theories using the data
you have. When you see the wires, film crew, and additional lights, your data changes.
Your updated data are:

$D_{updated}$ = bright lights, saucer-shaped object, wires, film crew, other lights, etc.

with your additional observations H1 no longer explains the data well,

$$P(D_{updated} \mid H_1, X) = \text{very, very low}$$

$H_2$, which explains the data much better,

$$P(D_{updated} \mid H_2, X) \gg P(D_{updated} \mid H_1, X)$$

### data informs belief, belief should not inform data

hypotheses change, and your experience in the world, $X$, may be different from someone else’s, but the data,
$D$, is shared by all,

$$P(D \mid H, X)$$

> "_The probability of the data given my hypotheses and experience in the world,
> or more plainly, How well my beliefs explain what I observe._"

**But there is a reversal of this, common in everyday thinking, which is:**

$$P(H \mid D, X)$$

> "_How well what I observe supports what I believe_"

_Bayesian thinking is about changing your mind and updating how you understand the world. The data we observe
is all that is real, so our beliefs ultimately need to shift until they align with the data._

> "_As the film crew packs up, you notice that all the vans bear military insignia.
> The crew takes off their coats to reveal army fatigues, and you overhear someone
> say, “Well, that should have fooled anyone who saw that . . . good thinking.”_"