(define (problem dungeon-level-03)
    (:domain hero-escape-from-dungeon)
    (:objects 
        initial-room - room
        sword-room-01 sword-room-02 sword-room-03 sword-room-04 - room
        monster-room-01 monster-room-02 monster-room-03 monster-room-04 monster-room-05 monster-room-06 monster-room-07 - room
        trap-room-01 trap-room-02 trap-room-03 trap-room-04 trap-room-05 trap-room-06 - room
        empty-room-01 - room
        escape-room - room
    )
    (:init 
        ;; hero's initial location
        (hero-at initial-room)

        ;; hero starts with a free hand
        (hand-free)

        ;; location of sword-room
        (is_sword-room sword-room-01)
        (is_sword-room sword-room-02)
        (is_sword-room sword-room-03)
        (is_sword-room sword-room-04)

        ;; location of monster-room
        (is_monster-room monster-room-01)
        (is_monster-room monster-room-02)
        (is_monster-room monster-room-03)
        (is_monster-room monster-room-04)
        (is_monster-room monster-room-05)
        (is_monster-room monster-room-06)
        (is_monster-room monster-room-07)

        ;; location of trap-room
        (is_trap-room trap-room-01)
        (is_trap-room trap-room-02)
        (is_trap-room trap-room-03)
        (is_trap-room trap-room-04)
        (is_trap-room trap-room-05)
        (is_trap-room trap-room-06)

        ;; location of empty-room
        (is_empty-room empty-room-01)

        ;; location of the escape room
        (is_escape-room escape-room)

        ;; graph connectivity
        (connected initial-room monster-room-06)
        (connected monster-room-06 sword-room-04)
        (connected sword-room-04 monster-room-07)
        (connected monster-room-07 trap-room-06)
        (connected empty-room-01 monster-room-04)
        (connected monster-room-04 trap-room-05)
        (connected trap-room-05 monster-room-05)
        (connected monster-room-05 sword-room-03)
        (connected trap-room-02 trap-room-03)
        (connected trap-room-03 sword-room-02)
        (connected sword-room-02 monster-room-03)
        (connected monster-room-03 trap-room-04)
        (connected sword-room-01 monster-room-01)
        (connected monster-room-01 monster-room-02)
        (connected monster-room-02 trap-room-01)
        (connected trap-room-01 escape-room)
        (connected initial-room empty-room-01)
        (connected empty-room-01 trap-room-02)
        (connected trap-room-02 sword-room-01)
        (connected monster-room-06 monster-room-04)
        (connected monster-room-04 trap-room-03)
        (connected trap-room-03 monster-room-01)
        (connected sword-room-04 trap-room-05)
        (connected trap-room-05 sword-room-02)
        (connected sword-room-02 monster-room-02)
        (connected monster-room-07 monster-room-05)
        (connected monster-room-05 monster-room-03)
        (connected monster-room-03 trap-room-01)
        (connected trap-room-06 sword-room-03)
        (connected sword-room-03 trap-room-04)
        (connected trap-room-04 escape-room)

        ;; graph connectivity in reverse
        (connected monster-room-06 initial-room)
        (connected sword-room-04 monster-room-06)
        (connected monster-room-07 sword-room-04)
        (connected trap-room-06 monster-room-07)
        (connected monster-room-04 empty-room-01)
        (connected trap-room-05 monster-room-04)
        (connected monster-room-05 trap-room-05)
        (connected sword-room-03 monster-room-05)
        (connected trap-room-03 trap-room-02)
        (connected sword-room-02 trap-room-03)
        (connected monster-room-03 sword-room-02)
        (connected trap-room-04 monster-room-03)
        (connected monster-room-01 sword-room-01)
        (connected monster-room-02 monster-room-01)
        (connected trap-room-01 monster-room-02)
        (connected escape-room trap-room-01)
        (connected empty-room-01 initial-room)
        (connected trap-room-02 empty-room-01)
        (connected sword-room-01 trap-room-02)
        (connected monster-room-04 monster-room-06)
        (connected trap-room-03 monster-room-04)
        (connected monster-room-01 trap-room-03)
        (connected trap-room-05 sword-room-04)
        (connected sword-room-02 trap-room-05)
        (connected monster-room-02 sword-room-02)
        (connected monster-room-05 monster-room-07)
        (connected monster-room-03 monster-room-05)
        (connected trap-room-01 monster-room-03)
        (connected sword-room-03 trap-room-06)
        (connected trap-room-04 sword-room-03)
        (connected escape-room trap-room-04)
    )
    
    (:goal (and 
                (hero-at escape-room)
            )
    ) 
)