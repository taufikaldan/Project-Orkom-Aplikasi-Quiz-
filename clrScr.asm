;Rendy Prihansyah/G64154011
;Taufik Aldan M/G64154062


section .data

section .bss

section .text


clrScr:
    mov eax, 4
    mov ebx, 1
    mov ecx, clr_scr
    mov edx, len_clr_scr
    int 0x80
    ret
