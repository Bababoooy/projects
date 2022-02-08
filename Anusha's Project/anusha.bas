DECLARE SUB CREATE ()
DECLARE SUB addrecords ()
DECLARE SUB displayrecords ()
DECLARE SUB searchrecords ()
DECLARE SUB editrecords ()
DECLARE SUB deleterecords ()
DO
CLS
PRINT
PRINT TAB(25); "Bill management 2021"
PRINT
PRINT
PRINT "Options to manage the fees are"
    PRINT "1. Create a data record"
    PRINT "2. Add some record "
    PRINT "3. Display some record"
    PRINT "4. Delete a records"
    PRINT "5. Edit some records"
    PRINT "6. Search some records"
    PRINT "7. Exit"
    PRINT
    PRINT
    INPUT "Enter any number"; T
    CLS
    SELECT CASE T
        CASE 1
            CALL CREATE
        CASE 2
            CALL addrecords
        CASE 3
            CALL displayrecords
        CASE 4
            CALL deleterecords
        CASE 5
            CALL editrecords
        CASE 6
            CALL searchrecords
        CASE 7
        PRINT
        PRINT
        PRINT TAB(30); "Thank you"
        EXIT DO
        END SELECT
LOOP
END

SUB addrecords
    OPEN "info.txt" FOR APPEND AS #1
    DO
        CLS
        PRINT "adding records of PARKS"
        INPUT "Name of the student"; name$
        INPUT "Phone number"; phonenum$
        INPUT "Fees"; fees
        WRITE #1, name$, phonenum$, fees
        INPUT "want more records(y/n)"; ch$
    LOOP WHILE LCASE$(ch$) = "y"
    CLOSE #1
END SUB

SUB CREATE
OPEN "info.txt" FOR OUTPUT AS #1
TOP:
        INPUT "Name of the student"; name$
        INPUT "Phone number"; phonenum$
        INPUT "Fees"; fees
        WRITE #1, name$, phonenum$, fees
        INPUT "DO YOU WANT TO ADD ANOTHER (y/n)"; ANS$
        IF LCASE$(ANS$) = "y" THEN GOTO TOP
CLOSE #1

END SUB

SUB searchrecords
    OPEN "info.txt" FOR INPUT AS #1
     INPUT "enter the name to search"; search$
    DO WHILE NOT EOF(1)
        CLS

        PRINT "searchingrecord"
        PRINT
        PRINT "Name", "Phone Number", "Fees"
        PRINT
        INPUT #1, name$, phonenum$, fees
        IF UCASE$(search$) = UCASE$(name$) THEN
            PRINT name$, phonenum$, fees
            search = 1
            EXIT DO
        END IF
    LOOP
    CLOSE #1
    IF search = 0 THEN
        PRINT "records not found"
    END IF
    DO WHILE INKEY$ = ""
    LOOP
END SUB

SUB deleterecords
    OPEN "info.txt" FOR INPUT AS #1
    OPEN "temp.txt" FOR OUTPUT AS #2
    INPUT "enter the student's name "; n$
    CLS
    PRINT "deleting record"
    PRINT
    PRINT "Name", "Phone Number", "Fees"
    PRINT
    DO WHILE NOT EOF(1)
        INPUT #1, name$, phonenum$, fees
        IF UCASE$(n$) <> UCASE$(name$) THEN
            WRITE #2, name$, phonenum$, fees
        ELSE
            d = d + 1
        END IF
        PRINT name$, phonenum$, fees
    LOOP
    IF d >= 1 THEN
        LOCATE 15, 17: PRINT d; "record(s) deleted"
    ELSE
        LOCATE 18, 17: PRINT " no record deleted"
    END IF
    CLOSE #1, #2
    DO WHILE INKEY$ = ""
    LOOP
    KILL "info.txt"
    NAME "temp.txt" AS "info.txt"
END SUB

SUB displayrecords
OPEN "info.txt" FOR INPUT AS #2
CLS
PRINT "displaying all records"
PRINT "Name", "Phone Number", "Fees"
DO WHILE NOT EOF(2)
INPUT #2, name$, phonenum$, fees
PRINT name$, name$, phonenum$, fees
LOOP
DO WHILE INKEY$ = ""
LOOP
CLOSE #2
END SUB

SUB editrecords
    OPEN "INFO.TXT" FOR INPUT AS #1
    OPEN "temp.txt" FOR OUTPUT AS #2
        PRINT "upgrading info"
    CLS
    PRINT "edit record"
    PRINT "S.N", "Name", "Phone Number", "Fees"

    DO WHILE NOT EOF(1)
        INPUT #1, name$, phonenum$, fees
        f = f + 1
        PRINT f, name$, phonenum$, fees
        INPUT "do you want to edit (y/n)"; y$
        IF LCASE$(y$) = "y" THEN
        INPUT "name"; name$
        INPUT "phone number"; phonenum$
        INPUT "fees"; fees
        END IF
        WRITE #2, name$, phonenum$, fees
    LOOP

    PRINT "record is upgraded"
    CLOSE #1, #2
    DO WHILE INKEY$ = ""
    LOOP
    KILL "info.txt"
    NAME "temp.txt" AS "INFO.TXT"
END SUB