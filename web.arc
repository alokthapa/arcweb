
(defop hello req 
	(whitepage 
		(prn "Hello world!") 
		(para) 
		(link "Click here") (prn "for") (prbold "more stuff")))

(mac gamepage (yeild)
	`(whitepage 
		(prn "Welcome to Callbreak!!") 
		(para) 
		,yeild ))

(def imagelink (src)
	(prn "<img  src='" src "' />"))
	
(def getimagelink (card)
	(prn "<img width='55' height='70' src='" (string "200px-Playing_card_" (suit-of card) "_" (val-of card) ".svg.gif") "' />"))

(def display-card (card)
	(getimagelink card))
	
(mac div ( yield)
	`(do
		(prn "<div style='width:70%;text-align:center;'>")
		,yield
		(prn "</div>")))

(def display-cards-of-suit (cards suit)
	(map1 (fn (card) (display-card card)) 
				(cards-of-suit suit cards)))

(def display-cards (cards)
	(div (imagelink "niki.gif"))
	(div (do (imagelink "niki-left.gif") (prn "hello world") (imagelink "niki-right.gif")))
	(prn "Your Cards")
	(div 
		(do
			(display-cards-of-suit cards 'hearts)
			(display-cards-of-suit cards 'clubs)
			(display-cards-of-suit cards 'diamond)
		 (display-cards-of-suit cards 'spades)))
	(br2))

(defop display1 req
	(gamepage (display-cards *p2!cards)))

(thread (serve 8080))

(def start-game (req) 
	(gamepage 
		(prn "game started!! you called " 
			(arg req "foo"))))

(def ask-for-call (req) 
	(aform start-game 
		(gamepage 
			(do
				(prn "make your call") 
				(input "foo") 
				(submit "I call") ))))

(defop newgame req 
	(newgame)
	(aform ask-for-call  
		(gamepage 
			(submit "newgame"))))

(def sth ())


(def doeach ()
	(each value '(1 2 3 4)
		(case value
			1 (sth)
			2 (sth)
			3 (aform )
			4 (sth))))

