transfer(X, Y) :-
    Y is X.
    
transfer2(X,X).


outputprint :-
    write('Hello World!'), nl.



if_example(X) :-
    ( X > 0 ->
        write('X is positive'), nl
    ; X < 0 ->
        write('X is negative'), nl
    ;
        write('X is zero'), nl
    ).

yes_no_condition(Answer, Validity) :-
    ( (Answer == 'y' ; Answer == 'Y') ->
        write('You answered yes'), nl,
        Validity = good
    ; (Answer == 'n' ; Answer == 'N') ->
        write('You answered no'), nl,
        Validity = good
    ; (Answer == 'rarely' ; Answer == 'sometimes' ; Answer == 'often' ; Answer == 'frequently')->
        write('You answered '), write(Answer), nl,
        Validity = good
    ;
        write('Invalid answer'), nl,
        Validity = bad

        ). 




read_the_input(Input) :-
    write('Please enter something: '), nl,
    read(Input),
    write('You entered: '), write(Input), nl.

symptomPrompt(Answer,Question) :-
    write(Question), nl,
    read(Answer),
    transfer2(Answer, CurrentAnswer),
    yes_no_condition(CurrentAnswer, Validity),
    (Validity == good ->
        write('Proceeding with analysis...'), nl
    ; Validity == bad ->
        write('Please answer with y/Y or n/N only.'), nl,
        symptomPrompt(Answer, Question)    
    ).



main :-
    //Behavioral symptoms are most likely y/n answers, while frequency-based symptoms accept rarely/sometimes/often/frequently
    
    // Emotional State
    symptomPrompt(sadness_or_hopelessness, '1/21: How often have you felt down, depressed, or hopeless over the past few weeks? (rarely/sometimes/often/frequently)').
    symptomPrompt(irritability, '2/21: How often have you felt easily annoyed, agitated, or irritable? (rarely/sometimes/often/frequently)').
    symptomPrompt(excessive_worry_or_anxiety, '3/21: How often have you been bothered by worrying too much about different things or feeling anxious? (rarely/sometimes/often/frequently)').
    symptomPrompt(loss_of_interest, '4/21: How often have you lost interest or pleasure in doing things you usually enjoy? (rarely/sometimes/often/frequently)').
    symptomPrompt(guilt_or_worthlessness, '5/21: How often have you felt bad about yourself—or that you are a failure or have let yourself or your family down? (rarely/sometimes/often/frequently)').

    // Cognitive Function
    symptomPrompt(concentration_difficulty, '6/21: How often have you had difficulty concentrating on things, such as reading the newspaper or watching television? (rarely/sometimes/often/frequently)').
    symptomPrompt(memory_issues, '7/21: How often have you had trouble remembering things, such as appointments, recent events, or conversations? (rarely/sometimes/often/frequently)').
    symptomPrompt(sudden_intrusive_thoughts, '8/21: Do you experience sudden, unwanted thoughts that are difficult to dismiss and cause distress? (y/n)').

    // Energy and Behavioral Changes
    symptomPrompt(sleeping_problems, '9/21: How often have you had trouble falling asleep, staying asleep, or sleeping too much? (rarely/sometimes/often/frequently)').
    symptomPrompt(fatigue_or_low_energy, '10/21: How often have you felt tired or had little energy? (rarely/sometimes/often/frequently)').
    symptomPrompt(hyperactivity_or_impulsivity, '11/21: Have you experienced a period where you felt unusually energetic, restless, or acted impulsively without thinking of consequences? (y/n)').
    symptomPrompt(repetitive_or_inflexible_behaviors, '12/21: Do you feel a strong need to perform specific repetitive actions or rituals (e.g., checking, arranging) to reduce distress? (y/n)').
    symptomPrompt(risky_or_impulsive_behavior, '13/21: Have you recently engaged in significant behaviors (e.g., spending, driving, substance use) that are unusually risky or impulsive? (y/n)').
    symptomPrompt(psychomotor_changes, '14/21: How often have you noticed that you move or speak much slower than usual, or been so restless or fidgety that you move around a lot? (rarely/sometimes/often/frequently)').

    // Eating and Body Image
    symptomPrompt(reduced_food_intake, '15/21: Have you been intentionally restricting your food intake or eating significantly less than usual? (y/n)').
    symptomPrompt(binge_eating, '16/21: Have you had episodes where you ate an unusually large amount of food in a short period while feeling a loss of control? (y/n)').
    symptomPrompt(compensatory_behaviors, '17/21: Following eating, do you engage in behaviors such as vomiting, using laxatives, or excessive exercise to prevent weight gain? (y/n)').
    symptomPrompt(body_image_distortion, '18/21: Do you judge your self-worth based primarily on your body shape or weight, or feel intensely dissatisfied with your body? (y/n)').

    // Trauma and Social
    symptomPrompt(flashbacks, '19/21: Have you had experiences where you feel like you are reliving a past traumatic event (a flashback)? (y/n)').
    symptomPrompt(socializing_issues, '20/21: How often have you felt isolated, avoided social situations, or had difficulty connecting with others? (rarely/sometimes/often/frequently)').
    symptomPrompt(disorganized_thinkings, '21/21: Have people told you that your thoughts seem disorganized, racing, or hard to follow? (y/n)').