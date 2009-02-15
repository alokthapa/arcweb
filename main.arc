
;;this should be a good game
( = *documentroot  "~/hacking/lispapp/arcbreak/")

(def loadpfile (fname)
	(load (string *documentroot fname)))

(def loadpfiles (fnames)
	(map1 loadpfile fnames))

(loadpfiles 
		'(
		"utility.arc"
		"cards.arc"
		"players.arc"		
		"scorecard.arc"
		"current-cards.arc"
		"callbreak.arc"
		"testdata.arc"
		"web.arc"
		
		"players_test.arc"
		"cards_test.arc"
		"scorecard_test.arc"
		"current-cards_test.arc"
		"callbreak_test.arc"))
	