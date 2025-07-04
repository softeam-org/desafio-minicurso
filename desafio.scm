;; Veja:
;; <https://stackoverflow.com/questions/59006417/how-to-read-a-string-to-get-user-input-in-gnu-guile>.
;; Obrigado 9716278 <https://stackoverflow.com/users/9716278/9716278>
;; e Óscar López <https://stackoverflow.com/users/201359/%c3%93scar-l%c3%b3pez>.

(define (println text)
  (display text)
  (newline))

(define (espaco-seguido-de-caractere espacos caractere)
  (string-append (make-string espacos #\space) caractere))

(define (zig inicial numero-de-linhas caractere)
  (when (not (eq? inicial numero-de-linhas))
    (println (espaco-seguido-de-caractere inicial caractere))
    (zig (+ inicial 1) numero-de-linhas caractere)))

;; Não precisa de um valor inicial, já que é possível utilizar o
;; número de linhas como base para alcançar o zero.
(define (zag numero-de-linhas caractere)
  (when (not (eq? numero-de-linhas 0))
    ;; Tem que ser menor, se não o espaçamento fica igual o do maior.
    (println (espaco-seguido-de-caractere (- numero-de-linhas 1) caractere))
    (zag (- numero-de-linhas 1) caractere)))

(define (zig-zag numero-de-linhas caractere)
  (cond ((not (integer? numero-de-linhas))
         ;; Mensagem de erro quando o input não é um número.
         (println "Valor inexperado, use um número inteiro"))
        ((eq? numero-de-linhas 0)
         ;; Linha vazia quando é zero.
         (newline))
        ((eq? numero-de-linhas 1)
         ;; Só o caractere quando é 1.
         (println caractere))
        (else
         ;; De resto, é procedimento normal.
         (zig 0 numero-de-linhas caractere)
         (zag (- numero-de-linhas 1) caractere))))

(println "Este programa gera uma sequência em zig-zag de caracteres.")
(println "Escolha o número de linhas de saída:")

(zig-zag (read) "#")
