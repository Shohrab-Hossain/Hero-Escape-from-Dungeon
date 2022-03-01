(define (problem dungeon-level-01)
    (:domain hero-escape-from-dungeon)
    (:objects 
        initial-room - room
        sword-room-01 - room
        monster-room-01 monster-room-02 - room
        trap-room-01 - room
        empty-room-01 empty-room-02 - room
        escape-room - room
    )
    (:init 
        ;; hero's initial location
        (hero-at initial-room)

        ;; hero starts with a free hand
        (hand-free)

        ;; location of sword-room
        (is_sword-room sword-room-01)

        ;; location of monster-room
        (is_monster-room monster-room-01)
        (is_monster-room monster-room-02)

        ;; location of trap-room
        (is_trap-room trap-room-01)

        ;; location of empty-room
        (is_empty-room empty-room-01)
        (is_empty-room empty-room-02)

        ;; location of the escape room
        (is_escape-room escape-room)

        ;; graph connectivity
        (connected initial-room sword-room-01)
        (connected initial-room monster-room-02)
        (connected sword-room-01 monster-room-01)
        (connected sword-room-01 monster-room-02)
        (connected monster-room-02 empty-room-01)
        (connected monster-room-01 trap-room-01)
        (connected monster-room-01 empty-room-01)
        (connected empty-room-01 empty-room-02)
        (connected trap-room-01 empty-room-02)
        (connected trap-room-01 escape-room)

        ;; graph connectivity in reverse
        (connected sword-room-01 initial-room)
        (connected monster-room-02 initial-room)
        (connected monster-room-01 sword-room-01)
        (connected monster-room-02 sword-room-01)
        (connected empty-room-01 monster-room-02)
        (connected trap-room-01 monster-room-01)
        (connected empty-room-01 monster-room-01)
        (connected empty-room-02 empty-room-01)
        (connected empty-room-02 trap-room-01)
        (connected escape-room trap-room-01)
    )

    (:goal (and 
                (hero-at escape-room)
            )
    ) 
)