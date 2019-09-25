#lang racket

(require pict
         images/icons/control images/icons/style
         images/icons/symbol
         file/convertible
         racket/runtime-path)

(define-runtime-path pwd
  ".")

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
                      #:width [width (pict-width pct)]
                      #:height [height (pict-height pct)]
                      #:color [color "white"]
                      #:draw-border? [draw-border? #t]
                      #:border-color [border-color #f]
                      #:border-width [border-width #f])
  (ct-superimpose
   (filled-rectangle width height
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
     (text "  ☎ Alyssa ➞ Ben Bitdiddle"))
    10)
   #:height 225))


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

(define incoming-call-mom
  (cc-superimpose
   (filled-rectangle 185 225 #:color "white")
   (vc-append
    (text "☎" null 25)
    (text "Mom" (cons 'bold 'default) 14)
    (blank 0 10)
    (hc-append 5
               (text-button "accept" #:width 70)
               (text-button "decline" #:width 70)))))

(define incoming-call-edge-names
  (cc-superimpose
   (filled-rectangle 185 225 #:color "white")
   (vc-append
    (text "☎" null 25)
    (text "Alyssa ➞ Jane Nym" (cons 'bold 'default) 12)
    ;; TODO: Remove this?
    (blank 0 2)
    (text "Faculty ➞ Dr. Nym" (cons 'bold 'default) 10)
    (blank 0 10)
    (hc-append 5
               (text-button "accept" #:width 70)
               (text-button "decline" #:width 70)))))

(define write-dir
  (make-parameter (build-path pwd "petnames-pictures")))

(define (write-image pict filename-base #:scale [scale-amt 1.5])
  (unless (directory-exists? (write-dir))
    (make-directory (write-dir)))

  (call-with-output-file (build-path (write-dir) (format "~a.png" filename-base))
    (lambda (op)
      (write-bytes (convert (scale pict scale-amt) 'svg-bytes) op))
    #:exists 'replace))

(define (write-images)
  (write-image incoming-call-mom
               "incoming-call-mom")
  (write-image search-interface
               "search-interface")
  (write-image incoming-call-edge-names
               "incoming-call-edge-names")
  #;(write-image save-contact
               "save-contact")

  )

(module+ main
  (write-images)
  (printf "Wrote images to ~a" (path->string (write-dir)))
  (void))
