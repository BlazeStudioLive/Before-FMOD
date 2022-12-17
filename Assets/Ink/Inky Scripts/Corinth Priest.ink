INCLUDE Globals.ink

~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
{HeroKnowledge == 10:->VillainBattle|->PriestCheck}


===PriestCheck
{spokeToPriest == false: -> Priest}
{spokeToPriest == true: ->already_spoke}

==Priest
~PriestAnswers = 0
By Zeus, what do we have here? Your robes look like they were crafted by Clothos himself! Astonishing! #speaker:Priest #portrait:priest #layout:right
->Priest1

==Priest1
Anyway, welcome to the Temple! The Gods are the most important part of our lives here in Greece. The Gods control the weather, bad luck, good luck, and everything in between.
We have many temples all throughout Greece dedicated to the Gods. All Greeks share the same Gods, but each city has its own patron God who pays extra close attention to us.
Here in Corinth, since we have the sea on both sides of us, we have Poseidon, the god of the sea, as our protector.
-...What’s that? Little Mermaid? I have no idea what you’re talking about…
Were you even paying attention?
+[Yes]
Of course I am! #speaker:Hero #portrait:hero #layout:left
    -> PriestQ1
+[No]
Sorry, could you repeat that, please? #speaker:Hero #portrait:hero #layout:left
    ->Priest1
    
== PriestQ1
Where do Greeks go to pay tribute to their Gods? #speaker:Priest #portrait:priest #layout:right

* Church #speaker:Hero #portrait:hero #layout:left
Sorry? I haven't even heard of that. #speaker:Priest #portrait:priest #layout:right
    -> PriestQ1
* Tower #speaker:Hero #portrait:hero #layout:left
We use those for military defense, not for god worship. #speaker:Priest #portrait:priest #layout:right
    -> PriestQ1
+ Temple #speaker:Hero #portrait:hero #layout:left
    ~ PriestAnswers ++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    That's it! Every city is going to have at least 1 Temple. Each Temple is dedicated to a specific god. #speaker:Priest #portrait:priest #layout:right
    -> PriestQ2
* Mosque #speaker:Hero #portrait:hero #layout:left
I haven't heard of that... Where are you from, anyway? Oh, nevermind... #speaker:Priest #portrait:priest #layout:right
    -> PriestQ1
+ Start over, please. #speaker:Hero #portrait:hero #layout:left
~PriestAnswers = 0
    ->Priest1
    
== PriestQ2
Who is the patron God of Corinth? #speaker:Priest #portrait:priest #layout:right
+ Poseidon, god of the sea #speaker:Hero #portrait:hero #layout:left
    ~ PriestAnswers ++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    Correct! We're right in between the Aegean and Ionian Seas, so the God of the Sea is close by and watches over us! #speaker:Priest #portrait:priest #layout:right
    -> KnowledgeCheck
* Zeus, father of the gods #speaker:Hero #portrait:hero #layout:left
We do love Zeus, but he is not the patron of Corinth. #speaker:Priest #portrait:priest #layout:right
    ->PriestQ2
* Clothos, god of clothing #speaker:Hero #portrait:hero #layout:left
That's not right. You seem like the one obsessed with clothes. #speaker:Priest #portrait:priest #layout:right
    ->PriestQ2
* Demeter, goddess of animals #speaker:Hero #portrait:hero #layout:left
Animals and hunting are very important, but not important enough to be our Patron Saint here on Corinth. #speaker:Priest #portrait:priest #layout:right
    ->PriestQ2
+ Start over, please. #speaker:Hero #portrait:hero #layout:left
    ~ PriestAnswers = 0
    ->Priest1


== KnowledgeCheck

~ spokeToPriest = true
{HeroKnowledge == 10: BOSS BATTLE->VillainBattle|->PriestEnd}

===PriestEnd
Excellent work! {spokeToMerchant == false: Make sure you talk to the Merchant at the Harbor in the South West.->ShopEnd|->ShopEnd} #speaker:Priest #portrait:priest #layout:right

==ShopEnd
{spokeToShop == false: There is a helpful Shop Keep in the Agora that you should talk to. ->VillagerEnd|->VillagerEnd} #speaker:Priest #portrait:priest #layout:right

===VillagerEnd
{spokeToVillager == false: Don't forget to talk to the Villager in the house to the North West.|Goodbye!->END} #speaker:Priest #portrait:priest  #layout:right
->END
Congratulations! I'm sure you will be fine on your quest... Whatever it is...
... #speaker:Priest #portrait:priest #layout:right
    ->END

=== already_spoke
You already spoke to me. #speaker:Priest #portrait:priest #layout:right
->PriestEnd 
->END

==VillainBattle
Oh my! It appears you are strong enough for the Boss Battle! #speaker:Priest #portrait:priest #layout:right
+BOSS BATTLE
~BossBattle = true
    ->END
