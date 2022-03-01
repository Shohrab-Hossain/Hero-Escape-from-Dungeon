(define (domain hero-escape-from-dungeon)
    (:requirements 
        :typing 
        :negative-preconditions
    )
    (:types 
        room
    )

    (:predicates
        ;; hero's current location
        (hero-at ?r - room)

        ;; when true, hero's hand is free
        (hand-free)

        ;; when true, hero is carrying a sword in his hand
        (sword-in-hand)

        ;; this room has a sword
        (is_sword-room ?r - room)

        ;; this room has a monster
        (is_monster-room ?r - room)

        ;; this room has a trap
        (is_trap-room ?r - room)

        ;; this room is empty
        (is_empty-room ?r - room)

        ;; hero can escape from this room
        (is_escape-room ?r - room)
        
        ;; trap of this room has disarmed
        (trap-disarmed ?r - room)

        ;; connects rooms
        (connected ?r1 - room ?r2 - room) 
    )


    ; this action moves the hero to sword room if
    ;       - this room is connected with the previous room
    ;       - hero's hand is free
    ; effect : hero will pick a sword while leaving
    (:action move_to_sword-room
        :parameters (?from ?to - room)
        :precondition (and 
                            (connected ?from ?to)
                            (hero-at ?from)
                            (is_sword-room ?to) 
                            (hand-free)
                        )
        :effect (and  
                    ;; add effects
                    (hero-at ?to)
                    (sword-in-hand)

                    ;; remove effects
                    (not (hero-at ?from) )
                    (not (hand-free) )
                    (not (is_sword-room ?to) )  ;; destroys this visited room
                )
    )


    ; this action moves the hero to sword room if
    ;       - this room is connected with the previous room
    ;       - hero's hand is not free
    ; effect : hero will drop the sword that he is carrying
    (:action move_to_sword-room_to_drop
        :parameters (?from ?to - room)
        :precondition (and 
                            (connected ?from ?to)
                            (hero-at ?from)
                            (is_sword-room ?to) 
                            (not (hand-free) )
                        )
        :effect (and 
                    ;; add effects 
                    (hero-at ?to)
                    (hand-free)

                    ;; remove effects
                    (not (hero-at ?from) )
                    (not (sword-in-hand) )
                    (not (is_sword-room ?to) )  ;; destroys this visited room
                )
    )

    
    ; this action moves the hero to monster room if
    ;       - this room is connected with the previous room
    ;       - hero's hand is not free
    ; effect : hero will safely leave the room as he is carrying a sword
    (:action move_to_monster-room
        :parameters (?from ?to - room)
        :precondition (and 
                            (connected ?from ?to)
                            (hero-at ?from)
                            (is_monster-room ?to)
                            (not (hand-free) )
                        )
        :effect (and  
                    ;; add effects
                    (hero-at ?to)

                    ;; remove effects
                    (not (hero-at ?from) )
                    (not (is_monster-room ?to) )  ;; destroys this visited room
                )
    )


    ; this action moves the hero to trap room if
    ;       - this room is connected with the previous room
    ;       - hero's hand is not free
    ; effect : hero will disarm the trap and leave in empty hand
    (:action move_to_trap-room
        :parameters (?from ?to - room)
        :precondition (and 
                            (connected ?from ?to)
                            (hero-at ?from)
                            (is_trap-room ?to)
                            (hand-free)
                        )
        :effect (and
                    ;; add effects  
                    (hero-at ?to)
                    (trap-disarmed ?to)

                    ;; remove effects
                    (not (hero-at ?from) )
                    (not (is_trap-room ?to) )  ;; destroys this visited room
                )
    )


    ; this action moves the hero to empty room if
    ;       - this room is connected with the previous room
    ;       - hero's hand is free or not
    ; effect : hero will drop the sword if he is carrying any
    (:action move_to_empty-room
        :parameters (?from ?to - room)
        :precondition (and 
                            (connected ?from ?to)
                            (hero-at ?from)
                            (is_empty-room ?to) 
                        )
        :effect (and
                    ;; add effects  
                    (hero-at ?to)
                    (hand-free)

                    ;; remove effects
                    (not (hero-at ?from) )
                    (not (sword-in-hand) )
                    (not (is_empty-room ?to) )  ;; destroys this visited room
                )
    )

    
    ; this action moves the hero to empty room if
    ;       - this room is connected with the previous room
    ; effect : hero will reach escape room and leave the dungeon
    (:action move_to_escape-room
        :parameters (?from ?to - room)
        :precondition (and 
                            (connected ?from ?to)
                            (hero-at ?from)
                            (is_escape-room ?to) 
                        )
        :effect (and  
                    ;; add effects
                    (hero-at ?to)

                    ;; remove effects
                    (not (hero-at ?from) )
                )
    )        
)

