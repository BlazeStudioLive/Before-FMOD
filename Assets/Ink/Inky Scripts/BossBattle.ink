INCLUDE Globals.ink

~bossLeave = false
~fightStart = false
~win = false

What was that? What just happened??? #speaker:Villain #portrait:villain #layout:right
My, my, my... What do we have here? It appears to be a lost and confused child.

Lost child??? I am a child but I am not lost and I'm certainly not confused! I know exactly what I'm doing. #speaker:Hero #portrait:hero #layout:left
I'm here for my FRIEND! Hand them over! I was at the Time Ceremony. I know all about your plan. I'm here to stop you! 

BWAAAAA HAAAAAAA HAAAAAAA HAAAAAA... Oooooo...... HAAA HAAA HA HA HA... #speaker:Villain #portrait:villain #layout:right
Ha!
I'm sorry... I haven't heard anything so funny in ages! Changing the knowledge of our ancestors is serious business. I needed the laugh! These robots have no sense of humor.

We'll see who's laughing when I'm done with you!! Knowledge is power and I've got more than enough to take you down! #speaker:Hero #portrait:hero #layout:left

Do you REALLY think someone as young as yourself can challenge the most advanced mind in the history of Homo Sapiens?? Hmmmm?? Do you?? #speaker:Villain #portrait:villain #layout:right
~HeroKnowledge = 0
I THINK NOT! No, no, no... Look at your Knowledge Meter... It's empty! I'll have my robots take care of you. 
Wait a minute, what am I thinking?? I don't need to waste this many robots on just one pitiful child... In fact, I'll just leave one. I'm sure it will be more than enough.
Oh, and by the way... I do have your FRIEND. Don't worry, they're perfectly safe...... For now...........
BWAAAAA HAAAAAAA HAAAAAAA HAAAAAA... 
~bossLeave = true

... #speaker:Time Robot #portrait:timerobot #layout:right
Human child. I pity you. You are no match for my robot intelligence. You will surely lose this battle.

What's going on? Where did the Villain run off to with my FRIEND?? #speaker:Hero #portrait:hero #layout:left

Where??? The more important question is: WHEN? #speaker:Time Robot #portrait:timerobot #layout:right
Ancient Egypt, maybe? Possibly Rome. Mesopotamia, China, Africa, Mesoamerica... It really doesn't matter. The ancestors knowledge is in all these times and places. So that is where he will go.

NOOOOOO!!!! Well... What do you want from me? What are you waiting for, huh? I'm gonna defeat you and then I'm going to follow right behind the Villain and get my FRIEND back! #speaker:Hero #portrait:hero #layout:left
We shall see about that. Let us have a battle of the wits. Whoever answers these questions first is the winner and can continue on to the Time Machine. The loser will be stuck in Ancient Greece FOREVER! #speaker:Time Robot #portrait:timerobot #layout:right
It will take me exactly 3 minutes to complete this task. Finish before then or be stuck in the past.
I would wish you "good luck" but I know it will do no good.

Bring it on! #speaker:Hero #portrait:hero #layout:left
~fightStart = true
~MerchantAnswers = 0
~ShopAnswers = 0
~VillagerAnswers = 0
~PriestAnswers = 0
->MerchantFight1

==MerchantFight1
Which best describes the city of Corinth?  #speaker:Time Robot #portrait:timerobot #layout:right
+A small village #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
-> MerchantFight1
+An agricultural center
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
->MerchantFight1
+A wealthy city  #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Next question:
    ->MerchantFight2
+A small trade Area #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
-> MerchantFight1

==MerchantFight2
Which is the best place for an Ancient Greek Merchant? #speaker:Time Robot #portrait:timerobot #layout:right
+Pacific Ocean #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    -> MerchantFight2
+Mediterranean Sea #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right 
~HeroKnowledge ++
Next question:
    ->MerchantFight3
+Black Sea #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->MerchantFight2
+Carribean Sea #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->MerchantFight2

== MerchantFight3
Greece is surrounded by the sea. Besides the Mediterranean and Aegean, what is the other sea? #speaker:Time Robot #portrait:timerobot #layout:right
+Red Sea #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->MerchantFight3
+Ionian Sea
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Next question:
    -> ShopFight1
+Dead Sea #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->MerchantFight3
+Carribean Sea #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->MerchantFight3
    
==ShopFight1
Which of the following is one of Greece's most widely grown crops? #speaker:Time Robot #portrait:timerobot #layout:right
+Tomatoes #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->ShopFight1
+Wool #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->ShopFight1
+Rice #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->ShopFight1
+Olives #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Next question:
    ->ShopFight2

==ShopFight2
True or False: Ancient Greeks were a united people and war between city-states was rare. #speaker:Time Robot #portrait:timerobot #layout:right
+True #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->ShopFight2
+False #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Next question:
    ->VillagerFight1
    
==VillagerFight1
Which most accurately describes the lifestyle of a typical person in Ancient Greece?  #speaker:Time Robot #portrait:timerobot #layout:right
+Merchants #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight1
+Farmers #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Next question:
        -> VillagerFight2
+Royalty #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight1
+Scholars #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight1

==VillagerFight2
What do we call the flat areas that farmers build in order to grow their crops? #speaker:Time Robot #portrait:timerobot #layout:right
+Farmland #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight2
+Valleys #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight2
+Plateaus #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight2
+Terraces #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Next question:
    ->VillagerFight3
    
==VillagerFight3
Which animals would you NOT find on a typical Greek farm? #speaker:Time Robot #portrait:timerobot #layout:right
*Pigs #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight3
*Chickens #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight3
+Horses #speaker:Hero #portrait:hero #layout:left
That is correct.  #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Next question:
    ->PriestFight1
*Cows #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->VillagerFight3
    
==PriestFight1
What do Greeks call the building where they go to pay tribute to their Gods? #speaker:Time Robot #portrait:timerobot #layout:right
+Church #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    -> PriestFight1
+Tower #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
->PriestFight1
+Temple #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Final question:
    -> PriestFight2
+Mosque #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    -> PriestFight1
    
==PriestFight2
Which God is the patron God of Corinth? #speaker:Time Robot #portrait:timerobot #layout:right
+ Poseidon, god of the sea #speaker:Hero #portrait:hero #layout:left
That is correct. #speaker:Time Robot #portrait:timerobot #layout:right
~HeroKnowledge ++
Oh my. You have defeated me.
...
~win = true
->END
* Zeus, father of the gods #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->PriestFight2
* Clothos, god of clothing #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->PriestFight2
* Demeter, goddess of animals #speaker:Hero #portrait:hero #layout:left
That is not correct. #speaker:Time Robot #portrait:timerobot #layout:right
    ->PriestFight2