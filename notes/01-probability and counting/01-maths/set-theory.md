<!-- TOC -->
  * [what is a set?](#what-is-a-set)
    * [how to define a set](#how-to-define-a-set)
    * [set types and properties](#set-types-and-properties)
      * [the empty set](#the-empty-set)
      * [subset](#subset)
      * [union, intersection and complement](#union-intersection-and-complement)
        * [de morgan's law](#de-morgans-law)
<!-- TOC -->

## what is a set?

a set is a collection of objects. the objects can be anything, for example numbers, people, even another set. set theory
allows a language to talk about events.

### how to define a set

there are two type of sets,

1. one is that all elements are countable 
2. second one that all possible elements are not clear or has infinite number of them. 

in the first case thous possible values can be show as a list of elements. for example,

$$
\lbrace 1, 3, 5, 7, ... \rbrace \text{ is the set of all odd numbers;} \\
\lbrace wolf, jack, toby \rbrace \text{is the set of joe's cats;} \\
\lbrace HH, HT, TH, TT \rbrace \text{ in two coin flips;}
$$

in second case can use rule that says whether each possible object is or isn't in the set.
for example,

$$
\lbrace (x, y) \in {\mathbb{R}}^2 : x^2 + y^2 \leq 1 \rbrace \\
\\
\text{ this rule state "disk of radius 1 in the plane } \mathbb{R}^2 \text{, centered at the origin."}
$$

### set types and properties

#### the empty set

the smallest possible set because it has not a single element with in it. it denote as $\emptyset$ or $\lbrace \rbrace$.
but not as $\lbrace \emptyset \rbrace$ because it has one element which is $\emptyset$

#### subset

if $A$ and $B$ are two sets and if all elements of $A$ is in $B$ then $A$ is a subset of $B$. it
will denote as $A \subseteq B$. and also $\emptyset$ and $A$ it self a subsets of $A$.

#### union, intersection and complement

- the union of two sets $A$ and $B$, written as $A \cup B$, is the set of all objects that are in
  $A$ or $B$ or both.

<p align="center">
<img height="222" src="../../../images/Asset%206.png" width="344" alt="union"/>
</p>

note: the area of the region $A \cup B$ is the area of $A$ plus the area of $B$, minus the area of $A \cap B$,
      this is the simple form of the _inclusion-exclusion principle_.

- the intersection of $A$ and $B$, written as $A \cap B$, is the set of all objects that are in
  both $A$ and $B$.

<p align="center">
<img height="222" src="../../../images/Asset%205.png" width="344" alt="intersection"/>
</p>

- if $S$ is clear from context, we define the complement of set $A$ as all the objects in $S$ that
  are not in $A$. this set denote as $A^c$.

<p align="center">
<img height="222" src="../../../images/Asset%207.png" width="344" alt="complement"/>
</p>

##### de morgan's law

there are two versions of this, 

- first one says that not being in at least one of the $A_j$ is the same thing as not
  being in $A_1$, nor being in $A_2$, nor being in $A_3$, etc.

$$(A_1 \cup A_2 \cup ... \cup A_n)^c = {A_1}^c \cap {A_2}^c \cap ... \cap {A_n}^c$$

<p align="center"><img height="653" src="../../../images/Asset%208.png" width="942" alt="morgan law 1"/></p>

- second law says that not being in all of the $A_j$ is the same thing as being outside at 
  least one of the $A_j$.

$$(A_1 \cap A_2 \cap ... \cap A_n)^c = {A_1}^c \cup {A_2}^c \cup ... \cup {A_n}^c$$

<p align="center"><img height="651" src="../../../images/Asset%209.png" width="1004" alt="morgan law 2"/></p>

### partitions

a collection of subsets $A_1, ..., A_n$ of a set $\mathbb{S}$ is a _partition_ of 
$\mathbb{S}$ if $A_1 \cup ... \cup A_n = \mathbb{S}$ and $A_i \cap A_j$ for all $i \neq j$. In words, a partition of a
set is a collection of disjoint subsets whose union is the entire set.

### cardinality

if A is a finite set, we write $\mid A \mid$ for the number of elements in A, which is called its size or cardinality.
A very useful fact is that A and B are finite sets, then

$$\mid A \cup B \mid = \mid A \mid + \mid B \mid - \mid A \cap B \mid$$