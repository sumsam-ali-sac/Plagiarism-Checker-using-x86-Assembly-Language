INCLUDE Irvine32.inc
.data

projectname byte "     -------> PLAGIRISM CHECKER <-------",0
name1 byte "   mov [20k-1075],SUMSAM ALI",0
name2 byte "  mov [20k-0409],MUKAND KIRISHNA",0
name3 byte " mov [20k-1081],BAHADUR KHAN",0
startmsg byte " Enter Any Key To continue : ",0

PRM1 BYTE "=================INSTRUCTIONS==================",0
PRM2 BYTE "PRESS 'YES' IF YOU WANT TO CHECK TEXT FILES OR PRESS 'NO' IF YOU WANT TO CHECK CPP FILES ",0
PRM3 BYTE "PRESS YOUR CHOICE",0
PRM4 BYTE "EXTENSION CHOICE",0


file1 byte "Input1.txt",0
file2 byte "Input2.txt",0
file3 byte "Input3.txt",0
file1cpp byte "Input1.cpp",0
file2cpp byte "Input2.cpp",0
file3cpp byte "Input3.cpp",0

filehandle1 Dword ?
filehandle3 dword ?
filehandle2 Dword ?

msg1 byte "---------------------------------------- File 1-----------------------------------------------",0
msg2 byte "---------------------------------------- File 2-----------------------------------------------",0
msg3 byte "---------------------------------------- File 3-----------------------------------------------",0
msg33 byte "How many words you want to search:",0
percentagemsg byte"---------------------------------------- Palgarism Percentage in Files-----------------------------------------------",0
plag byte "Plagarism Found From File 1 and File 2 is: ",0
plag1 byte "Plagarism Found File 1 and File 3 is: ",0


LENGTH_OF_QUADRUPLET dword 0
Quadruplet byte 50 dup(?)

LENGTH_OF_FILE_1 dword 0
LENGTH_OF_FILE_2 dword 0 
LENGTH_OF_FILE_3 dword 0 
DATA_IN_FILE_1 byte 10000 Dup(?)
DATA_IN_FILE_2 byte 10000 Dup(?)
DATA_IN_FILE_3 byte 10000 Dup(?)
No_of_Words dword 0


MATCHED_SUCCESFULLY_IN_2 dword 0
MATCHED_SUCCESFULLY_IN_1 dword 0

sum_of_the_find_Quadruplets_in_1_AND_2 dword 0
sum_of_the_find_Quadruplets_in_1_AND_3 dword 0

temp byte 50 dup(?)
plag_percent byte "%",0 
spaces dword 0
count dword 0
col byte ?
row byte ?

.code
main PROC

	mov  eax,black+(yellow*16)
    call SetTextColor

	call Start;start inro
	call clrscr
	MOV EDX, OFFSET PRM2
	MOV EBX, OFFSET PRM1
	CALL MSGBOX
	MOV EBX, OFFSET PRM3
	MOV EDX, OFFSET PRM4
	CALL MsgBoxAsk
	CMP EAX,7;NO PRESSED
	mov edx,0
	je CPPCHECK
	jmp TXTCHECK
	CPPCHECK:
	call Input_from_File_One_CPP;reads from file one cpp
		call crlf
		call crlf
	call Input_from_File_TWO_CPP;reads form file two cpp
		call crlf
		call crlf
	call Input_from_File_THREE_CPP;reads form file three cpp
	jmp COMPARE
	
	TXTCHECK:
		call Input_from_File_One;reads from file one
		call crlf
		call crlf
	call Input_from_File_TWO;reads form file two
		call crlf
		call crlf
	call Input_from_File_THREE;reads form file three
	
	COMPARE:
	call readchar
	call clrscr
	mov edx,offset percentagemsg
	call writestring
	call Find_the_no_of_Words_in_File_One;calculates numbver of words in file one inorder to form Quadruplets 
	call Find_the_Quadruplets_in_File_One

exit
main ENDP


Start PROC

	mov dh,10
	mov dl,18
	call gotoxy
	mov edx,offset projectname

	call writestring
	mov dh,13
	mov dl,22
	call gotoxy
	mov edx,offset name1

	call writestring
	mov dh,14
	mov dl,23
	call gotoxy
	mov edx,offset name2

	call writestring
	mov dh,15
	mov dl,24
	call gotoxy
	mov edx,offset name3

	call writestring
	mov dh,0
	mov dl,0
	call gotoxy

	mov edx,0
	mov eax,0
	mov row,75
	mov col,25
	mov al,'*'
	movzx ecx,row

	L1:
		call WriteChar
	LOOP L1

	mov dh,0
	mov dl,0
	movzx ecx,col

	L2:
		call gotoxy
		call WriteChar
		inc dh
	LOOP L2

	mov dh,0
	mov dl,75
	movzx ecx,col

	L3:
		call gotoxy
		call WriteChar
		inc dh
	LOOP L3

	mov dh,25
	mov dl,0
	add row,1
	movzx ecx,row

	L4:
		call gotoxy
		call WriteChar
		inc dl
	LOOP L4

	mov dh,16
	mov dl,24
	call gotoxy
	mov edx,offset startmsg
	call writestring
	call readchar

ret
start ENDP

Input_from_File_One PROC
	enter 0,0
	mov edx,offset msg1
	call writestring
	call crlf
	mov edx,offset file1
	 call openinputfile
	 mov filehandle1,eax
	 mov eax,filehandle1
	 mov edx,offset DATA_IN_FILE_1
	 mov ecx,sizeof DATA_IN_FILE_1
	 call readfromfile
	 mov edx,offset DATA_IN_FILE_1
	 call writestring
	 mov LENGTH_OF_FILE_1,eax
	 mov DATA_IN_FILE_1[eax],' ' ; so that if last word can be recognized
	 call crlf
	 leave
	 ret
Input_from_File_one ENDP

Input_from_File_TWO PROC
	 enter 0,0
	 mov edx,offset msg2
	 call writestring
	 call crlf
	 mov edx,offset file2
	 call openinputfile
	 mov filehandle2,eax
	 mov eax,filehandle2
	 mov edx,offset DATA_IN_FILE_2
	 mov ecx,sizeof DATA_IN_FILE_2
	 call readfromfile
	 mov edx,offset DATA_IN_FILE_2
	 call writestring
	 mov LENGTH_OF_FILE_2,eax
	 mov DATA_IN_FILE_2[eax],' '
	 call crlf
	 leave
	 ret
Input_from_File_TWO ENDP

Input_from_File_THREE PROC
enter 0,0
mov edx,offset msg3
	call writestring
	call crlf
	mov edx,offset file3
	 call openinputfile
	 mov filehandle3,eax
	 mov eax,filehandle3
	 mov edx,offset DATA_IN_FILE_3
	 mov ecx,sizeof DATA_IN_FILE_3
	 call readfromfile
	 mov edx,offset DATA_IN_FILE_3
	 call writestring
	 mov LENGTH_OF_FILE_3,eax
	 mov DATA_IN_FILE_3[eax],' '
	 call crlf
	 leave
	 ret
Input_from_File_THREE ENDP



Input_from_File_One_CPP PROC
	enter 0,0
	mov edx,offset msg1
	call writestring
	call crlf
	mov edx,offset file1cpp
	 call openinputfile
	 mov filehandle1,eax
	 mov eax,filehandle1
	 mov edx,offset DATA_IN_FILE_1
	 mov ecx,sizeof DATA_IN_FILE_1
	 call readfromfile
	 mov edx,offset DATA_IN_FILE_1
	 call writestring
	 mov LENGTH_OF_FILE_1,eax
	 mov DATA_IN_FILE_1[eax],' ' ; so that if last word can be recognized
	 call crlf
	 leave
	 ret
Input_from_File_One_CPP ENDP

Input_from_File_TWO_CPP PROC
	 enter 0,0
	 mov edx,offset msg2
	 call writestring
	 call crlf
	 mov edx,offset file2cpp
	 call openinputfile
	 mov filehandle2,eax
	 mov eax,filehandle2
	 mov edx,offset DATA_IN_FILE_2
	 mov ecx,sizeof DATA_IN_FILE_2
	 call readfromfile
	 mov edx,offset DATA_IN_FILE_2
	 call writestring
	 mov LENGTH_OF_FILE_2,eax
	 mov DATA_IN_FILE_2[eax],' '
	 call crlf
	 leave
	 ret
Input_from_File_TWO_CPP ENDP

Input_from_File_THREE_CPP PROC
enter 0,0
mov edx,offset msg3
	call writestring
	call crlf
	mov edx,offset file3cpp
	 call openinputfile
	 mov filehandle3,eax
	 mov eax,filehandle3
	 mov edx,offset DATA_IN_FILE_3
	 mov ecx,sizeof DATA_IN_FILE_3
	 call readfromfile
	 mov edx,offset DATA_IN_FILE_3
	 call writestring
	 mov LENGTH_OF_FILE_3,eax
	 mov DATA_IN_FILE_3[eax],' '
	 call crlf
	 leave
	 ret
Input_from_File_THREE_CPP ENDP


;============================FINDS NUMBER OF WORDS===============================

Find_the_no_of_Words_in_File_One PROC

enter 0,0;enter

mov esi,offset DATA_IN_FILE_1;address of data in file
mov ecx,LENGTH_OF_FILE_1;length of data

OUTERLOOP:
	mov bl,[esi]
	cmp bl,' '
	je INCREMENT_WORD
	jmp CONTINUE
INCREMENT_WORD:
	add No_of_Words,1
	jmp CONTINUE
CONTINUE:
	add esi,1
	loop OUTERLOOP
RETURN:
sub No_of_Words,1
leave
ret

Find_the_No_of_Words_in_File_One ENDP


;=============================================================================




;====================================FINDS Quadruplets  AND COMPARES=========================================

Find_the_Quadruplets_in_File_One PROC

enter 0,0
mov esi,offset DATA_IN_FILE_1;file data
mov edi,offset Quadruplet;Quadruplet
mov ecx,No_of_Words;no of words

OUTERLOOP:
	mov spaces, 0;initialize spaces with 0
	mov LENGTH_OF_QUADRUPLET, 0;initialize characters with 0

	WHILE_Quadruplet_NOT_FOUND:

		mov al, [esi]
		cmp al, ' ';if sapce found checkm if Quadruplet found i.e. 3 spaces

		je INC_SPACES
			add LENGTH_OF_QUADRUPLET, 1
			mov [edi], al;else stores in Quadruplet string
			jmp NEXT_ITERATION

		INC_SPACES:
			add spaces, 1
			cmp spaces, 1
			je NEXT_LOCATION
			cmp spaces, 4;if spaces not 1 check if 4 to complete Quadruplet
			je Quadruplet_COMPLETE
			add LENGTH_OF_QUADRUPLET, 1
			mov [edi], al
			jmp NEXT_ITERATION

		NEXT_LOCATION:
			mov [edi], al
			add LENGTH_OF_QUADRUPLET, 1
			mov ebx, esi
			add ebx, 1
			jmp NEXT_ITERATION

		Quadruplet_COMPLETE:
			jmp end_while

		NEXT_ITERATION:
			add esi, 1
			add edi, 1
			jmp WHILE_Quadruplet_NOT_FOUND
		
		end_while:
			jmp  COMPARE_Quadruplet_WITH_FILE_NO_2_AND_3
		INNERLOOP:
			loop OUTERLOOP
			jecxz PRINT_PERCENTAGE;if all words scanned i.e.ecx=0
		COMPARE_Quadruplet_WITH_FILE_NO_2_AND_3:
			pushad
			call Comparision_of_File_One_Quadruplets_With_File_Two
			popad
			pushad
			call Comparision_of_File_One_Quadruplets_With_File_Three
			popad

			
			CLEAR_Quadruplet:
			PUSH ECX
			mov ecx,50
			CLD
			mov esi,offset temp
			mov edi,offset Quadruplet
			rep movsb
			mov edi,offset Quadruplet
			mov esi,ebx
			POP ECX

		jmp INNERLOOP
PRINT_PERCENTAGE:
	 call crlf
	 mov edx,offset plag
	 call writestring
		
		CALCULATE_FOR_1_AND_2:
		 mov eax,sum_of_the_find_Quadruplets_in_1_AND_2
		 mov ecx,100
		 mul ecx
		 mov edx,0
		 mov ebx,No_of_Words
		 div ebx

	 call writedec ;eax=percentage
	 mov edx,offset plag_percent
	 call writestring

 call crlf
 call crlf
 mov edx,0
 mov ebx,0
 mov edx,offset plag1
 call writestring

	CALCULATE_FOR_1_AND_3:
		 mov edx,0
		 mov eax,sum_of_the_find_Quadruplets_in_1_AND_3
		 mov ecx,100
		 mul ecx
		 mov edx,0
		 mov ebx,No_of_Words
		 div ebx

 call writedec
 mov edx,offset plag_percent
 call writestring
 call crlf

 leave
 ret
Find_the_Quadruplets_in_File_One ENDP

Comparision_of_File_One_Quadruplets_With_File_Two PROC
	enter 0,0
	mov MATCHED_SUCCESFULLY_IN_1,0
	mov count,0
	mov esi,0
	mov edi,0
	mov ecx,LENGTH_OF_FILE_2
	mov edx,LENGTH_OF_QUADRUPLET ;length of QUADRUPLETE 

	OUTERLOOP:
		mov al,DATA_IN_FILE_2[esi]
		mov bl,Quadruplet[edi]
		cmp al,bl
		je CHARACTER_MATCHED
		jne RESET_COUNT

	CHARACTER_MATCHED:
		add count,1
		cmp count,edx
		je CHECK_IF_NEXT_SPACE
	jmp NEXT_ITERATION

	RESET_COUNT:
		mov edi,-1
		mov count,0
		
		MOVE_TO_NEXT_WORD:
		cmp esi,LENGTH_OF_FILE_2
		jae RETURN
		add esi,1
		cmp DATA_IN_FILE_2[esi],' '
		je NEXT_ITERATION
		jmp MOVE_TO_NEXT_WORD

	NEXT_ITERATION:
		inc esi
		inc edi
		loop OUTERLOOP
	
	
	CHECK_IF_NEXT_SPACE:
		add esi,1
		cmp DATA_IN_FILE_2[esi],' '
		je QUADRUPLET_MATCHED

	QUADRUPLET_MATCHED:
		mov MATCHED_SUCCESFULLY_IN_1,1;found succesfully
		mov edi,-1
		mov count,0
		jmp NEXT_ITERATION

	RETURN:
		mov ebx,MATCHED_SUCCESFULLY_IN_1
		add sum_of_the_find_Quadruplets_in_1_AND_2,ebx
		leave 
		ret
Comparision_of_File_One_Quadruplets_With_File_Two ENDP

Comparision_of_File_One_Quadruplets_With_File_Three PROC
	enter 0,0
	mov MATCHED_SUCCESFULLY_IN_2,0
	mov count,0
	mov esi,0
	mov edi,0
	mov ecx,LENGTH_OF_FILE_3
	mov edx,LENGTH_OF_QUADRUPLET
	OUTERLOOP:
		mov al,DATA_IN_FILE_3[esi]
		mov bl,Quadruplet[edi]
		cmp al,bl
		je CHARACTER_MATCHED
		jne RESET_COUNT

	CHARACTER_MATCHED:
		add count,1
		cmp count,edx
		je CHECK_IF_NEXT_SPACE
		jmp NEXT_ITERATION

	RESET_COUNT:
		mov edi,-1
		mov count,0
		MOVE_TO_NEXT_WORD:
			cmp esi,LENGTH_OF_FILE_3
			jae RETURN
			add esi,1
			cmp DATA_IN_FILE_3[esi],' '
			je NEXT_ITERATION
		jmp MOVE_TO_NEXT_WORD

	NEXT_ITERATION:
		inc esi
		inc edi
	loop OUTERLOOP
	
	CHECK_IF_NEXT_SPACE:
		add esi,1
		cmp DATA_IN_FILE_3[esi],' '
	je QUADRUPLET_MATCHED

	QUADRUPLET_MATCHED:
		mov MATCHED_SUCCESFULLY_IN_2,1
		mov edi,-1
		mov count,0
		jmp NEXT_ITERATION

	RETURN:
		mov ebx,MATCHED_SUCCESFULLY_IN_2
		add sum_of_the_find_Quadruplets_in_1_AND_3,ebx
		leave 
		ret 
Comparision_of_File_One_Quadruplets_With_File_Three ENDP 
END main