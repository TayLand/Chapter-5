;Taylor Landes
;Link Library Test #3

;Calculate the elapsed execution time of a nested loop

;Elapsed Time Results
;High Performance:3104 milliseconds
;Balanced:3143 milliseconds
;Power Saver:11747 milliseconds

include Irvine32.inc

.data
OUTER_LOOP_COUNT = 3
startTime DWORD ?
msg1 byte "Please wait...",0dh,0ah,0
msg2 byte "Elapsed milliseconds: ", 0

.code
main PROC
	mov edx,OFFSET msg1
	call WriteString

;Save the starting time

	call GETMSeconds
	mov startTime,eax

;Start the outer loop

	mov ecx,OUTER_LOOP_COUNT

L1: call innerLoop
	loop L1

;Calculate the elapsed time

	call GetMSeconds
	sub eax,startTime

;Display the elapsed time
	
	mov edx,OFFSET msg2
	call WriteString
	call WriteDec
	call Crlf

	exit
main ENDP

innerLoop PROC
	push ecx
	mov ecx,0FFFFFFFh
L1: mul eax
	mul eax
	mul eax
	loop L1

	pop ecx
	ret
innerLoop ENDP
END main