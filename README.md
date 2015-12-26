# lane-sim
It simulates lanes, dummy.

## Installation instructions (linux)

* `git clone git@github.com:AJFaraday/lane-sim.git`
* `cd lane-sim`
* `bundle install`
* `ruby game.rb`

## Modify scenario

To change the lane simulation, modify config/basic.yml

|lane\_width|The width of individual lanes in pixels. (do not change)|
|step\_size|The size of individual steps in pixels. (do not change)|
|show\_grid|show, or don't show the grid|
|no\_steps|How many steps are on the visible road.|
|no\_walkers|The number of individual walkers.|
|no\_lanes|The number of lanes walkers can change to.|
|features|The types, and number of features on the map|

Features:

* Blocker: Sits there getting in the way of walkers.
* Entrance: Occasionally adds new walkers.
* Exit: If a walker steps on this, they leave.
* Portal: A pair of portals, if a walker steps on one, they are teleported to the other.
