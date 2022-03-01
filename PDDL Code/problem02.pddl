(define (problem dungeon-level-02)
    (:domain hero-escape-from-dungeon)
    (:objects 
        initial-room - room
        sword-room-01 sword-room-02 - room
        monster-room-01 monster-room-02 monster-room-03 - room
        trap-room-01 trap-room-02 trap-room-03 trap-room-04 trap-room-05 - room
        ;;empty-room-01 empty-room-02 - room
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

        ;; location of monster-room
        (is_monster-room monster-room-01)
        (is_monster-room monster-room-02)
        (is_monster-room monster-room-03)

        ;; location of trap-room
        (is_trap-room trap-room-01)
        (is_trap-room trap-room-02)
        (is_trap-room trap-room-03)
        (is_trap-room trap-room-04)
        (is_trap-room trap-room-05)
        
        ;; location of the escape room
        (is_escape-room escape-room)

        ;; graph connectivity
        (connected initial-room sword-room-01)
        (connected initial-room trap-room-03)
        (connected sword-room-01 monster-room-01)
        (connected sword-room-01 trap-room-04)
        (connected monster-room-01 monster-room-02)
        (connected monster-room-01 sword-room-02)
        (connected monster-room-02 trap-room-01)
        (connected monster-room-02 monster-room-03)
        (connected trap-room-01 trap-room-02)
        (connected trap-room-01 trap-room-05)
        (connected trap-room-02 escape-room)
        (connected trap-room-03 monster-room-01)
        (connected trap-room-03 trap-room-04)
        (connected trap-room-04 monster-room-02)
        (connected trap-room-04 sword-room-02)
        (connected sword-room-02 trap-room-01)
        (connected sword-room-02 monster-room-03)
        (connected monster-room-03 trap-room-02)
        (connected monster-room-03 trap-room-05)
        (connected trap-room-05 escape-room)

        ;; graph connectivity in reverse
        (connected sword-room-01 initial-room)
        (connected trap-room-03 initial-room)
        (connected monster-room-01 sword-room-01)
        (connected trap-room-04 sword-room-01)
        (connected monster-room-02 monster-room-01)
        (connected sword-room-02 monster-room-01)
        (connected trap-room-01 monster-room-02)
        (connected monster-room-03 monster-room-02)
        (connected trap-room-02 trap-room-01)
        (connected trap-room-05 trap-room-01)
        (connected escape-room trap-room-02)
        (connected trap-room-03 monster-room-01)
        (connected trap-room-03 trap-room-04)
        (connected trap-room-04 monster-room-02)
        (connected trap-room-04 sword-room-02)
        (connected sword-room-02 trap-room-01)
        (connected sword-room-02 monster-room-03)
        (connected monster-room-03 trap-room-02)
        (connected monster-room-03 trap-room-05)
        (connected trap-room-05 escape-room)
    )
    
    (:goal (and 
                (hero-at escape-room)
            )
    ) 
)