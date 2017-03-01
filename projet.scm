#lang racket

(require scheme/class)
(require scheme/gui/base)

(define frame (new frame% [label "System solar map"][width 800][height 600]))

;(send frame maximize #t)
(define height (send frame get-height))
(define width (send frame get-width))

(define no-pen (new pen% [color "red"][width 2]))
(define white-brush (new brush% [color "white"]))

(define canvas (new canvas% [parent frame]
                    [paint-callback
                     (lambda (canvas dc)
                       (send dc set-pen no-pen)
                       (send dc set-brush white-brush)
                       (send dc draw-ellipse (/ (- width (/ width 3)) 2) (/ (- height (/ width 3)) 2) (/ width 3) (/ width 3)))]))
(send canvas set-canvas-background(make-object color% 0 0 0))

; récuper taille width et height
(send frame show #t)

