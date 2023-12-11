EXTERNAL move_to(room_name)

=== function move_to(room_name)
~return 0

===start===
Hey heyo heyyyyy !
C'est le début d'une belle histoire
Prenons place, installons-nous, mettons-nous à l'aise, discutons et amusons-nous !!!
Êtes-vous pret ??
Alors allons-y !!!
Et ils s'en allèrent... 
->END

===salut===
{!coucou c un NPC|tu veux quoi|oh oh|repond sale batar|pffff...}
->DONE

===DoorB===
{move_to("worldB")}
->DONE

===DoorA===
{move_to("worldA")}
->DONE

===NPC===
ouais ouais 
big up ou quoi
ouais ouais ouais
...
->DONE


