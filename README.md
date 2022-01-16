# MOURATIDIS VASILEIOS 133990



Request:
curl -X POST --data "username=mourat" http://localhost/moutzouris/moutzouris.php/players/P1/
Response: (κάνει login)
[
    {
        "username": "mourat",
        "player": "P1",
        "token": "95a6c75eaa0c6876fee5e5841d1f1b10",
        "last_action": "2022-01-16 18:11:24"
    }
]

Request:
curl -X POST --data "username=sakis" http://localhost/moutzouris/moutzouris.php/players/P2/
Response: (το count των παικτών το εμφανίζει γιατί συνδέθηκε και ο δεύτερος χρήστης και έχει ξεκινήσει το παιχνίδι)
[
    {
        "P1_cards": 20,
        "P2_cards": 21
    }
][
    {
        "username": "sakis",
        "player": "P2",
        "token": "58e745847f1550089e5b2a23d97e0baf",
        "last_action": "2022-01-16 18:11:50"
    }
]


Request:
curl -X POST http://localhost/moutzouris/moutzouris.php/board/move/1 -H "X-Token: 95a6c75eaa0c6876fee5e5841d1f1b10"
Response: (κίνηση, επιστρέφει το χέρι του παίκτη και το πλήθος καρτών στο χέρι κάθε παίκτη)
[
    {
        "numcard": "K",
        "symbcard": "C",
        "idcard": 11,
        "player": "P1"
    },
    {
        "numcard": "7",
        "symbcard": "D",
        "idcard": 38,
        "player": "P1"
    },
    {
        "numcard": "9",
        "symbcard": "H",
        "idcard": 30,
        "player": "P1"
    },
    {
        "numcard": "6",
        "symbcard": "S",
        "idcard": 17,
        "player": "P1"
    },
    {
        "numcard": "5",
        "symbcard": "S",
        "idcard": 16,
        "player": "P1"
    }
][
    {
        "P1_cards": 5,
        "P2_cards": 4
    }
]


Request:
curl -X POST http://localhost/moutzouris/moutzouris.php/board/move/1 -H "X-Token: 58e745847f1550089e5b2a23d97e0baf"
Response: (κίνηση, επιστρέφει το χέρι του παίκτη και το πλήθος καρτών στο χέρι κάθε παίκτη)
[
    {
        "numcard": "6",
        "symbcard": "D",
        "idcard": 37,
        "player": "P2"
    },
    {
        "numcard": "7",
        "symbcard": "S",
        "idcard": 18,
        "player": "P2"
    },
    {
        "numcard": "9",
        "symbcard": "D",
        "idcard": 40,
        "player": "P2"
    }
][
    {
        "P1_cards": 4,
        "P2_cards": 3
    }
]

Request:
curl -X POST  http://localhost/moutzouris/moutzouris.php/board/reset
Response: (reset τα πάντα μόνο αν έχει τελειώσει η παρτίδα)
{
    "messagge": "Game not Ended",
    "code": 104
}

Request:
curl -X GET  http://localhost/moutzouris/moutzouris.php/board/ -H "X-Token: 95a6c75eaa0c6876fee5e5841d1f1b10"
Response: (ο χρήστης του token παίρνει το χέρι του) 
[
    {
        "P1_cards": 4,
        "P2_cards": 3
    }
][
    {
        "numcard": "K",
        "symbcard": "C",
        "idcard": 11,
        "player": "P1"
    },
    {
        "numcard": "7",
        "symbcard": "D",
        "idcard": 38,
        "player": "P1"
    },
    {
        "numcard": "9",
        "symbcard": "H",
        "idcard": 30,
        "player": "P1"
    },
    {
        "numcard": "6",
        "symbcard": "S",
        "idcard": 17,
        "player": "P1"
    }
][
    {
        "status": "started",
        "p_turn": "P1",
        "result": null,
        "last_change": "2022-01-16 18:13:54"
    }
]