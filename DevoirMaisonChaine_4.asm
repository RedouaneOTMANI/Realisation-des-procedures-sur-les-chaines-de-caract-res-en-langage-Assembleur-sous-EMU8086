name "REDDIR"

org 100h
  
  ;set video mode :
   mov al,03h
	mov ah,0
	int 10h
	
  ;; show box-shaped blinking text cursor: 
	    mov ch, 0
     	mov cl, 7
     	mov ah, 1
     	int 10h     
    
 
	 	
	
	
 mov dx, offset msg_debut
 mov ah, 09h
 int 21h
 
 mov dx, offset msg_tri
 int 21h
 
 mov dx, offset msg_espace
 int 21h
             
             
;;;;;;;;;Construction du Menu;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
menu: 

 mov ah, 09h
 
 mov dx, offset msg_menu_00
 int 21h
 
 mov dx, offset msg_menu_0
 int 21h
 
 mov dx, offset msg_menu_1
 int 21h
 
 mov dx, offset msg_menu_2
 int 21h
 
 mov dx, offset msg_menu_3
 int 21h
 
 mov dx, offset msg_menu_fonct_1
 int 21h 
        
 mov dx, offset msg_menu_fonct_2
 int 21h
 
 mov dx, offset msg_menu_fonct_3
 int 21h   
 
 mov dx, offset msg_quitter
 int 21h 
 
 mov dx, offset msg_choix
 int 21h   
 
 ;on recupere le choix
 mov ah, 01h
 int 21h
 
 ;stockage du choix
 ;le choix est stocke dans al
 ;traitement du choix        
 mov bl, al
 sub bl, 30h
 sub bl, 6
 jz choix6
  
 mov bl, al
 sub bl, 30h
 sub bl, 5
 jz choix5
 
 mov bl, al
 sub bl, 30h
 sub bl, 5
 jz choix5
 
 
 mov bl, al
 sub bl, 30h
 sub bl, 4
 jz choix4
 
 mov bl, al
 sub bl, 30h
 sub bl, 3
 jz choix3
 
 mov bl, al
 sub bl, 30h
 sub bl, 2
 jz choix2
 
 mov bl, al
 sub bl, 30h
 sub bl, 1
 jz choix1 
 
 mov bl, al
 sub bl, 30h
 sub bl, 0
 jz choix0
 
 
choix0:
 mov dx, offset msg_quitter_
 mov ah, 09h
 int 21h 
 
 jmp fin 
 
choix1:
pusha
call insertionChaine

mov cx,300
pause1:   
loop pause1


popa

jmp menu


choix2:  
pusha
call  suppressionChaine

mov cx,300
pause2:   
loop pause2

popa
jmp menu


choix3:
pusha
call remplaceChaine

mov cx,1000
pause3:
   
loop pause3

popa
jmp menu 


choix4: 
pusha
mov dx, offset msg_menu_fonctionnement_1
mov ah, 09h
int 21h

mov cx,1000
pause4:   
loop pause4

popa
jmp menu

choix5: 
pusha
mov dx, offset msg_menu_fonctionnement_2
mov ah, 09h
int 21h

mov cx,1000
pause5:   
loop pause5

popa
jmp menu


choix6:
pusha
mov dx, offset msg_menu_fonctionnement_3 
mov ah, 09h
int 21h   

mov cx,1000
pause6:   
loop pause6
popa
jmp menu
 
     
 
 
 


;;;;;;;;;;;;;;;;;;;;procedure insertion chaine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  insertionChaine proc
    
   mov dx, offset msg_0
   mov ah, 09h
   int 21h  
 ;on recupere les 2 chaines de caractere :
 ;la 1ere chaine : 
 
  mov cx,50
 pause0_0:
   loop pause0_0
   
 mov dx, offset msg_1
 int 21h   

 
   ;stockage du 1ere chaine
   
     mov bx,offset si1 
  back:  mov ah,01h             
             int 21h
             mov [bx],al            
             inc bx 
             cmp al,13               
             jnz back 
  
          
 ;la 2eme chaine 
 
 mov dx, offset msg_2
 mov ah, 09h
 int 21h
 
 ;stockage du 2eme chaine:
   mov di,offset si2
 back1:  mov ah,01h
           int 21h
           
           mov [di],al 
           inc di
           cmp al,13
           jnz back1 
 
 
             
             
             
 ;on recupere k
 
 mov dx, offset msg_pos_k
 mov ah, 09h
 int 21h
 
 mov ah, 01h
 int 21h
 
 ;stockage du k
 sub al,30h
 mov ki,al
 
 
 ;on recupere i
 mov dx, offset msg_pos_i
 mov ah,09h
 int 21h
 
 mov ah, 01h
 int 21h
 
 ;stockage du i
 sub al,30h
 mov ii,al
     
 
 mov dx,offset msg_nouv
 mov ah,09h
 int 21h
   
     
  ;on affiche s1_1
mov si,offset si1
xor cx,cx
mov cl,ki 
mov ah,02h

bouclei1:
mov dl,[si] 
int 21h     
inc si
loop bouclei1
  
  
 
     

;on affiche s2_2

xor ax,ax
mov al,ii
mov si,ax
add si,offset si2 


mov ah,02h
bouclei2:
mov dl,[si]
int 21h
inc si

cmp [si],'a'
je bouclei2

cmp [si],'b'
je bouclei2
cmp [si],'c'
je bouclei2
cmp [si],'d'
je bouclei2
cmp [si],'e'
je bouclei2
cmp [si],'f'
je bouclei2
cmp [si],'g'
je bouclei2
cmp [si],'h'
je bouclei2
cmp [si],'i'
je bouclei2
cmp [si],'j'
je bouclei2
cmp [si],'k'
je bouclei2 
cmp [si],'l'
je bouclei2
cmp [si],'m'
je bouclei2
cmp [si],'n'
je bouclei2
cmp [si],'o'
je bouclei2
cmp [si],'p'
je bouclei2
cmp [si],'q'
je bouclei2
cmp [si],'r'
je bouclei2
cmp [si],'s'
je bouclei2
cmp [si],'t'
je bouclei2 
cmp [si],'u'
je bouclei2
cmp [si],'v'
je bouclei2
cmp [si],'w'
je bouclei2
cmp [si],'x'
je bouclei2
cmp [si],'y'
je bouclei2
cmp [si],'z'
je bouclei2

cmp [si],'A'
je bouclei2
         
cmp [si],'B'
je bouclei2
cmp [si],'C'
je bouclei2
cmp [si],'D'
je bouclei2
cmp [si],'E'
je bouclei2
cmp [si],'F'
je bouclei2
cmp [si],'G'
je bouclei2
cmp [si],'H'
je bouclei2
cmp [si],'I'
je bouclei2
cmp [si],'J'
je bouclei2
cmp [si],'K'
je bouclei2 
cmp [si],'L'
je bouclei2
cmp [si],'M'
je bouclei2
cmp [si],'N'
je bouclei2
cmp [si],'O'
je bouclei2
cmp [si],'P'
je bouclei2
cmp [si],'Q'
je bouclei2
cmp [si],'R'
je bouclei2
cmp [si],'S'
je bouclei2
cmp [si],'T'
je bouclei2 
cmp [si],'U'
je bouclei2
cmp [si],'V'
je bouclei2
cmp [si],'W'
je bouclei2
cmp [si],'X'
je bouclei2
cmp [si],'Y'
je bouclei2
cmp [si],'Z'
je bouclei2   
     
;;on affiche s1_2
mov si,offset si1
xor ax,ax
mov al,ki
add si,ax


mov ah,02h


bouclei3:
mov dl,[si]
int 21h
inc si
cmp [si],'a'
je bouclei3

cmp [si],'b'
je bouclei3
cmp [si],'c'
je bouclei3
cmp [si],'d'
je bouclei3
cmp [si],'e'
je bouclei3
cmp [si],'f'
je bouclei3
cmp [si],'g'
je bouclei3
cmp [si],'h'
je bouclei3
cmp [si],'i'
je bouclei3
cmp [si],'j'
je bouclei3
cmp [si],'k'
je bouclei3 
cmp [si],'l'
je bouclei3
cmp [si],'m'
je bouclei3
cmp [si],'n'
je bouclei3
cmp [si],'o'
je bouclei3
cmp [si],'p'
je bouclei3
cmp [si],'q'
je bouclei3
cmp [si],'r'
je bouclei3
cmp [si],'s'
je bouclei3
cmp [si],'t'
je bouclei3 
cmp [si],'u'
je bouclei3
cmp [si],'v'
je bouclei3
cmp [si],'w'
je bouclei3
cmp [si],'x'
je bouclei3
cmp [si],'y'
je bouclei3
cmp [si],'z'
je bouclei3


cmp [si],'A'
je bouclei3

cmp [si],'B'
je bouclei3
cmp [si],'C'
je bouclei3
cmp [si],'D'
je bouclei3
cmp [si],'E'
je bouclei3
cmp [si],'F'
je bouclei3
cmp [si],'E'
je bouclei3
cmp [si],'H'
je bouclei3
cmp [si],'I'
je bouclei3
cmp [si],'J'
je bouclei3
cmp [si],'K'
je bouclei3 
cmp [si],'L'
je bouclei3
cmp [si],'M'
je bouclei3
cmp [si],'N'
je bouclei3
cmp [si],'O'
je bouclei3
cmp [si],'P'
je bouclei3
cmp [si],'Q'
je bouclei3
cmp [si],'R'
je bouclei3
cmp [si],'S'
je bouclei3
cmp [si],'T'
je bouclei3 
cmp [si],'U'
je bouclei3
cmp [si],'V'
je bouclei3
cmp [si],'W'
je bouclei3
cmp [si],'X'
je bouclei3
cmp [si],'Y'
je bouclei3
cmp [si],'Z'
je bouclei3            
             
   
   
    ret
    
msg_nouv   db 10,13,"la nouvelle chaine de caractere apres l'insertion :",10,13,"$"    
    
ki    db ?
ii    db ?

si1 db 80 dup('$')
si2 db 80 dup('$') 
    
    
    
  insertionChaine endp


 
;;;;;;;;;;;;;;;;;procedure suppression chaine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
suppressionChaine proc

mov dx, offset msg_chaine_sup_0 
mov ah,09h
int 21h
;on recupere la chaine:
mov dx, offset msg_chaine_sup
mov ah, 09h
int 21h
mov dx,offset ss1
mov ah, 0ah
int 21h

xor bx,bx
mov bl,ss1[1]
mov longss1,bl

;on recupere la position : k
mov dx, offset msg_chaine_sup_pos_k
mov ah, 09h
int 21h

mov ah, 01h
int 21h

;stockage du k
sub al,30h
mov ks,al

;on recupere combien de caractere a supprimer : i
mov dx, offset msg_chaine_sup_pos_i
mov ah, 09h
int 21h

mov ah, 01h
int 21h

;stockage du i

sub al,30h
mov is,al


  ;on affiche la nouvelle chaine 
mov dx,offset  nvChaineSup
mov ah,09h
int 21h


xor cx,cx
mov cl,ks
mov ah,02h
mov si,2

boucles1:
mov dl,ss1[si]
int 21h
inc si

loop boucles1

xor bx,bx
mov bl,is
add si,bx
mov cl,longss1
sub cl,ks
sub cl,is
mov ah,02h
boucles2:
 mov dl,ss1[si] 
 int 21h
inc si
loop boucles2   
 
 ret   

nvChaineSup db 10,13,"la nouvelle chaine apres suppression :::",10,13,"$"
ks      db ? 
is      db ?
longss1 db ?
ss1 db 20,?   
    
    
suppressionChaine endp      




;;;;;;;;;;;;;;;;;;;;;procedure remplace chaine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
remplaceChaine proc
  
mov dx, offset msg_chaine_remp_0
mov ah, 09h
int 21h  
    
    ret
remplaceChaine endp 



;;;;;;;;;;;;;;;;;;;;;procedure recherche chaine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rechercheChaine proc
    
    
    ret
rechercheChaine endp 



fin:
mov ah, 4ch
int 21h

ret  
msg_menu_00      db 10,13,"-------MENU PRINCIPAL-----------------",10,13,"$"
msg_menu_0       db 10,13,"Veuillez choisir ,SVP :) :) :::::::::",10,13,"$" 
msg_menu_1       db 10,13,"1 -Insertion d'une chaine de caracatere",10,13,"$"
msg_menu_2       db 10,13,"2 -Suppression d'une chaine de caractere",10,13,"$"
msg_menu_3       db 10,13,"3 -Remplacer une chaine de caractere",10,13,"$"
msg_menu_fonct_1 db 10,13,"4 -explication du fonctionement de la 1ere procedure",10,13,"$"
msg_menu_fonct_2 db 10,13,"5 -explication du fonctionement de la 2ere procedure",10,13,"$"
msg_menu_fonct_3 db 10,13,"6 -explication du fonctionement de la 3ere procedure",10,13,"$"

msg_quitter      db 10,13,"*si vous voulez quitter click sur 0 :",10,13,"$"
msg_quitter_     db 10,13,"Au revoir :(",10,13,"$"
msg_choix        db 10,13,"Votre Choix SVP !!",10,13,"$"

msg_menu_fonctionnement_1 db 10,13,"la procedure insertion chaine::: prend comme parametre d'entree 2 chaines de caratere S1 et S2 et 2 position i et k ,cette procedure insere en position k de S1 les caracteres de S2 commencant par i",10,13,"$" 
msg_menu_fonctionnement_2 db 10,13,"la procedure suppression chaine::: prend en parametre une chaine de car S et 2 valeurs k et i ,elle supprime i caractere de S a partir de la position k",10,13,"$"
msg_menu_fonctionnement_3 db 10,13,"la procedure remplace chaine :::prend en parametre 3 chaines de car M,S1 et S2,elle remplace dans la chaine M toutes les occurences de la chaine S1 par la chaine S2 tq S1 et S2 ont la meme taille",10,13,"$"

msg_debut  db "les procedures sur les chaines de caracteres :",10,13,"$"
msg_tri    db "--------------------------------------------",10,13,"$"
msg_espace db 10,13,"$"

;les messages a afficher de la procedure insertionChaine 
msg_0      db 10,13,"La procedure insertion ::::::",10,13,"$" 
msg_1      db 10,13,"veuillez donner la premiere chaine de caractere S1",10,13,"$"
msg_2      db 10,13,"veuillez donner la deuxieme chaine de caractere S2",10,13,"$"
msg_pos_k  db 10,13,"donner la position k de S1 ou on insere les caractere du S2",10,13,"$"
msg_pos_i  db 10,13,"donner la position i de S2 ou on doit commencer ",10,13,"$"


;les messages a afficher de la procedure suppressionChaine  
msg_chaine_sup_0     db 10,13,"La procedure supprression :::::::",10,13,"$" 
msg_chaine_sup       db 10,13,"veuillez donner la chaine pour supprimer qlqs caracteres",10,13,"$" 
msg_chaine_sup_pos_k db 10,13,"donner la position k ou on doit commencer la suppression",10,13,"$"
msg_chaine_sup_pos_i db 10,13,"donner combien de caractere voulez vous supprimer",10,13,"$"  

;les messages a afficher de la procedure remplaceChaine  
msg_chaine_remp_0 db 10,13,"La procedure remplaceChaine:::::::::",10,13,"$"
msg_chaine_remp_1 db 10,13,"donner une chaine M",10,13,"$"
msg_chaine_remp_2 db 10,13,"donner une autre chaine S1",10,13,"$"
msg_chaine_remp_3 db 10,13,"donner une autre chaine S2",10,13,"$"   

SautLigne db  "",10,13,"$"       
