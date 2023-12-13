EXTERNAL move_to(room_name)

VAR positive = true

=== function move_to(room_name)
~return 0
===A===
youhoooou
->->
===B===
cry_pfffff
->->
===choices===
idle_Hey heyo heyyyyy !
idle_C'est le début d'une belle histoire
+[ouaaaaais] idle_youhoooou
+[bif bof] ->B->
-
idle_Prenons place, installons-nous, mettons-nous à l'aise, discutons et amusons-nous !!!
idle_Êtes-vous pret ??
idle_Alors allons-y !!!
idle_Et ils s'en allèrent... 
->END

===lock===
idle_la porte a l'air fermée de l'autre coté...
->END

===mario===
maria_{!coucou c moi Maria|tu veux quoi|oh oh|repond sale batar|pffff...}
->DONE

===phone===
{stopping:
-idle_yo yo yo yo 
phone_ouais ouais 
idle_...
phone_big up ou quoi
angry_je je j-
phone_ouais ouais ouais
cry_...

-zreifubzeufbzerg
zriehgbierubgieurbg

-erziieruieurbg
eorgnoeirngoier
}
->DONE

===maria===
{stopping:
-maria_Hmm...
worry_(Mamie a l'air de plus en plus fatiguée...)
focus_(Non, je ne dois pas me laisser perturber ! Il faut absolument que je lui parle.)

-worry_Mamie...
maria_Tu as besoin de quelque chose ma chérie ?
+Hier j'ai vu quelque chose dans les couloirs...->maria_negative
+J'ai trouvé cette photo tout à l'heure.->maria_positive

- {maria_negative==false:
focus_Mamie ?
->maria_negative
}

-idle_Elle s'est endormie...
-idle_(Partons pour l'instant...)

}

->DONE

===maria_negative===
maria_Je savais qu'il reviendrait..! Je n'ai pas rêvé quand je l'ai vu rôdé dans les couloirs...
worry_Mamie..?
maria_C'en est fini des Di Santi, nous sommes damnés !
focus_(Mamie n'a pas l'air de m'écouter, je ferai peut-être mieux de la laisser se reposer un peu...)
->DONE

===maria_positive===
maria_Ah oui je m'en souviens...
maria_Tu avais l'air si penaude que ton papi cachait discrètement ses poissons dans ton seau pour te faire plaisir...
maria_Ton sourire était si radieux ce jour là.
worry_Oh Mamie...
focus_Je comprends mieux, merci Mamie ! (dans le mille.)
->DONE

/*
VAR photo_chambre_maria = false
idle, angry, sad, worry, focus

===vieille_pendule===
contrariee_Comment fait mamie pour dormir avec le bruit qu'elle fait? Elle me fait tout le temps sursauter.
->DONE

===armoire===
idle_Une fois j'ai fait un cache-cache avec mamie et Andréa, on s'était cachés dans l'armoire et on est restés bloqués dedans. C'est finalement tonton qui nous a fait sortir en nous promettant une surprise. Depuis elle est fermée à clé.
->DONE

===maria===

//choix
Tu as besoin de quelque chose ma chérie? 
+{photo_chambre_maria}[Regarde ce que j'ai retrouvé!}->mariapositive
+{not photo_chambre_maria}[Hier j'ai vu quelque chose dans les couloirs...]->marianegative

==mariapositive==
maria_happy Ah oui je m'en souviens, tu avais l'air si penaude que ton papy cachait discrètement ses poissons dans ton seau pour te faire plaisir. Ton sourire était si radieux ce jour là... 
idle_ Oh, ça explique des choses! (dans le mille.)
->DONE

==marianegative==
maria_sad Je savais qu'il reviendrait...! Je n'avais pas rêvé quand je l'avais vu rôder dans les couloirs ... 
tritesse_ Mamie? 
maria_sad C'en est fini des di Santi, nous sommes damnés! 
idle_ (Mamie n'a pas l'air de m'écouter, je ferai peut être mieux de la laisser se reposer un peu...)
->DONE

// set variable
===photo_chambre_maria===
idle_C'est une photo de papy et moi à la pêche, j'avais attrapé le plus de poissons mais je suis sûre qu'il avait fait exprès de me laisser gagner. 
->DONE
~photo_chambre_maria=true
*/
