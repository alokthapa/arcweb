
(= *suits '(diamond spades clubs hearts))

(= *cardvals '(A K Q J 10 9 8 7 6 5 4 3 2 ))

;;a card DUH!!
(deftem card suit nil val nil)

;; basic functions
(def make-card (suit val)
	(inst 'card 'suit suit 'val val))

(def suit-of (card)
	card!suit)

(def val-of (card)
	card!val)	

(def equal-card? (card1 card2)
	(if (or (no card1) (no card2))
		nil
	(and (is (suit-of card1) (suit-of card2))
	 (is (val-of card1) (val-of card2)))))

(def iso-cards? (list1 list2)
	(if (and (empty list1) (empty list2))  
		t									
		(and (equal-card? (car list1) (car list2))
 	 		(iso-cards? (cdr list1) (cdr list2)))))

;;create new deck
(def new-deck ()
     (let deck '()
	  (each val *cardvals
		(each suit *suits
		      (push (inst 'card 'suit suit  'val val) deck)))
	  deck))

;;shuffle
(def shuffle (deck)
     (with (ndeck '() cdeck (copy deck))
	  (until (empty cdeck)
		 (let rcard (random-elt cdeck)
		      (do 
			  (push rcard ndeck)
			  (= cdeck (rem rcard cdeck)))))
	  ndeck))

;;is get cards of suit
(def is-of-suit (suit card)
     (if (is card!suit suit) t))

;;gets all cards of a given suit
(def cards-of-suit (suit cards)
     (trues  (fn (_) (if (is-of-suit suit _) _)) cards))       

;;t if card1 has higher card value than card2
(def higher-order (card1 card2)
     (< (pos card1!val *cardvals) (pos card2!val *cardvals)))

;;distribute the cards (players desctructive)
(def distr-cards (crds players (o split-num 13))
     (let split-cards (tuples crds split-num)
	  ((afn (players split-cards)
		(when (~no players)
		  (with (p (car players) icards (car split-cards))
			(= p!cards icards))
		  (self (cdr players) (cdr split-cards)))) players split-cards))
     players)
