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

===phoneA===
phone_Alors ? J'imagine que ta grand-mère ne t'a rien appris de plus.
phone_Je te l'avais pourtant déjà expliqué.
angry_Tu m'expliques le coup bas d'hier ?!
+[Et puis c'est quoi cette chose qui m'a poursuivi ?!]
+[Je pensais que je pouvais te faire confiance]
-
phone_Ah ça... Tu me semblais confuse alors je me suis dis que je pourrai peut-être te donner un coup de pouce.
worry_Je dois me dépêcher si je ne veux pas me retrouver à nouveau nez à nez avec ce monstre !
phone_N'oublie pas que nous devons travailler ensemble.
phone_Surtout après le fiasco d'hier...
+[Ce monstre, il doit bien avoir une faiblesse...]
+["Je" serai celle qui découvrira ce qui se passe ici !]
-
focus_Allons-y !
->DONE
===papi===
worry_(Grand-père... Comment est-ce possible ..?)
focus_(Non je n'ai pas pu rêver. Je dois en parler avec grand-mère !)
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
maria_Je savais qu'il reviendrait..! Je n'ai pas rêvé quand je l'ai vu rôder dans les couloirs...
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

