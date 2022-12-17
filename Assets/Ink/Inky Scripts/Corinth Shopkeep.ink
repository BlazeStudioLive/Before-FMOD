INCLUDE Globals.ink

~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
{HeroKnowledge == 10: BOSS BATTLE!!->END|->ShopCheck}

===ShopCheck
~ShopAnswers = 0
{spokeToShop == false: -> Shop1}
{spokeToShop == true: ->alreadyspoke}

==Shop1
Welcome to the Agora! I run this shop here. Unfortunately, I don't have anything to sell at the moment. I mainly sell timber but the weather has been rough and my shipment is delayed. #speaker:Shop Keep #portrait:market1 #layout:right
If I can't find something to sell, then I'm going to be ruined. What will my family do?? I need to sell something.
Do you have any ideas for what I should sell in my shop?
{spokeToVillager == true:->ShopQ1|}
I'm not sure. I think I need to talk to some more people before I can answer your question. Let me explore some more and then I'll come back #speaker:Hero #portrait:hero #layout:left
->END 
==ShopQ1
I learned that a lot of people are farmers. Maybe you could sell some of the local food? #speaker:Hero #portrait:hero #layout:left

That's a great idea! What do you think I should sell? I would say "Olive Oil," but we already have a ton of that around here... What else do our farmers grow that I could sell? #speaker:Shop Keep #portrait:market1 #layout:right
You could sell: #speaker:Hero #portrait:hero #layout:left
Jewelery #speaker:Hero #portrait:hero #layout:left
    I don't think farmers grow jewelery. Try again. #speaker:Shop Keep #portrait:market1 #layout:right
    ->ShopQ1
*Wool #speaker:Hero #portrait:hero #layout:left
    Farmers do have sheep and wool, but I want to sell something that they grow. Give it another try. #speaker:Shop Keep #portrait:market1 #layout:right
    ->ShopQ1
*Copper #speaker:Hero #portrait:hero #layout:left
    Farmers don't grow metal. Any other ideas? #speaker:Shop Keep #portrait:market1 #layout:right
    ->ShopQ1
+ Grapes #speaker:Hero #portrait:hero #layout:left
    Oh! That's a great idea! My cousin makes wine. I can reach out to him. Hopefully he will know people who I can sell to. Great idea, thank you! #speaker:Shop Keep #portrait:market1 #layout:right
    ~ShopAnswers ++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    ->Shop2
*Olives #speaker:Hero #portrait:hero #layout:left
    We have plenty of olives and olive oil already. Something else would be better. #speaker:Shop Keep #portrait:market1 #layout:right
    ->ShopQ1

==Shop2
To be honest, I've been getting tired of life here in Corinth. Nothing against the city, I just want some adventure. I've never left my home before. Do you have any advice for a traveler? #speaker:Shop Keep #portrait:market1 #layout:right
*Smile #speaker:Hero #portrait:hero #layout:left
    I'm not sure what good that will do. Any other advice? #speaker:Shop Keep #portrait:market1 #layout:right
    ->Shop2
+[Be cautious] #speaker:Hero #portrait:hero #layout:left
    Be careful! I've learned that Greeks sometimes attack their neighbors. It would be terrible to be out at sea and then get attacked! #speaker:Hero #portrait:hero #layout:left   
That's right! Different islands raid each other on a regular basis. I need to look out for people trying to attack. #speaker:Shop Keep #portrait:market1 #layout:right
    ~ShopAnswers ++
    ~HeroKnowledge = MerchantAnswers + ShopAnswers + VillagerAnswers + PriestAnswers
    ->KnowledgeCheck
*Don't Go #speaker:Hero #portrait:hero #layout:left
    But we need to get supplies from other islands. The geography here is too harsh to provide for all of our needs. We rely on trade with others. #speaker:Shop Keep #portrait:market1 #layout:right
    ->Shop2
*Pack Lightly #speaker:Hero #portrait:hero #layout:right
    I'm not sure what good that is going to do, but thanks for the advice, I guess... Any other suggestions? #speaker:Shop Keep #portrait:market1 #layout:right
    ->Shop2
*Bring a map #speaker:Hero #portrait:hero #layout:right
    Well, of course I'm going to bring a map. Thanks for the advice. Do you have any other suggestions? #speaker:Shop Keep #portrait:market1 #layout:right
    ->Shop2

== KnowledgeCheck
~ spokeToShop = true
{HeroKnowledge == 10: BOSS BATTLE->VillainBattle|->VillagerEnd}

===VillagerEnd
{spokeToVillager == false: Make sure you talk to the Villager in his house to the North.->ShopEnd|->ShopEnd} #speaker:Shop Keep #portrait:market1 #layout:right

==ShopEnd
{spokeToShop == false: There is a helpful Shop Keep in the Agora that you should talk to. ->PriestEnd|->PriestEnd} #speaker:Shop Keep #portrait:market1 #layout:right

===PriestEnd
{spokeToPriest == false: Don't forget to talk to the Priest in the Temple to the East.|Goodbye!->END} #speaker:Shop Keep #portrait:market1 #layout:right
Goodbye!
    ->END

=== alreadyspoke
You already spoke to me. #speaker:Shop Keep #portrait:market1 #layout:right
{spokeToMerchant == false: Make sure you talk to the Merchant to the South West.->ShopEnd |->ShopEnd} 

Good luck on the rest of your adventure! Goodbye!
->END

==VillainBattle

Oh my! It appears you are strong enough for the Boss Battle! #speaker:Shop Keep #portrait:market1 #layout:right
+BOSS BATTLE
~BossBattle = true 
    ->END
