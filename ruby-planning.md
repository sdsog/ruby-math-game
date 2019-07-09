# Ruby Math Game Planning

### PLAYERS

Will be 2 instances (player1 & player2) 

#### - STATE
    - name 
    - lives (initialize = 3) 

#### - BEHAVIOURS
    - lose_life
    - current_lives

----
----

### QUESTION

Will generate a question for each round and check to see if answered correctly.

#### - STATE
    - question_framework i.e. "what does x plus y equal"?
        - will be a symbol


#### - BEHAVIOURS
    - generate_question
    - answered_correctly?
            -needs: player_answer
    - random_num1
    - random_num2
    - answer (hidden)


----
----

### GAME

General framework for the game, providing prompts for appropriate player

#### - STATE
    - game_alerts
        -symbols

#### - BEHAVIOURS
    - current_round
        - loops 
    - current_question 
    - current_player
    - player_answer
    - end_of_round
    - end_of_game?



