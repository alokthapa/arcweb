
;;a player has a set of cards and an id
(deftem player
  id nil
  cards nil)


(def playerid (player)
	player!id)
	
(def make-player (id cards)
	(inst 'player 'id id 'cards cards))

(def equal-player? (player1 player2)
	(is player1!id player2!id))


(def find-player (players id)
	(find (fn (x) (is (playerid x) id)) 
		players))
