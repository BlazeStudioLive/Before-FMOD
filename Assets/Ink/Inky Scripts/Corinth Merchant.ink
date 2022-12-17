INCLUDE Globals.ink
~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
{HeroKnowledge == 10:->VillainBattle|->MerchantCheck}

=== MerchantCheck
{spokeToMerchant == true: ->already_spoke}
{spokeToMerchant == false: -> Corinth}
->Corinth

== Corinth ==
~MerchantAnswers = 0
Hello there, traveler! My, what interesting clothes you're wearing. #speaker:Merchant #portrait:merchant #layout:right
*[Grateful]
    Awww! Why, Thank you! #speaker:Hero #portrait:hero #layout:left
    ->Merchant1
*[Confused]
    Ummm... Thank you...? #speaker:Hero #portrait:hero #layout:left
    ->Merchant1
    
== Merchant1 
-
Welcome to the city-state, Corinth! We are a proud city! Thanks be to Zeus! Since we have access to both the Ionian and Aegean Sea, we are one of the most powerful cities in the world! #speaker:Merchant #portrait:merchant #layout:right
We were one of the first to develop coins and continue to be one of the wealthiest city-states in all of Greece! 
I am a humble merchant. Trade is my life. I take my boat all around the Mediterranean Sea, Ionian Sea, and Aegean Sea. I also take trips to many of the islands surrounding Greece.
The waters can be quite dangerous and my ship is built for strength, not speed. It can take weeks to travel from one city-state to another, especially some of the far away islands, like Crete.
The god of the sea, the mighty Poseidon, protects us!
Gee, I've been talking a bunch... Am I making sense?
+[Yes]
    You sure are! #speaker:Hero #portrait:hero #layout:left
    ->Merchant2
+[No]
    Sorry, could you repeat that? #speaker:Hero #portrait:hero #layout:left
    ->Merchant2

== Merchant2

Being a merchant is a tough job, but somebody has to do it! We don’t have many natural resources on the islands. Trade makes life throughout the Mediterranean Sea much better! #speaker:Merchant #portrait:merchant #layout:right
Olive oil, pottery, grains, timber, and metal are some of the most valuable items we trade.
I hope I haven't been too boring... 
->MerchantQ1

= MerchantQ1
Did you catch what I said? 
Of course I did! You said that Corinth is:  #speaker:Hero #portrait:hero #layout:left

*A small village #speaker:Hero #portrait:hero #layout:left
    Small?? How dare you! #speaker:Merchant #portrait:merchant #layout:right
-> MerchantQ1 
*An agricultural center #speaker:Hero #portrait:hero #layout:left
    We do have lots of grain at the Agora, but we're much more than agriculture. #speaker:Merchant #portrait:merchant #layout:right
->MerchantQ1
+A wealthy city  #speaker:Hero #portrait:hero #layout:left
    That's it! Nice job! #speaker:Merchant #portrait:merchant #layout:right
    ~ MerchantAnswers ++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    ->MerchantQ2
*Famous for art.#speaker:Hero #portrait:hero #layout:left
    We do appreciate art, but we are not known for it. Try again!  #speaker:Merchant #portrait:merchant #layout:right
-> MerchantQ1
+Start over, please #speaker:Hero #portrait:hero #layout:left
~MerchantAnswers = 0
->Merchant1

= MerchantQ2
Well, I should get going... This olive oil isn't going to deliver itself. Where should I sail?
You should sail to the: #speaker:Hero #portrait:hero #layout:left

*Pacific Ocean #speaker:Hero #portrait:hero #layout:left
Pafic Ocean?????? I've never even heard of that! #speaker:Merchant #portrait:merchant #layout:right
    -> MerchantQ2
+Mediterranean Sea #speaker:Hero #portrait:hero #layout:left
    ~ MerchantAnswers ++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
Oh, great idea! #speaker:Merchant #portrait:merchant #layout:right
    There are tons of trade ports all over the Mediterranean. I'm sure I could find plenty of people to trade with!
    ->MerchantQ3
*Black Sea #speaker:Hero #portrait:hero #layout:left
I've heard of that place but never been there. It's a bit far from Corinth... Any other ideas? #speaker:Merchant #portrait:merchant #layout:right
    ->MerchantQ2
*Carribean Sea #speaker:Hero #portrait:hero #layout:left
Where in the world is that?? Try again... #speaker:Merchant #portrait:merchant #layout:right
    ->MerchantQ2
+Start over, please. #speaker:Hero #portrait:hero #layout:left
    ~ MerchantAnswers = 0
    ->Merchant1


== MerchantQ3
It will take a while to get there. I could go south and sail through the Aegean, but that would take even longer...#speaker:Merchant #portrait:merchant #layout:right
Do you remember the name of the other sea? It's the one right here that we're looking at right next to us, by the way. #speaker:Merchant #portrait:merchant #layout:right
Of course I do! We're right next to the: #speaker:Hero #portrait:hero #layout:left

*Red Sea #speaker:Hero #portrait:hero #layout:left
I've never been there... Maybe one day! #speaker:Merchant #portrait:merchant #layout:right
    ->MerchantQ3
+Ionian Sea #speaker:Hero #portrait:hero #layout:left
That's the one! Northwest through the Ionian, then we're into the vast Mediterranean. #speaker:Merchant #portrait:merchant #layout:right
Nice work!
    ~ MerchantAnswers ++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    You're Knowledge Meter is at {HeroKnowledge}
    -> KnowledgeCheck
*Dead Sea #speaker:Hero #portrait:hero #layout:left
Dead?? That doesn't sound like a place I want to go. #speaker:Merchant #portrait:merchant #layout:right
        ->MerchantQ3

== KnowledgeCheck
~ spokeToMerchant = true
{HeroKnowledge == 10: BOSS BATTLE->VillainBattle|->MerchantEnd}

===MerchantEnd
{spokeToVillager == false: Make sure you talk to the Villager in his house to the North.->ShopEnd|->ShopEnd} #speaker:Merchant #portrait:merchant #layout:right

==ShopEnd
{spokeToShop == false: There is a helpful Shop Keep in the Agora that you should talk to. ->PriestEnd|->PriestEnd} #speaker:Merchant #portrait:merchant #layout:right

===PriestEnd
{spokeToPriest == false: Don't forget to talk to the Priest in the Temple to the East.|Goodbye!->END} #speaker:Merchant #portrait:merchant #layout:right
Goodbye!
    ->END

=== already_spoke
You already spoke to me. #speaker:Merchant #portrait:merchant #layout:right
{spokeToVillager == false: Make sure you talk to the Villager in his house to the North.->ShopEnd|->ShopEnd}
Good luck on the rest of your adventure! Goodbye!
->END

==VillainBattle
Oh my! It appears you are strong enough for the Boss Battle! #speaker:Merchant #portrait:merchant #layout:right
+BOSS BATTLE
~BossBattle = true 
    ->END