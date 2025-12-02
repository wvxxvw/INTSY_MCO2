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
    read(CurrentAnswer),
    transfer2(Answer, CurrentAnswer),
    yes_no_condition(CurrentAnswer, Validity),
    (Validity == good ->
        write('Proceeding with analysis...'), nl
    ; Validity == bad ->
        write('Please answer with y/Y or n/N only.'), nl,
        symptomPrompt(Answer, Question)    
    ).
frequency(Answer, Percentage) :- 
    (Answer == 'rarely' ->
        Percentage is 0.25
    ; Answer == 'sometimes' ->
        Percentage is 0.5
    ; Answer == 'often' ->
        Percentage is 0.75
    ; (Answer == 'frequently' ; Answer == 'Y'; Answer == 'y'; Answer == 'N'; Answer == 'n') ->
        Percentage is 1.0
    ; 
        Percentage is -1.0 % Invalid input
    ).


majorDepressiveOrder(SadnessFreq, IrritabilityFreq, WorryFreq, InterestFreq, GuiltFreq,
                    Concentration_difficulty, Memory_issues, SleepFreq, FatigueFreq,
                    PsychomotorFreq, ReducedFoodFreq) :-
    TotalFreq is SadnessFreq + IrritabilityFreq + WorryFreq + InterestFreq + GuiltFreq
                + Concentration_difficulty + Memory_issues + SleepFreq + FatigueFreq
                + PsychomotorFreq + ReducedFoodFreq,
    AverageFreq is TotalFreq / 11,
    frequencyScore(AverageFreq, 'Major Depressive Disorder').

anxietyDisorder(IrritabilityFreq, WorryFreq, Concentration_difficulty, SleepFreq, FatigueFreq, SocialFreq) :-
    TotalFreq is IrritabilityFreq + WorryFreq + Concentration_difficulty + SleepFreq + FatigueFreq + SocialFreq,
    AverageFreq is TotalFreq / 6,
    frequencyScore(AverageFreq, 'Anxiety Disorder').

bipolarDisorder(SadnessFreq, IrritabilityFreq, InterestFreq, ConcentrationFreq, SleepFreq, FatigueFreq, HyperImpulsivityFreq, RiskyFreq, PsychomotorFreq):-
    TotalFreq is SadnessFreq + IrritabilityFreq + InterestFreq + ConcentrationFreq + SleepFreq + FatigueFreq
                + HyperImpulsivityFreq + RiskyFreq + PsychomotorFreq,
    AverageFreq is TotalFreq / 9,
    frequencyScore(AverageFreq, 'Bipolar Disorder').

postTraumaticStressDisorder(IrritabilityFreq, WorryFreq, InterestFreq, GuiltFreq, ConcentrationFreq, MemoryFreq, IntrusiveFreq, SleepFreq, RiskyFreq, FlashbackFreq, SocialFreq):-
    TotalFreq is IrritabilityFreq + WorryFreq + InterestFreq + GuiltFreq + ConcentrationFreq + MemoryFreq + IntrusiveFreq
                + SleepFreq + RiskyFreq + FlashbackFreq + SocialFreq,
    AverageFreq is TotalFreq / 11,
    frequencyScore(AverageFreq, 'Post-Traumatic Stress Disorder').

anorexiaNervosa(WorryFreq, GuiltFreq, FatigueFreq, RepetitiveFreq, ReducedFoodFreq, BodyImageFreq) :-
    TotalFreq is WorryFreq + GuiltFreq + FatigueFreq + RepetitiveFreq + ReducedFoodFreq + BodyImageFreq,
    AverageFreq is TotalFreq / 6,
    frequencyScore(AverageFreq, 'Anorexia Nervosa').

bulimiaNervosa(WorryFreq, GuiltFreq, BingeFreq, CompensatoryFreq, BodyImageFreq) :-
    TotalFreq is WorryFreq + GuiltFreq + BingeFreq + CompensatoryFreq + BodyImageFreq,
    AverageFreq is TotalFreq / 5,
    frequencyScore(AverageFreq, 'Bulimia Nervosa').

MajorNeurocognitiveDisorder(IrritabilityFreq, ConcentrationFreq, MemoryFreq, DisorganizedFreq, SocialFreq) :-
    TotalFreq is IrritabilityFreq + ConcentrationFreq + MemoryFreq + DisorganizedFreq + SocialFreq,
    AverageFreq is TotalFreq / 5,
    frequencyScore(AverageFreq, 'Major Neurocognitive Disorder').

AutismSpectrumDisorder(IrritabilityFreq, ConcentrationFreq, RepetitiveFreq, SocialFreq) :-
    TotalFreq is IrritabilityFreq + ConcentrationFreq + RepetitiveFreq + SocialFreq,
    AverageFreq is TotalFreq / 4,
    frequencyScore(AverageFreq, 'Autism Spectrum Disorder').

ADHD(ConcentrationFreq,DisorganizedFreq,SleepFreq, HyperImpulsivityFreq, RiskyFreq):-
    TotalFreq is ConcentrationFreq + DisorganizedFreq + SleepFreq + HyperImpulsivityFreq + RiskyFreq,
    AverageFreq is TotalFreq / 5,
    frequencyScore(AverageFreq, 'Attention-Deficit/Hyperactivity Disorder (ADHD)').

BodyDismorphicDisorder(WorryFreq, GuiltFreq, RepetitiveFreq, BodyImageFreq, SocialFreq) :-
    TotalFreq is WorryFreq + GuiltFreq + RepetitiveFreq + BodyImageFreq + SocialFreq,
    AverageFreq is TotalFreq / 5,
    frequencyScore(AverageFreq, 'Body Dysmorphic Disorder').

frequencyScore(AvgFrq, DisorderName) :-
    write('Your '), write(DisorderName), write(' Symptom Frequency Score is: '), write(AvgFrq), nl,
    (AvgFrq >= 0.7 ->
        write('High likelihood of '), write(DisorderName), write(' symptoms.'), nl
    ; AvgFrq >= 0.4 ->
        write('Moderate likelihood of '), write(DisorderName), write(' symptoms.'), nl
    ;
        write('Low likelihood of '), write(DisorderName), write(' symptoms.'), nl
    )
    

mainProgram :-
    //Behavioral symptoms are most likely y/n answers, while frequency-based symptoms accept rarely/sometimes/often/frequently

    // Emotional State
    symptomPrompt(Sadness_or_hopelessness, '1/21: How often have you felt down, depressed, or hopeless over the past few weeks? (rarely/sometimes/often/frequently)').
    symptomPrompt(Irritability, '2/21: How often have you felt easily annoyed, agitated, or irritable? (rarely/sometimes/often/frequently)').
    symptomPrompt(Excessive_worry_or_anxiety, '3/21: How often have you been bothered by worrying too much about different things or feeling anxious? (rarely/sometimes/often/frequently)').
    symptomPrompt(Loss_of_interest, '4/21: How often have you lost interest or pleasure in doing things you usually enjoy? (rarely/sometimes/often/frequently)').
    symptomPrompt(Guilt_or_worthlessness, '5/21: How often have you felt bad about yourself—or that you are a failure or have let yourself or your family down? (rarely/sometimes/often/frequently)').

    // Cognitive Function
    symptomPrompt(Concentration_difficulty, '6/21: How often have you had difficulty concentrating on things, such as reading the newspaper or watching television? (rarely/sometimes/often/frequently)').
    symptomPrompt(Memory_issues, '7/21: How often have you had trouble remembering things, such as appointments, recent events, or conversations? (rarely/sometimes/often/frequently)').
    symptomPrompt(Sudden_intrusive_thoughts, '8/21: Do you experience sudden, unwanted thoughts that are difficult to dismiss and cause distress? (y/n)').

    // Energy and Behavioral Changes
    symptomPrompt(Sleeping_problems, '9/21: How often have you had trouble falling asleep, staying asleep, or sleeping too much? (rarely/sometimes/often/frequently)').
    symptomPrompt(Fatigue_or_low_energy, '10/21: How often have you felt tired or had little energy? (rarely/sometimes/often/frequently)').
    symptomPrompt(Hyperactivity_or_impulsivity, '11/21: Have you experienced a period where you felt unusually energetic, restless, or acted impulsively without thinking of consequences? (y/n)').
    symptomPrompt(Repetitive_or_inflexible_behaviors, '12/21: Do you feel a strong need to perform specific repetitive actions or rituals (e.g., checking, arranging) to reduce distress? (y/n)').
    symptomPrompt(Risky_or_impulsive_behavior, '13/21: Have you recently engaged in significant behaviors (e.g., spending, driving, substance use) that are unusually risky or impulsive? (y/n)').
    symptomPrompt(Psychomotor_changes, '14/21: How often have you noticed that you move or speak much slower than usual, or been so restless or fidgety that you move around a lot? (rarely/sometimes/often/frequently)').

    // Eating and Body Image
    symptomPrompt(Reduced_food_intake, '15/21: Have you been intentionally restricting your food intake or eating significantly less than usual? (y/n)').
    symptomPrompt(Binge_eating, '16/21: Have you had episodes where you ate an unusually large amount of food in a short period while feeling a loss of control? (y/n)').
    symptomPrompt(Compensatory_behaviors, '17/21: Following eating, do you engage in behaviors such as vomiting, using laxatives, or excessive exercise to prevent weight gain? (y/n)').
    symptomPrompt(Body_image_distortion, '18/21: Do you judge your self-worth based primarily on your body shape or weight, or feel intensely dissatisfied with your body? (y/n)').

    // Trauma and Social
    symptomPrompt(Flashbacks, '19/21: Have you had experiences where you feel like you are reliving a past traumatic event (a flashback)? (y/n)').
    symptomPrompt(Socializing_issues, '20/21: How often have you felt isolated, avoided social situations, or had difficulty connecting with others? (rarely/sometimes/often/frequently)').
    symptomPrompt(Disorganized_thinkings, '21/21: Have people told you that your thoughts seem disorganized, racing, or hard to follow? (y/n)').
    
    frequency(Sadness_or_hopelessness, SadnessFreq),
    frequency(Irritability, IrritabilityFreq),
    frequency(Excessive_worry_or_anxiety, WorryFreq),
    frequency(Loss_of_interest, InterestFreq),
    frequency(Guilt_or_worthlessness, GuiltFreq),
    frequency(Concentration_difficulty, ConcentrationFreq),
    frequency(Memory_issues, MemoryFreq),
    frequency(Sudden_intrusive_thoughts, IntrusiveFreq),
    frequency(Sleeping_problems, SleepFreq),
    frequency(Fatigue_or_low_energy, FatigueFreq),
    frequency(Hyperactivity_or_impulsivity, HyperImpulsivityFreq),
    frequency(Repetitive_or_inflexible_behaviors, RepetitiveFreq), 
    frequency(Risky_or_impulsive_behavior, RiskyFreq), 
    frequency(Psychomotor_changes, PsychomotorFreq),
    frequency(Reduced_food_intake, ReducedFoodFreq), 
    frequency(Binge_eating, BingeFreq), 
    frequency(Compensatory_behaviors, CompensatoryFreq), 
    frequency(Body_image_distortion, BodyImageFreq), 
    frequency(Flashbacks, FlashbackFreq), 
    frequency(Socializing_issues, SocialFreq),
    frequency(Disorganized_thinkings, DisorganizedFreq), 

    majorDepressiveOrder(SadnessFreq, IrritabilityFreq, WorryFreq, InterestFreq, GuiltFreq,
        ConcentrationFreq, MemoryFreq, SleepFreq, FatigueFreq,
        PsychomotorFreq, ReducedFoodFreq),
    anxietyDisorder(IrritabilityFreq, WorryFreq, ConcentrationFreq, SleepFreq, FatigueFreq, SocialFreq),
    bipolarDisorder(SadnessFreq, IrritabilityFreq, InterestFreq, Concentration
Freq, SleepFreq, FatigueFreq,
        HyperImpulsivityFreq, RiskyFreq, PsychomotorFreq),
    postTraumaticStressDisorder(IrritabilityFreq, WorryFreq, InterestFreq, GuiltFreq, ConcentrationFreq, MemoryFreq, IntrusiveFreq,
        SleepFreq, RiskyFreq, FlashbackFreq, SocialFreq),
    anorexiaNervosa(WorryFreq, GuiltFreq, FatigueFreq, RepetitiveFreq, ReducedFoodFreq, BodyImageFreq),
    bulimiaNervosa(WorryFreq, GuiltFreq, BingeFreq, CompensatoryFreq, BodyImageFreq),
    MajorNeurocognitiveDisorder(IrritabilityFreq, ConcentrationFreq, MemoryFreq, DisorganizedFreq,
        SocialFreq),
    AutismSpectrumDisorder(IrritabilityFreq, ConcentrationFreq, RepetitiveFreq, SocialFreq),
    ADHD(ConcentrationFreq,DisorganizedFreq,SleepFreq, HyperImpulsivityFreq, RiskyFreq),
    BodyDismorphicDisorder(WorryFreq, GuiltFreq, RepetitiveFreq, BodyImageFreq, SocialFreq),


    write('Thank you for completing the assessment. Processing your responses...'), nl.