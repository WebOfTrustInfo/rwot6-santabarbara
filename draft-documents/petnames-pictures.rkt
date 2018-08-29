#lang racket

(require pict
         images/icons/control images/icons/style
         images/icons/symbol
         file/convertible)

(define phone-icon (text-icon "☎"))
(define phone-text (text "☎" null 20))


(define a-button
  (let* ([p (text "Hello friends"
                  "Cantarell" 14)]
         [box
          (bitmap
           (bitmap-render-icon
            (pict->bitmap
             (filled-rounded-rectangle
              (+ (pict-width p) 16)
              (+ (pict-height p) 16)
              #:color "white"))))])
    (cc-superimpose box p)))

;; Search: [Megan                 ]  <- use search icon from Racket
;; --------------------------------
;; Local contacts:
;;  o Megan Smith
;;  o Megan Dansand
;;
;; Network contacts:
;;  o work => Megan Smith 
;;  o corpdir => Megan Stanford LLC

(define (filled-frame pct
                      #:color [color "white"]
                      #:draw-border? [draw-border? #t]
                      #:border-color [border-color #f]
                      #:border-width [border-width #f])
  (cc-superimpose
   (filled-rectangle (pict-width pct)
                     (pict-height pct)
                     #:color color
                     #:draw-border? draw-border?
                     #:border-width border-width
                     #:border-color border-color)
   pct))

(define search-interface
  (filled-frame
   (inset
    (vl-append
     10
     
     (hc-append 10
                (text "Search: " (cons 'bold 'default))
                (let ([name-text
                       (inset
                        (text "ben")
                        5)])
                  (lc-superimpose
                   (filled-rounded-rectangle
                    100 (pict-height name-text)
                    5
                    #:color "white")
                   name-text)))
     (blank 0 10)
     (text "Personal contacts:" (cons 'bold 'default))
     (text "  ☎ Ben Shapiro")
     (text "  ☎ Benjamin Gonwick")
     
     (blank 0 5)
     (text "Network contacts:" (cons 'bold 'default))
     (text "  ☎ Alyssa ⇒ Ben Bitdiddle"))
    10)))


(define (text-button str #:width [width #f])
  (let* ([name-text
          (inset (text str) 15 5)]
         [width (or width (pict-width name-text))]
         [height (pict-height name-text)])
    (cc-superimpose
     (inset
      (filled-rounded-rectangle width height 5
                                #:color "gray"
                                #:draw-border? #f)
      2 3 0 0)
     (filled-rounded-rectangle width height 5
                               #:color "white")
     name-text)))

(define incoming-call
  (cc-superimpose
   (filled-rectangle 185 250 #:color "white")
   (vc-append
    (text "☎" null 25)
    (text "Alyssa ➞ Jane Nym" (cons 'bold 'default))
    (blank 0 10)
    (hc-append 5
               (text-button "accept" #:width 70)
               (text-button "decline" #:width 70)))))

#;(call-with-output-file "/tmp/search-interface-medium.svg"
    (lambda (p)
      (write-bytes (convert (scale search-interface 1.5) 'svg-bytes) p)))
