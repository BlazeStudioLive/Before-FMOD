INCLUDE Globals.ink

~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
{HeroKnowledge == 10:->VillainBattle|->VillagerCheck}

Hello there, traveler! My, what interesting clothes you're wearing.
=== VillagerCheck
{spokeToVillager == true: ->already_spoke}
{spokeToVillager == false: -> Villager}
->Villager


== Villager
~VillagerAnswers = 0
Hello there, traveler! Oooooo, look at your clothes! So... unique... #speaker:Villager #portrait:villager #layout:right
*[Grateful]
    Thanks! I picked the outfit myself. #speaker:Hero #portrait:hero #layout:left
    ->Villager1
*[Confused]
    Why does everybody keep talking about my clothes? #speaker:Hero #portrait:hero #layout:left
    ->Villager1

== Villager1
I’m dressed in simple farmer clothes because, well, I am a farmer! Most of the people in Greece are farmers.#speaker:Villager #portrait:villager #layout:right
	Farming is tough here in Grece! You can see that we’re surrounded by water, plus, just look at all the rocks and mountains around here!
	We have to make flat areas, called terraces, to plant our crops. We mostly grow grapes and olives, but some farmers in bigger areas can grow wheat and barley.
	On my farm, I also have some cows, goats, and sheep. I use the cows and goats for milk and cheese. The sheep provide wool that we use to make clothes.
	My neighbors have chicken and pigs. We trade food for clothing and cheese. We both use donkeys and ox to help plow our fields.
Are you following along?
+[Yes]
    You bet! #speaker:Hero #portrait:hero #layout:left
    ->Villager2
+[No]
    Sorry, could you repeat that? #speaker:Hero #portrait:hero #layout:left
    ->Villager1
    
== Villager2
Sometimes, an island will have a shortage of food and will be forced to attack one of their neighbors. #speaker:Villager #portrait:villager #layout:right
For as close as our islands are to one another, you would think we’re closer friends, but the reality is that us Greeks fight amongst each other all the time. 
What's that? You want me to quiz you? Well, sure.
	    ->VillagerQ1
	    
== VillagerQ1
Complete this sentence:
Most Ancient Greeks were: #speaker:Hero #portrait:hero #layout:left
*Merchants #speaker:Hero #portrait:hero #layout:left
There are some merchants, but most people can't afford to travel all the time. Try again. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ1
+Farmers #speaker:Hero #portrait:hero #layout:left
You got it! #speaker:Villager #portrait:villager #layout:right
    ~ VillagerAnswers++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    The vast majority of people in Ancient Greece are farmers. People trade between each other to make sure they have everything they need to survive.
    Ready for another question?
        -> VillagerQ2
*Royalty #speaker:Hero #portrait:hero #layout:left
Ha! I wish... Try again. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ1
*Scholars #speaker:Hero #portrait:hero #layout:left
We do highly value knowledge, but I wouldn't call the average Greek a "scholar." Try again. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ1
+Start over, please?
    ~ VillagerAnswers = 0
    ->Villager1
    
== VillagerQ2

What do we call the flat areas that farmers build in order to grow their crops?
*Farmland #speaker:Hero #portrait:hero #layout:left
    That's a bit of an oversimplification, don't you think? Try again. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ2
* Valleys #speaker:Hero #portrait:hero #layout:left
    It's difficult to build a valley. Try again. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ2
*Plateaus #speaker:Hero #portrait:hero #layout:left
    I see why you would think that, a Plateau is a good place for crops, but we don't have many here in Greece! Try again. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ2
+Terraces #speaker:Hero #portrait:hero #layout:left
    That's it! #speaker:Villager #portrait:villager #layout:right
    ~ VillagerAnswers++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
I've got 1 more question for you.
    ->VillagerQ3
+Start over, please. #speaker:Hero #portrait:hero #layout:left
    ~ VillagerAnswers = 0
    ->Villager1
    
= VillagerQ3
Let's get a bit tricky... Which animals would you NOT find on my farm? #speaker:Villager #portrait:villager #layout:right
*Pigs #speaker:Hero #portrait:hero #layout:left
    My neighbor has plenty of pigs. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ3
*Chickens #speaker:Hero #portrait:hero #layout:left
    My neighbor has chickens. #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ3
+Horses #speaker:Hero #portrait:hero #layout:left
    Great answer! I've heard about horses in Asia, but not here in Greece. #speaker:Villager #portrait:villager #layout:right
    ~ VillagerAnswers++
~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    ->KnowledgeCheck
*Goats #speaker:Hero #portrait:hero #layout:left
    Are you just guessing? #speaker:Villager #portrait:villager #layout:right
    ->VillagerQ3
+Start over, please. #speaker:Hero #portrait:hero #layout:left
    ~ VillagerAnswers = 0
    ->Villager1
    
== KnowledgeCheck

~ spokeToVillager = true
{HeroKnowledge == 10: BOSS BATTLE->VillainBattle|->VillagerEnd}

===VillagerEnd
{spokeToMerchant == false: Make sure you talk to the Merchant to the South West.->ShopEnd|->ShopEnd} #speaker:Merchant #portrait:merchant #layout:right

==ShopEnd
{spokeToShop == false: There is a helpful Shop Keep in the Agora that you should talk to. ->PriestEnd|->PriestEnd} #speaker:Merchant #portrait:merchant #layout:right

===PriestEnd
{spokeToPriest == false: Don't forget to talk to the Priest in the Temple to the East.|Goodbye!->END} #speaker:Merchant #portrait:merchant #layout:right
Goodbye!
    ->END

=== already_spoke
You already spoke to me. #speaker:Villager #portrait:villager #layout:right
{spokeToMerchant == false: Make sure you talk to the Merchant to the South West.->ShopEnd|->ShopEnd}
Good luck on the rest of your adventure! Goodbye!
->END

==VillainBattle

Oh my! It appears you are strong enough for the Boss Battle! #speaker:Villager #portrait:villager #layout:right
+BOSS BATTLE
~BossBattle = true 
    ->END