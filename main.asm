;Rendy Prihansyah/G64154011
;Taufik Aldan M/G64154062


; fungsi clear screen
%include    'clrScr.asm'

; fungsi print string
%include    'printString.asm'

; fungsi scan number
%include    'scanNum.asm'

; fungsi print number
%include    'printNum.asm'

; fungsi scan string
%include "scanStr.asm"

; fungsi compare string
%include "cmpStr.asm"

; fungsi copy string
%include "cpyStr.asm"

;fungsi print karakter
%include "printChar.asm"

;fungsi dari bahasa C
extern printf
extern scanf

section .data
	;pesan
	nama		db 'Nama	: ',0
	nimnote		db 'NIM	: ',0
	masuk		db 'Tekan "ENTER" untuk memulai quiz.....',0			
	OK			db 'Status: Ok!',0xa,0xa,0
	answer		db 'Jawab: ',0
	Score 		db 'Nilai quiz anda: ',0
	
	note	 db	"-------------------------------------------------------------",0xa
			 db	"||                        QUIZ ORKOM                       ||",0xa
			 db	"-------------------------------------------------------------",0xa
			 db	"Silahkan inputkan nama dan NIM anda sebelum memulai!",0xa,0xa,0xa,0xa,0
	
	;judul soal			
	welcome	 db	"-------------------------- Bagian 1 -------------------------",0xa
			 db	"||                       Pilhan Ganda                      ||",0xa
			 db	"-------------------------------------------------------------",0xa
			 db	"Silahkan pilih satu jawban yang paling tepat!",0xa,0xa,0xa,0xa,0
	welcome2 db	"-------------------------- Bagian 2--------------------------",0xa
			 db	"||                      Isian Singkat                     ||",0xa
			 db	"-------------------------------------------------------------",0xa
			 db	"Jawab dengan Singkat dan pastikan input dengan lowercase!",0xa,0xa,0xa,0xa,0

	;pertanyaan PG
	tanya1	db '1) Jika 0=1 8=2 98=3 253=0 1096=4, jika 10068=?',0xa
			db '   1. 2                         2. 3',0xa
			db '   3. 4                         4. 5',0xa,0
	tanya2	db 0xa,0xa,'2) Ada berapa jumlah sisi dari sebuah piramid?',0xa
			db '   1. 2	sisi                    2. 3 sisi',0xa
			db '   3. 4	sisi                    4. 5 sisi',0xa,0
	tanya3	db 0xa,0xa,'3) Apa nama pewasat super sonic buatan Perancis?',0xa
			db '   1. Shukoi                  2. Boeing',0xa
			db '   3. Concorde                    4. Hercules',0xa,0
	tanya4	db 0xa,0xa,'4) Berapakah fault tolerance pada RAID 5?',0xa
			db '   1. 4                         2. 3',0xa
			db '   3. 2                         4. 5',0xa,0
	tanya5	db 0xa,0xa,'5) Apa nama seri terakhir dari seri processor intel?',0xa
			db '   1. haswell                   2. skylake ',0xa
			db '   3. sandy bridge              4. ivy bridge',0xa,0
	tanya6	db 0xa,0xa,'6) Berapa bit kah processor generasi pertama?',0xa
			db '   1. 2                         2. 16',0xa
			db '   3. 4                         4. 8',0xa,0
	tanya7	db 0xa,0xa,'7) Berapa nilai desimal dari bilangan biner 11010101?',0xa
			db '   1.215                          2.223',0xa
			db '   3.233                          4.213',0xa,0
	tanya8	db 0xa,0xa,'8) Berapakah RPM terkecil untuk sebuah HDD yang umum digunakan?',0xa
			db '   1. 5400                      2. 10000',0xa
			db '   3. 7200                      4. 6400',0xa,0
	tanya9	db 0xa,0xa,'9) Apakah senyawa kimia NaCl itu ?',0xa
			db '   1. Cuka                      2. Garam',0xa
			db '   3. Gula                      4. Air Sadah',0xa,0
	tanya10	db 0xa,0xa,'10) Vitamin apakah yang dapat diproduksi oleh tubuh  manusia?',0xa
			db '   1. A                         2. D',0xa
			db '   3. B                         4. E',0xa,0
	
	;pertanyaan essay		
	tanya11	db '11) Skema yang digunakan pada RAID 1 adalah?',0xa, 0
	tanya12	db 0xa,0xa,'12) Bagian CPU yang melaukkan proses aritmatika adalah?',0xa, 0
	tanya13	db 0xa,0xa,'13) Skema yang digunakan pada RAID 0 adalah?',0xa, 0
	tanya14	db 0xa,0xa,'14) Apa nama processor intel yang menggunakan socket LGA 1150?',0xa, 0
	tanya15	db 0xa,0xa,'15) proses untuk pengambilan data oleh processor disebut dengan ..... cycle',0xa, 0	
	
	;tabel jawaban PG
	tbljwb	dd 1,1,3,3,2,3,4,1,2,2
	
	;jawaban essay	
	essay1	db 'mirroring',0
	essay2	db 'alu',0
	essay3	db 'streping',0
	essay4	db 'haswell',0
	essay5	db 'fetch',0
	
    ; untuk clear screen
    clr_scr     db      27, '[H', 27, '[2J', 0
    len_clr_scr equ     $-clr_scr

section .bss
	jawab resd 10
	jwb1  resb 255
	jwb2  resb 255
	jwb3  resb 255
	jwb4  resb 255
	jwb5  resb 255
	
	namanya resb 255
	
	nim	  resb 255
	press resb 255
	
section .txt
	global main

;________________________________login__________________________________
main:
	;cetak note
	mov eax, note				
	mov ebx, 1 
	call printStr
	
	mov eax, nama				
	mov ebx, 1 
	call printStr
	
	;scan nama dan dimasukkan ke variabel namanya
	call scanStr
	mov ebx, namanya
	call cpyStr
		
	;cetak nimnote
	mov eax, nimnote
	mov ebx, 1 
	call printStr
		
	;scan string nim dan simpan ke variabel nim
	call scanStr
	mov ebx, nim
	call cpyStr
		
	call clrScr
		
	;cetak OK
	mov eax, OK
	mov ebx, 1 
	call printStr

	;cetak masuksa
	mov eax, masuk				
	mov ebx, 1 
	call printStr
		
	call scanStr
	mov ebx, press
	call cpyStr
		
		
;__________________Print Soal dan scan Jawaban (PG)_____________________		
PG:		 
	call clrScr
	
	;cetak welcome
	mov eax, welcome
	mov ebx, 1 
	call printStr 
		
	soal1:
		;cetak pertanyaan1
		mov eax, tanya1
		mov ebx, 1 
		call printStr 

		;cetak jawab
		mov eax, answer
		mov ebx, 1 
		call printStr
		
		;scan input jawaban (number) dan simpan pada array jawab 
		call scanNum
		mov dword [jawab+0], eax

	soal2:
		mov eax, tanya2
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+4], eax
		
	soal3:
		mov eax, tanya3
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+8], eax
		
	soal4:
		mov eax, tanya4
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+12], eax

	soal5:
		mov eax, tanya5
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+16], eax
		
	soal6:
		mov eax, tanya6
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+20], eax

	soal7:
		mov eax, tanya7
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+24], eax
		
	soal8:
		mov eax, tanya8
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+28], eax
		
	soal9:
		mov eax, tanya9
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+32], eax
		
	soal10:
		mov eax, tanya10
		mov ebx, 1 
		call printStr 

		mov eax, answer
		mov ebx, 1 
		call printStr 
		call scanNum
		mov dword [jawab+36], eax
		
		
;_________________Print Soal dan scan Jawaban (ESSAY)___________________		
ESSAY:
	call clrScr
	;cetak walcome2
	mov eax, welcome2
	mov ebx, 1 
	call printStr 
	
	soal11:
		;cetak soal esay1
		mov eax, tanya11
		mov ebx, 1 
		call printStr
		
		;cetak jawab
		mov eax, answer
		mov ebx, 1 
		call printStr
		
		;scan input jawaban (string) dan simpan di variabel jwb1
		call scanStr
		mov ebx, jwb1
		call cpyStr 
		
		
	soal12:
		mov eax, tanya12
		mov ebx, 1 
		call printStr 
		
		mov eax, answer
		mov ebx, 1 
		call printStr
		call scanStr
		mov ebx, jwb2
		call cpyStr 
		
	soal13:
		mov eax, tanya13
		mov ebx, 1 
		call printStr 
		
		mov eax, answer
		mov ebx, 1 
		call printStr
		call scanStr
		mov ebx, jwb3
		call cpyStr 
				
	soal14:
		mov eax, tanya14
		mov ebx, 1 
		call printStr 
		
		mov eax, answer
		mov ebx, 1 
		call printStr
		call scanStr
		mov ebx, jwb4
		call cpyStr 
				
	soal15:
		mov eax, tanya15
		mov ebx, 1 
		call printStr 
		
		mov eax, answer
		mov ebx, 1 
		call printStr	
		call scanStr
		mov ebx, jwb5
		call cpyStr
		 	
		call clrScr


;________________________cetak pesan score______________________________	
keluaran:
	mov eax, namanya
	mov ebx, 1 
	call printStr
	
	; Cetak / (ascii = 47)
	mov al, 47
	mov ebx, 1 ;stdout
	call printChar
	
	; Cetak ( (ascii = 40)
	mov al, 40
	mov ebx, 1 ;stdout
	call printChar
	
	mov eax, nim
	mov ebx, 1 
	call printStr
	
	; Cetak ) (ascii = 41)
	mov al, 41
	mov ebx, 1 ;stdout
	call printChar
	
	; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar

	mov eax, Score
	mov ebx, 1 
	call printStr
	mov eax, 0
	mov ecx, 0		


;______________Cek jawaban PG, compare dengan array tbljwb______________	
	cek1:
		mov ebx, [tbljwb+0]
		cmp ebx, [jawab+0]
		jne cek2
		inc ecx
		
	cek2:
		mov ebx, [tbljwb+4]
		cmp ebx, [jawab+4]
		jne cek3
		inc ecx
		
	cek3:
		mov ebx, [tbljwb+8]
		cmp ebx, [jawab+8]
		jne cek4
		inc ecx
		
	cek4:
		mov ebx, [tbljwb+12]
		cmp ebx, [jawab+12]
		jne cek5
		inc ecx

	cek5:
		mov ebx, [tbljwb+16]
		cmp ebx, [jawab+16]
		jne cek6
		inc ecx
		
	cek6:
		mov ebx, [tbljwb+20]
		cmp ebx, [jawab+20]
		jne cek7
		inc ecx
		
	cek7:
		mov ebx, [tbljwb+24]
		cmp ebx, [jawab+24]
		jne cek8
		inc ecx
		
	cek8:
		mov ebx, [tbljwb+28]
		cmp ebx, [jawab+28]
		jne cek9
		inc ecx	
		
	cek9:
		mov ebx, [tbljwb+32]
		cmp ebx, [jawab+32]
		jne cek10
		inc ecx

	cek10:
		mov ebx, [tbljwb+36]
		cmp ebx, [jawab+36]
		jne cek11
		inc ecx


;__________Cek jawaban Essay, compare string jwb dengan essay___________		
	cek11:
		mov eax, jwb1
		mov ebx, essay1
		call cmpStr
		cmp eax, 1
		jne cek12
		add ecx, 2
		
	cek12:
		mov eax, jwb2
		mov ebx, essay2
		call cmpStr
		cmp eax, 1
		jne cek13
		add ecx, 2

	cek13:
		mov eax, jwb3
		mov ebx, essay3
		call cmpStr
		cmp eax, 1
		jne cek14
		add ecx, 2

	cek14:
		mov eax, jwb4
		mov ebx, essay4
		call cmpStr
		cmp eax, 1
		jne cek15
		add ecx, 2
		
	cek15:
		mov eax, jwb5
		mov ebx, essay5
		call cmpStr
		cmp eax, 1
		jne normalisasi
		add ecx, 2

;____________________Menghitung dan mencetak nilai_____________________		
normalisasi:
	mov eax, ecx
	mov ecx, 0
		
	loop:
		;looping untuk menghitung poin
		cmp eax,ecx
		je hasil
		inc ecx
		jmp loop
			
	hasil:
		;kali poin dengan 5 karena pg bernilai 1poin dan essay bernilai 2poin (total 20poin)
		mov ebx, 5
		mov eax, ecx
		mul ebx
		mov ebx, 1 
		call printNum
		
		;nih kodingan yang kurang buat floating point

		jmp exit
		
	exit:
		mov eax, 1
		mov ebx, 0
		int 0x80
