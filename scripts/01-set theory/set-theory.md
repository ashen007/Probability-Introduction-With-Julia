## what is a set?

a set is a collection of objects. the objects can be anything, for example numbers, people,
even another set. set theory allows a language to talk about events.

### how to define a set

there are two type of sets one is that all elements are countable and other one that all
possible elements are not clear or has infinite number of them. in the first case thoes
possible values can be show as a list of elements. for example,

$$
\lbrace HH, HT, TH, TT \rbrace \text{ in two coin flips}
$$

in second case can use rule that says wheather each possible object is or isn't in the set.
for example,

$$
\lbrace (x, y) \in {\mathbb{R}}^2 : x^2 + y^2 \leq 1 \rbrace \\
\\
\text{ this rule state "disk of radius 1 in the plane } \mathbb{R}^2 \text{, centered at the origin."}
$$

### set types and properties

#### the empty set

the smallest possible set because it has not a single element with in it. it denote as $\emptyset$ or
$\lbrace \rbrace$. but not as $\lbrace \emptyset \rbrace$ because it has one element which is $\emptyset$

#### subset

if $A$ and $B$ are two sets and if all elements of $A$ is in $B$ then $A$ is a subset of $B$. it
will denote as $A \subseteq B$. and also $\emptyset$ and $A$ it self a subsets of $A$.

#### union, intersection and complement

- the union of two sets $A$ and $B$, written as $A \cup B$, is the set of all objects that are in
  $A$ or $B$ or both.

<p align="center">
<img height="222" src="../../images/Asset 6.png" width="344" alt="union"/>
</p>

- the intersection of $A$ and $B$, written as $A \cap B$, is the set of all objects that are in
  both $A$ and $B$.

<p align="center">
<img height="222" src="../../images/Asset 5.png" width="344" alt="intersection"/>
</p>

- if $S$ is clear from context, wedefine the complement of set $A$ as all the objects in $S$ that
  are not in $A$. this set denote as $A^c$.

<p align="center">
<img height="222" src="../../images/Asset 7.png" width="344" alt="complement"/>
</p>