
;; call break specific functions

(= *winsuit 'spades)

;; return all cards of the same suit greater that the given card
;; if no cards exist, then return all cards of the suit
(def valid-suit-moves (card cards)
 (let vcards (trues [if (higher-order _ card) _]  (cards-of-suit card!suit cards))
  (if vcards
      vcards
    (cards-of-suit card!suit cards))))

;;valid moves
;;if you are the first player, then all cards are valid
;;else if you have cards of the first suit played, then only those cards are valid,
;;else all cards of *wsuit are valid 
;;else all 
(def valid-moves (cards pcards)
     (if (empty pcards)     
		cards
       	(aif (valid-suit-moves (car pcards) cards)
	   		it
	 		(aif (cards-of-suit  *winsuit cards)
	     		it
	   			cards))))

;;todo
(def get-called-points (players)
	(obj 1 (rand-choice 1 2 3 4)
		   2 (rand-choice 1 2 3 4)
		   3 (rand-choice 1 2 3 4)
		   4 (rand-choice 1 2 3 4)))


(def get-selected-card (cards)
	(let input (coerce (read) 'string)
		(let selected-card nil
			(car (mem (fn (card)
						(and  
							(is (input 0) ((coerce (suit-of card) 'string) 0))
							(is (input 1) ((coerce (val-of card) 'string)  0)))) cards)))))
			 			

(def get-user-input (cards ccards)
	(prn "played-cards" ccards)
	(prn "your cards" )
	(prn "choose one as first letter of suit and card value for eg h4 for 4 of hearts.")
	(each card cards
		(prn (suit-of card) " " (val-of card)))
		(let selected-card nil
			(while (no selected-card) 
				(prn "select: ")
				(= selected-card (get-selected-card cards)))
		selected-card))

(def get-card (player ccards)
	(let pcards (ccards-get-card ccards)
		(let card  
			(case player!id
			4  (get-user-input (valid-moves player!cards pcards) ccards) 
				 (car (shuffle (valid-moves player!cards pcards))))
		(= player!cards (rem card player!cards))	card)))
		
		
(def calculate-hand-winner (ccards)
	(let q (rev ccards)
		(let win (car q)
			(let firstsuit (suit-of win!card)
				(each ccard (cdr q)
					(and 
						(is-of-suit (suit-of win!card) ccard!card)
						(higher-order ccard!card win!card)
							(= win ccard))
					(and 
						(is-of-suit *winsuit ccard!card)
						(~is-of-suit *winsuit  win!card)
							(= win ccard))))
						win!id)))


(def new-current-points (players)
	(let current-points (table)
		(each player players
			(= (current-points player!id) 0))
	current-points))

(def update-player-score (wid  current-points)
	(prn "new score of winner " wid " is " (+ 1 (current-points wid)))
	(= (current-points wid) (+ 1 (current-points wid))))

(def calculate-score (called-points current-points)
	(let rscore (table)
		(maptable (fn (k v)
			(if (<= v (current-points k) )
				(= (rscore k) v)
				(= (rscore k) (* -1 v)))) 
		called-points)
		rscore))
		
		
(def display-winner (id)
	(prn "you are the winner " id))

;;todo
(def calculate-winner (scorecard)
	(scorecard-highest scorecard))

		
(def play-round (players scorecard)
	(distr-cards (shuffle (new-deck))  players)
	(let  called-points (get-called-points players)
		(let current-points (new-current-points players)
			(prn "called points " called-points)
			(prn "current points " current-points)
		(repeat 13
			(let ccards (make-ccards) 
				(each player players 
					(let playedcard (get-card player ccards)
						(prn "playedcard " player!id " " playedcard )
						(= ccards (ccards-add ccards player!id playedcard))))
				(update-player-score (calculate-hand-winner ccards) current-points)))
			 (scorecard-add (calculate-score called-points current-points) scorecard))))


(def gameplay (players (o rounds 5))
	(let scorecard (make-scorecard '())
		(repeat rounds 
			(= scorecard (play-round players scorecard))
			(prn "current scorecard" scorecard))
		(display-winner (calculate-winner scorecard))))
		