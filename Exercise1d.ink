/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR tool = ""
VAR sticks = 0 
VAR wait = -1

-> beginning

== beginning ==
{grab_tool: You've got your tool now, ready?| You find yourself at a cave intrance. Do you wish to explore?}
* [Explore] -> cave_enter
* [Don't Explore] -> cave_ignore0

== cave_enter ==
{As you enter the cave rubble falls blocking you in what do you do?|You at the beginning and do what?|Wow at the beginning again..|Here again..}
{ wait_wolves() }
* {tool == "Pocket Knife"} [Use your knife] -> use_tool
* {tool == "Phone"} [Use your phone] -> use_tool
* {tool == "Flashlight"} [Use your light] -> use_tool
+ [Try to find supplies] -> search_beginning
+ {wait <= 2} [Wait for help] -> cave_enter
+ {wait == 3} [Wait for help] -> wolf_attack

== use_tool ==
{tool == "Pocket Knife": ... What exactly is this going to help with here?..|}
{tool == "Phone": Smart idea use the life 360 app to ping your parents! What now though?|}
{tool == "Flashlight": Oh right your light! You quickly fumble before finding it. Turning it on you realise how useless it is barely reflect little glints in what seem to be the eyes of creatures before it dies..|}
* [Try to find supplies] -> search_beginning
+ [Wait for help] -> wolf_attack

== cave_ignore0 ==
What.. Why?
* [Cause you need your tools duh] -> grab_tool
* [Not Interested] -> cave_ignore1

== grab_tool ==
What tool do you grab?
*[Your trusty old pocket knife]
    ~ tool = "Pocket Knife"
    -> beginning
*[Your phone]
    ~ tool = "Phone"
    -> beginning
*[An old flashlight]
    ~ tool = "Flashlight"
    -> beginning

== cave_ignore1 ==
Oh well.. You leave and remain bored, but safe -> END

== search_beginning ==
{continue_search: You wonder through the cave system for a bit finding a spot where light shines down through the ceiling|Its feels like its been hours and you begin to lose hope..}
* [Keep on going] -> continue_search
+ {continue_search} [Try and climb out] -> climb
+ [Quit and head back] -> cave_enter

==climb==
You make it half way and feel the struggle creep upon yourself then see a rope just out of your grasp
+ [Reach for it] -> fall
+ [Work through the struggle] -> escape

== fall ==
You barely manage to grab it before falling to your end as the rope gives to your weight.-> END

== escape ==
You push through the pain knowing the rope was to tattered to help and make it out with just a few scatches due to the sharp and difficult climb.-> END

=== continue_search ===
You keep going until.. -> search_beginning

== wolf_attack ==
{search: Hurry! What now the wolves are closing in!|You decide your best bet was to wait for help but little did you know there were wolves in the cave.}
+ [Fight Back] -> fight_back
+ {search} [Throw it at the wolves] -> fetch_route
* [Check your surroundings] -> search
+ [Run] -> run

=== search ===
~ sticks = sticks+1
{sticks == 1: You find a stick! You now have {sticks} stick| You find a stick! You now have {sticks} sticks} -> wolf_attack

== fight_back ==
{sticks > 0 or tool == "Pocket Knife": You manage to fend off the wolves surviving long enough for a group to save you|Wow for real what did you expect their wolves..}
-> END

== fetch_route ==
Wow.. who would've expected such a stupid outcome.. they chased it those over glorified dogs. You were found playing fetch just a while later perfectly fine in the end. Now that your saved what do you do with those wolves?
* [Keep them] -> idiot
* [Ditch them] -> heartless

== idiot ==
Well in the end you forsake your entire family to an awful fate afterall the wolves weren't domesticatedwhat will you do now?.
* [Play Fetch] -> safety_fetch
* [Rest after your long adventure] -> danger_rest

== safety_fetch ==
They're happy.. for now... -> END

== danger_rest ==
You slept for the rest of your life. All 10 minutes that it took for the wolves to finish your family before moving on to their last sorce of food.. -> END

== heartless ==
Good call. Does't change the fact you just ditched those poor puppers in the cold darkness of the night -> END

== run ==
Wow for real what did you expect their wolves.. 
-> END

== function wait_wolves ==

    ~ wait = wait + 1
    
    {
        - wait == 0:
            ~ return "Smart choice"
            
        - wait == 1:
            ~ return "Alright we'll wait some more.."
            
        - wait == 2:
            ~ return "This is boring.."
            
        - wait == 3:
            ~ return "Did you hear that?..."
            
    }
    ~ return wait