INCLUDE Globals.ink

{spokeToSecret == false: Hello! Isn't the water just lovely? Some people spend all day in the Agora, but not me! I just LOVE being near the water. This corner here and the area right by the Temple are my 2 favorite spots!| Nice to see you again!} #speaker:Villager #portrait:villagerwithsecret #layout:right
->SecretVillager

==SecretVillager


{spokeToPriest == true: Oh, I see you've already spoken to the Priest. Did you notice the locked door right in the Entrance Room when you first enter? I always wonder what's inside...| Oh, you haven't spoken to the Priest yet. Have you been inside the Temple? You can only enter 2 rooms, but I hear it's bigger than that. I've always wondered what's inside the locked door by the Entrance Room.}
I've heard a rumor about a SECRET ROOM that contains the key to the door.
Do you think it's true?
~spokeToSecret = true
->END