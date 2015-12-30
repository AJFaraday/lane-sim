# lane-sim
It simulates lanes, dummy.

## Installation instructions (linux)

* `git clone git@github.com:AJFaraday/lane-sim.git`
* `cd lane-sim`
* `bundle install`

## Usage

Run one of the files under games/ e.g.

* `ruby games/watch.rb`
* `ruby games/play.rb`
* `ruby games/easy_campaign.rb`
* `ruby games/medium_campaign.rb`

## Modify scenario

To change the lane simulation, modify any of the files in config/ 

|Attribute | Description|
|----------|-----------|
|playable|Do we expect someone to play this scenario.|
|show\_grid|show, or don't show the grid|
|no\_steps|How many steps are on the visible road.|
|no\_lanes|The number of lanes walkers can change to.|
|no\_walkers|The number of randomly placed walkers.|
|random\_features|The types of randomly placed feature on the map, with a count of each type.|
|maps|A list of maps (relative to the maps/ folder) and a target to be hit before progressing to the next map.|

Features:

* Blocker: Sits there getting in the way of walkers.
* Entrance: Occasionally adds new walkers.
* Exit: If a walker steps on this, they leave.
* Portal: A pair of portals, if a walker steps on one, they are teleported to the other.


