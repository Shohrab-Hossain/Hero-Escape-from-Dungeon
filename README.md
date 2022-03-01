#  Hero Escape from Dungeon


<br>
<br>

<p align=center>
  <img src="lib\Hero.png" alt="Hero" width="40%" style="; min-width:150px;" />
</p>

<br>
<br>

# Introduction

`AI Planning` is a field of *Artificial Intelligence* that explores using autonomous techniques to solve planning and scheduling problems. A planning problem is one in which we have some initial starting state, which we wish to transform into the desired goal state by applying a set of actions.

In Artificial Intelligence Planning, there are different types of planning, and this problem is an example of `Classical Planning`.


<br>
<br>


# Problem Definition

Help a `hero` to get out of the **dungeon**! The hero woke up in a dungeon full of `monsters` and `traps` (perhaps the party last night went wrong...) and needs your help to get out. Here are basic facts about the dungeon:

* The dungeon contains rooms that are connected by corridors. Dungeon can thus be represented by undirected graph.


* Each room can be `empty`, or can have a `monster` in it, or can have a `trap` in it, or can have a `sword` in it. A room cannot have more than one of the above. 


* One of the empty rooms is the “**goal**”: it has an exit so that the hero can escape.

<br>

The hero is lucky since he has full knowledge about the dungeon. But not that lucky – just after the hero leaves room s/he just visited, the room is destroyed and cannot be revisited.

<br>

The hero can perform the following actions – but only if s/he is alive!

* The hero can move to an *adjacent room* (connected by a corridor) that has not been destroyed (i.e., the hero has not already visited the room)


* Pick up the *sword* if present in the room the hero is currently in and the hero is *empty-handed*.
* Destroy the sword that the hero currently holds. However, this can have unpleasant effects if done in a room with a trap or a monster.


* Disarm a trap – if there is a trap in the room the hero is in, and the hero is empty-handed (does not hold a sword), then the hero can disarm it

<br>

However,there are some (dangerous) constraints the hero has to consider:

* If the hero enters a room with a monster in it, s/he has to carry a sword (so the monster is afraid of him/her). Otherwise,the monster kills him/her. Notice that the hero is pacifist, so s/he cannot kill the monster. 
* If the hero destroys the sword in a room with a monster in it, the monster kills him/her as well.
* The only action the hero can safely perform in a room with a trap in it is the “disarm a trap” action. Any other action (even moving away) triggers the trap, killing the hero.

<br>
<br>

## Description of The Dungeon

Problems are specified such that cells stand for rooms and edges between them represent corridors. 

**` I `** is an initial hero's position,

**` G `** is hero's desired goal position,

**` S `** indicates sword room,

**` M `** is a monster room,

**` T`** stands for trap room, and

Blank is an empty room.


<br>
<br>
<br>

>### Problem 01

<br>

<img src="lib\Problem 01.png" alt="Problem 01">

<br>
<br>
<br>

>### Problem 02

<br>

<img src="lib\Problem 02.png" alt="Problem 02">

<br>
<br>
<br>

>### Problem 03

<br>

<img src="lib\Problem 03.png" alt="Problem 02">


<br>
<br>


---


<br>
<br>


# Solution details

A **domain** file is designed that will be used to solve this three different problems. The models are then run in `planning engines` to generate planning solutions.


<br>

## Interpretation of Operator Schema

Different rooms have different features in the provided problem and require some precondition to enter that room. The domain is designed so that each action will define features and preconditions to move to a room. The provided problems have four types of rooms with unique characteristics. In this design, six actions describe the movement between these four rooms to find a plan to move the hero from the initial room to the escape room.

<br>

### 1. move_to_sword-room

This macro action moves the hero to the sword room, where the hero will pick a sword only available in that room. When a hero enters into sword room in an empty hand, he must pick the sword. So, moving to sword room and pick-up sword, these two actions are merged in this macro action.

> Preconditions for this action are -

- the destination room in the parameter is a sword room,
- the hero’s hand must be empty, which means the hero is not carrying any sword.

The effect of this action is that the hero will pick a sword from that room.

<br>

### 2. move_to_sword-room_to_drop

This macro action moves the hero to the sword room, where the hero will drop the sword he is carrying. When the hero enters a sword room with a sword in his hand, he must drop the sword there. So, moving to sword-room and dripping sword, these two actions are merged in this macro action.

> Preconditions for this action are -

- the destination room in the parameter is a sword room.
- the hero must be carrying a sword, which means the hero’s hand is not empty.

The effect of this action is that the hero will drop the sword, and his hand will be empty.

<br>

### 3. move_to_monster-room

This action moves the hero to the monster room, where the hero will do nothing but remain in the room while carrying a sword in his hand.

> Preconditions for this action are -

- the destination room in the parameter is a monster room.
- the hero must be carrying a sword, which means the hero’s hand is not empty.

The effect of this action is the hero will stay in the room while holding a sword in his hand.

<br>

### 4. move_to_trap-room

This macro action moves the hero to a trap room where the hero will disarm the trap of that room. When the hero moves to the trap room, he must disarm the trap.So, moving to the trap room and disarming the trap, these two actions are merged in this action.

> Preconditions for this action are -

- the destination room in the parameter is a trap room.
- the hero’s hand must empty, which means the hero is not carrying any sword.

The effect of this action is that the hero will disarm the trap of that room.

<br>

### 5. move_to_empty-room

This macro action moves the hero to an empty room where the hero can drop his sword if carrying any. When the hero enters an empty room, he must drop his sword if he carries any. So, move to empty-room and drop the sword; these two actions are merged in this action.

>  Preconditions for this action is - 

​	the destination room in the parameter is an empty room,

The effect of this action is that the hero will drop the sword if he is carrying any.

<br>

### 6. move_to_escape-room

This action moves the hero to escape room which is the ultimate goal of the problem.

> Preconditions for this action is - 

​	the destination room in the parameter is an escape room,

The effect of this action is that the hero will reach the goal.


<br>
<br>

---

<br>

# Planning Engine

The designed domain and problem file can be uploaded to one of this online planner to generate plan.

- [Planning.domains](http://planning.domains/) 
- [Web Planner](https://web-planner.herokuapp.com/)



<br>
<br>

---
<br>


# Result in State Space Representation

<br>
<br>

> ### State Space of Problem 01

<br>

<img src="lib\Statespace of Problem 01.png" alt="Statespace of Problem 01">

<br>
<br>


> ### State Space of Problem 02

<br>

<img src="lib\Statespace of Problem 02.png" alt="Statespace of Problem 02">

<br>
<br>


> ### State Space of Problem 03

<br>

<img src="lib\Statespace of Problem 03.png" alt="Statespace of Problem 03">


<br>
<br>


---


<br>
<br>

