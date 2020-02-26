
/* Node 1 */.
DO IF (((VALUE(heal1) EQ 2 OR VALUE(heal1) EQ 3 OR VALUE(heal1) EQ 1) OR (SYSMIS(heal1) OR VALUE(heal1) NE 4  AND  VALUE(heal1) NE 5  AND  VALUE(heal1) NE 9)  AND  ((VALUE(emply) EQ 3 OR VALUE(emply) EQ 1 OR VALUE(emply) EQ 6 OR VALUE(emply) EQ 2 OR
  VALUE(emply) EQ 8 OR VALUE(emply) EQ 5 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 7)  AND  ((VALUE(bmi) LE 42.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) LE 11) OR SYSMIS(heal2)  AND  ((VALUE(heal8) EQ 0 OR VALUE(heal8) EQ 5 OR VALUE(heal8)
  EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 1 OR VALUE(heal8) EQ 6) OR (SYSMIS(heal8) OR VALUE(heal8) NE 97  AND  VALUE(heal8) NE 98)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 4
  OR VALUE(mstatus) EQ 1 OR VALUE(mstatus) EQ 2 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 9)  AND  ((VALUE(heal26) EQ 1 OR VALUE(heal26) EQ 2) OR (SYSMIS(heal26) OR VALUE(heal26) NE 8)  AND  ((VALUE(heal27d) EQ 2 OR VALUE(heal27d)
  EQ 1) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 8)  AND  ((VALUE(heal27f) EQ 2 OR VALUE(heal27f) EQ 1) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 8)  AND  (SYSMIS(heal27g) OR VALUE(heal27g) NE 9))))))))))).
COMPUTE nod_001 = 1.
COMPUTE pre_001 =
  1.
COMPUTE prb_001 = 0.823129.
END IF.
EXECUTE.

/* Node 5 */.
DO IF (((VALUE(heal1) EQ 4 OR VALUE(heal1) EQ 5 OR VALUE(heal1) EQ 9) OR (SYSMIS(heal1) OR VALUE(heal1) NE 2  AND  VALUE(heal1) NE 3  AND  VALUE(heal1) NE 1)  AND  ((VALUE(emply) EQ 7) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 1  AND
  VALUE(emply) NE 6  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 5  AND  VALUE(emply) NE 4)  AND  ((VALUE(bmi) GT 42.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 11) OR SYSMIS(heal2)  AND  ((VALUE(heal8) EQ 97 OR VALUE(heal8) EQ 98)
  OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 6)  AND  ((VALUE(mstatus) EQ 9) OR (SYSMIS
 (mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 2  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26)
  NE 2)  AND  ((VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 2  AND  VALUE(heal27d) NE 1)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)  AND  (VALUE(heal27g) EQ 9)))))))))))  AND  ((
 (VALUE(emply) EQ 1 OR VALUE(emply) EQ 2 OR VALUE(emply) EQ 5) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 7  AND  VALUE(emply) NE 6  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 4)  AND  ((VALUE(age) LE 51.5) OR SYSMIS(age)  AND  (
 (VALUE(income) EQ 6 OR VALUE(income) EQ 7 OR VALUE(income) EQ 4 OR VALUE(income) EQ 5 OR VALUE(income) EQ 12 OR VALUE(income) EQ 15 OR VALUE(income) EQ 14) OR (SYSMIS(income) OR VALUE(income) NE 2  AND  VALUE(income) NE 1  AND  VALUE(income) NE 3  AND
  VALUE(income) NE 9)  AND  ((VALUE(heal27a) EQ 2) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 1)  AND  ((VALUE(mstatus) EQ 1 OR VALUE(mstatus) EQ 9 OR VALUE(mstatus) EQ 2) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE
 (mstatus) NE 4  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(educ) EQ 3 OR VALUE(educ) EQ 4 OR VALUE(educ) EQ 5) OR (SYSMIS(educ) OR VALUE(educ) NE 2  AND  VALUE(educ) NE 1  AND  VALUE(educ) NE 6)  AND  ((VALUE(heal15) EQ 2) OR (SYSMIS(heal15) OR VALUE
 (heal15) NE 1)  AND  ((VALUE(heal12) EQ 0 OR VALUE(heal12) EQ 2 OR VALUE(heal12) EQ 5 OR VALUE(heal12) EQ 7) OR (SYSMIS(heal12) OR VALUE(heal12) NE 1  AND  VALUE(heal12) NE 3  AND  VALUE(heal12) NE 4  AND  VALUE(heal12) NE 98)  AND  ((VALUE(heal8) EQ 5
  OR VALUE(heal8) EQ 6 OR VALUE(heal8) EQ 98) OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 97)  AND  ((VALUE(bmi) GT
  37) OR SYSMIS(bmi)  AND  ((VALUE(heal2) LE 3.5) OR SYSMIS(heal2)  AND  ((VALUE(race) EQ 3 OR VALUE(race) EQ 4) OR (SYSMIS(race) OR VALUE(race) NE 2  AND  VALUE(race) NE 1  AND  VALUE(race) NE 5)  AND  ((VALUE(Race_binned) EQ 3) OR (SYSMIS(Race_binned)
  OR VALUE(Race_binned) NE 2  AND  VALUE(Race_binned) NE 1)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26) NE 2)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)
  AND  (VALUE(sex) EQ 1)))))))))))))))))  AND  (((VALUE(educ) EQ 1 OR VALUE(educ) EQ 6) OR (SYSMIS(educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 2  AND  VALUE(educ) NE 4  AND  VALUE(educ) NE 5)  AND  ((VALUE(mstatus) EQ 9) OR (SYSMIS(mstatus) OR VALUE
 (mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 2  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(income) EQ 15) OR (SYSMIS(income) OR VALUE(income) NE 2  AND  VALUE(income) NE 6  AND  VALUE
 (income) NE 7  AND  VALUE(income) NE 1  AND  VALUE(income) NE 3  AND  VALUE(income) NE 4  AND  VALUE(income) NE 5  AND  VALUE(income) NE 12  AND  VALUE(income) NE 9  AND  VALUE(income) NE 14)  AND  ((VALUE(heal8) EQ 98) OR (SYSMIS(heal8) OR VALUE(heal8)
  NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 6)  AND  ((VALUE(heal27e) EQ 1) OR (SYSMIS(heal27e) OR VALUE(heal27e) NE 2)  AND
  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)  AND  (VALUE(heal12) EQ 0)))))))).
COMPUTE nod_001 = 5.
COMPUTE pre_001 = 0.
COMPUTE prb_001 = 0.857143.
END IF.
EXECUTE.

/* Node 6 */.
DO IF (((VALUE(heal1) EQ 4 OR VALUE(heal1) EQ 5 OR VALUE(heal1) EQ 9) OR (SYSMIS(heal1) OR VALUE(heal1) NE 2  AND  VALUE(heal1) NE 3  AND  VALUE(heal1) NE 1)  AND  ((VALUE(emply) EQ 7) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 1  AND
  VALUE(emply) NE 6  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 5  AND  VALUE(emply) NE 4)  AND  ((VALUE(bmi) GT 42.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 11) OR SYSMIS(heal2)  AND  ((VALUE(heal8) EQ 97 OR VALUE(heal8) EQ 98)
  OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 6)  AND  ((VALUE(mstatus) EQ 9) OR (SYSMIS
 (mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 2  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26)
  NE 2)  AND  ((VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 2  AND  VALUE(heal27d) NE 1)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)  AND  (VALUE(heal27g) EQ 9)))))))))))  AND  ((
 (VALUE(emply) EQ 1 OR VALUE(emply) EQ 2 OR VALUE(emply) EQ 5) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 7  AND  VALUE(emply) NE 6  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 4)  AND  ((VALUE(age) LE 51.5) OR SYSMIS(age)  AND  (
 (VALUE(income) EQ 6 OR VALUE(income) EQ 7 OR VALUE(income) EQ 4 OR VALUE(income) EQ 5 OR VALUE(income) EQ 12 OR VALUE(income) EQ 15 OR VALUE(income) EQ 14) OR (SYSMIS(income) OR VALUE(income) NE 2  AND  VALUE(income) NE 1  AND  VALUE(income) NE 3  AND
  VALUE(income) NE 9)  AND  ((VALUE(heal27a) EQ 2) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 1)  AND  ((VALUE(mstatus) EQ 1 OR VALUE(mstatus) EQ 9 OR VALUE(mstatus) EQ 2) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE
 (mstatus) NE 4  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(educ) EQ 3 OR VALUE(educ) EQ 4 OR VALUE(educ) EQ 5) OR (SYSMIS(educ) OR VALUE(educ) NE 2  AND  VALUE(educ) NE 1  AND  VALUE(educ) NE 6)  AND  ((VALUE(heal15) EQ 2) OR (SYSMIS(heal15) OR VALUE
 (heal15) NE 1)  AND  ((VALUE(heal12) EQ 0 OR VALUE(heal12) EQ 2 OR VALUE(heal12) EQ 5 OR VALUE(heal12) EQ 7) OR (SYSMIS(heal12) OR VALUE(heal12) NE 1  AND  VALUE(heal12) NE 3  AND  VALUE(heal12) NE 4  AND  VALUE(heal12) NE 98)  AND  ((VALUE(heal8) EQ 5
  OR VALUE(heal8) EQ 6 OR VALUE(heal8) EQ 98) OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 97)  AND  ((VALUE(bmi) GT
  37) OR SYSMIS(bmi)  AND  ((VALUE(heal2) LE 3.5) OR SYSMIS(heal2)  AND  ((VALUE(race) EQ 3 OR VALUE(race) EQ 4) OR (SYSMIS(race) OR VALUE(race) NE 2  AND  VALUE(race) NE 1  AND  VALUE(race) NE 5)  AND  ((VALUE(Race_binned) EQ 3) OR (SYSMIS(Race_binned)
  OR VALUE(Race_binned) NE 2  AND  VALUE(Race_binned) NE 1)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26) NE 2)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)
  AND  (VALUE(sex) EQ 1)))))))))))))))))  AND  (((VALUE(educ) EQ 3 OR VALUE(educ) EQ 2 OR VALUE(educ) EQ 4 OR VALUE(educ) EQ 5) OR (SYSMIS(educ) OR VALUE(educ) NE 1  AND  VALUE(educ) NE 6)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE
 (mstatus) EQ 4 OR VALUE(mstatus) EQ 1 OR VALUE(mstatus) EQ 2 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 9)  AND  ((VALUE(income) EQ 2 OR VALUE(income) EQ 6 OR VALUE(income) EQ 7 OR VALUE(income) EQ 1 OR VALUE(income) EQ 3 OR VALUE
 (income) EQ 4 OR VALUE(income) EQ 5 OR VALUE(income) EQ 12 OR VALUE(income) EQ 9 OR VALUE(income) EQ 14) OR (SYSMIS(income) OR VALUE(income) NE 15)  AND  ((VALUE(heal8) EQ 0 OR VALUE(heal8) EQ 5 OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8)
  EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 1 OR VALUE(heal8) EQ 6) OR (SYSMIS(heal8) OR VALUE(heal8) NE 98)  AND  ((VALUE(heal27e) EQ 2) OR (SYSMIS(heal27e) OR VALUE(heal27e) NE 1)  AND  ((VALUE(heal27f) EQ 2 OR VALUE(heal27f) EQ 1) OR (SYSMIS
 (heal27f) OR VALUE(heal27f) NE 8)  AND  (SYSMIS(heal12) OR VALUE(heal12) NE 0)))))))).
COMPUTE nod_001 = 6.
COMPUTE pre_001 = 1.
COMPUTE prb_001 = 0.769231.
END IF.
EXECUTE.

/* Node 11 */.
DO IF (((VALUE(heal1) EQ 4 OR VALUE(heal1) EQ 5 OR VALUE(heal1) EQ 9) OR (SYSMIS(heal1) OR VALUE(heal1) NE 2  AND  VALUE(heal1) NE 3  AND  VALUE(heal1) NE 1)  AND  ((VALUE(emply) EQ 7) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 1  AND
  VALUE(emply) NE 6  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 5  AND  VALUE(emply) NE 4)  AND  ((VALUE(bmi) GT 42.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 11) OR SYSMIS(heal2)  AND  ((VALUE(heal8) EQ 97 OR VALUE(heal8) EQ 98)
  OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 6)  AND  ((VALUE(mstatus) EQ 9) OR (SYSMIS
 (mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 2  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26)
  NE 2)  AND  ((VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 2  AND  VALUE(heal27d) NE 1)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)  AND  (VALUE(heal27g) EQ 9)))))))))))  AND  ((
 (VALUE(emply) EQ 3 OR VALUE(emply) EQ 7 OR VALUE(emply) EQ 6 OR VALUE(emply) EQ 8 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 1  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 5)  AND  ((VALUE(age) GT 51.5) OR SYSMIS(age)  AND  ((VALUE
 (income) EQ 2 OR VALUE(income) EQ 1 OR VALUE(income) EQ 3 OR VALUE(income) EQ 9) OR (SYSMIS(income) OR VALUE(income) NE 6  AND  VALUE(income) NE 7  AND  VALUE(income) NE 4  AND  VALUE(income) NE 5  AND  VALUE(income) NE 12  AND  VALUE(income) NE 15  AND
   VALUE(income) NE 14)  AND  ((VALUE(heal27a) EQ 1) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 2)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 4 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 1  AND  VALUE
 (mstatus) NE 9  AND  VALUE(mstatus) NE 2)  AND  ((VALUE(educ) EQ 2 OR VALUE(educ) EQ 1 OR VALUE(educ) EQ 6) OR (SYSMIS(educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 4  AND  VALUE(educ) NE 5)  AND  ((VALUE(heal15) EQ 1) OR (SYSMIS(heal15) OR VALUE
 (heal15) NE 2)  AND  ((VALUE(heal12) EQ 1 OR VALUE(heal12) EQ 3 OR VALUE(heal12) EQ 4 OR VALUE(heal12) EQ 98) OR (SYSMIS(heal12) OR VALUE(heal12) NE 0  AND  VALUE(heal12) NE 2  AND  VALUE(heal12) NE 5  AND  VALUE(heal12) NE 7)  AND  ((VALUE(heal8) EQ 0
  OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 1 OR VALUE(heal8) EQ 97) OR (SYSMIS(heal8) OR VALUE(heal8) NE 5  AND  VALUE(heal8) NE 6  AND  VALUE(heal8) NE 98)  AND  ((VALUE(bmi) LE 37) OR SYSMIS
 (bmi)  AND  ((VALUE(heal2) GT 3.5) OR SYSMIS(heal2)  AND  ((VALUE(race) EQ 2 OR VALUE(race) EQ 1 OR VALUE(race) EQ 5) OR (SYSMIS(race) OR VALUE(race) NE 3  AND  VALUE(race) NE 4)  AND  ((VALUE(Race_binned) EQ 2 OR VALUE(Race_binned) EQ 1) OR (SYSMIS
 (Race_binned) OR VALUE(Race_binned) NE 3)  AND  ((VALUE(heal26) EQ 1 OR VALUE(heal26) EQ 2) OR (SYSMIS(heal26) OR VALUE(heal26) NE 8)  AND  ((VALUE(heal27f) EQ 2 OR VALUE(heal27f) EQ 1) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 8)  AND  (SYSMIS(sex) OR
  VALUE(sex) NE 1)))))))))))))))))  AND  (((VALUE(heal8) EQ 0 OR VALUE(heal8) EQ 5 OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 6) OR (SYSMIS(heal8) OR VALUE(heal8) NE 1  AND  VALUE(heal8) NE 97)
  AND  ((VALUE(educ) EQ 3 OR VALUE(educ) EQ 2 OR VALUE(educ) EQ 1 OR VALUE(educ) EQ 6 OR VALUE(educ) EQ 4) OR (SYSMIS(educ) OR VALUE(educ) NE 5)  AND  (SYSMIS(heal27e) OR VALUE(heal27e) NE 8))))  AND  (((VALUE(educ) EQ 2 OR VALUE(educ) EQ 6) OR (SYSMIS
 (educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 1  AND  VALUE(educ) NE 4)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 1 OR VALUE(mstatus) EQ 2) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 9  AND  VALUE
 (mstatus) NE 5)  AND  ((VALUE(emply) EQ 7 OR VALUE(emply) EQ 6 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 8)  AND  ((VALUE(heal12) EQ 0 OR VALUE(heal12) EQ 2 OR VALUE(heal12) EQ 4 OR VALUE(heal12) EQ 98) OR
 (SYSMIS(heal12) OR VALUE(heal12) NE 1  AND  VALUE(heal12) NE 3)  AND  ((VALUE(heal27e) EQ 2) OR (SYSMIS(heal27e) OR VALUE(heal27e) NE 1)  AND  ((VALUE(heal27a) EQ 1) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 2)  AND  ((VALUE(heal27c) EQ 1) OR (SYSMIS
 (heal27c) OR VALUE(heal27c) NE 2)  AND  ((VALUE(age) LE 61) OR SYSMIS(age)  AND  ((VALUE(heal27d) EQ 2 OR VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 1)  AND  ((VALUE(heal27b) EQ 1) OR (SYSMIS(heal27b) OR VALUE(heal27b) NE 2)  AND  (
 (VALUE(bmi) LE 24.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 1.5) OR SYSMIS(heal2)  AND  ((VALUE(heal14) EQ 3) OR (SYSMIS(heal14) OR VALUE(heal14) NE 2  AND  VALUE(heal14) NE 1  AND  VALUE(heal14) NE 4)  AND  ((VALUE(race) EQ 2 OR VALUE(race) EQ 1 OR
  VALUE(race) EQ 4) OR (SYSMIS(race) OR VALUE(race) NE 3  AND  VALUE(race) NE 5)  AND  ((VALUE(income) EQ 3 OR VALUE(income) EQ 4 OR VALUE(income) EQ 12) OR (SYSMIS(income) OR VALUE(income) NE 2  AND  VALUE(income) NE 1  AND  VALUE(income) NE 5  AND
  VALUE(income) NE 9)  AND  ((VALUE(sex) EQ 1) OR (SYSMIS(sex) OR VALUE(sex) NE 2)  AND  ((VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7) OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8)
  NE 6)  AND  ((VALUE(Race_binned) EQ 2 OR VALUE(Race_binned) EQ 1) OR (SYSMIS(Race_binned) OR VALUE(Race_binned) NE 3)  AND  ((VALUE(heal27g) EQ 2 OR VALUE(heal27g) EQ 9) OR (SYSMIS(heal27g) OR VALUE(heal27g) NE 1)  AND  ((VALUE(heal6) EQ 3 OR VALUE
 (heal6) EQ 2) OR (SYSMIS(heal6) OR VALUE(heal6) NE 1)  AND  ((VALUE(heal27f) EQ 1) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2)  AND  ((VALUE(heal1) EQ 4) OR (SYSMIS(heal1) OR VALUE(heal1) NE 5  AND  VALUE(heal1) NE 9)  AND  (VALUE(heal26) EQ 2))))))))))
 ))))))))))))))  AND  (((VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 4 OR VALUE(mstatus) EQ 2) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(heal12) EQ 0 OR VALUE(heal12) EQ 98) OR (SYSMIS
 (heal12) OR VALUE(heal12) NE 1  AND  VALUE(heal12) NE 2  AND  VALUE(heal12) NE 3  AND  VALUE(heal12) NE 4)  AND  ((VALUE(emply) EQ 6 OR VALUE(emply) EQ 8) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 7  AND  VALUE(emply) NE 4)  AND  (
 (VALUE(bmi) LE 24) OR SYSMIS(bmi)  AND  ((VALUE(race) EQ 5) OR (SYSMIS(race) OR VALUE(race) NE 2  AND  VALUE(race) NE 3  AND  VALUE(race) NE 1  AND  VALUE(race) NE 4)  AND  ((VALUE(heal2) GT 24) OR SYSMIS(heal2)  AND  (VALUE(age) LE 27.5)))))))
 ).
COMPUTE nod_001 = 11.
COMPUTE pre_001 = 1.
COMPUTE prb_001 = 0.777778.
END IF.
EXECUTE.

/* Node 12 */.
DO IF (((VALUE(heal1) EQ 4 OR VALUE(heal1) EQ 5 OR VALUE(heal1) EQ 9) OR (SYSMIS(heal1) OR VALUE(heal1) NE 2  AND  VALUE(heal1) NE 3  AND  VALUE(heal1) NE 1)  AND  ((VALUE(emply) EQ 7) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 1  AND
  VALUE(emply) NE 6  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 5  AND  VALUE(emply) NE 4)  AND  ((VALUE(bmi) GT 42.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 11) OR SYSMIS(heal2)  AND  ((VALUE(heal8) EQ 97 OR VALUE(heal8) EQ 98)
  OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 6)  AND  ((VALUE(mstatus) EQ 9) OR (SYSMIS
 (mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 2  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26)
  NE 2)  AND  ((VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 2  AND  VALUE(heal27d) NE 1)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)  AND  (VALUE(heal27g) EQ 9)))))))))))  AND  ((
 (VALUE(emply) EQ 3 OR VALUE(emply) EQ 7 OR VALUE(emply) EQ 6 OR VALUE(emply) EQ 8 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 1  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 5)  AND  ((VALUE(age) GT 51.5) OR SYSMIS(age)  AND  ((VALUE
 (income) EQ 2 OR VALUE(income) EQ 1 OR VALUE(income) EQ 3 OR VALUE(income) EQ 9) OR (SYSMIS(income) OR VALUE(income) NE 6  AND  VALUE(income) NE 7  AND  VALUE(income) NE 4  AND  VALUE(income) NE 5  AND  VALUE(income) NE 12  AND  VALUE(income) NE 15  AND
   VALUE(income) NE 14)  AND  ((VALUE(heal27a) EQ 1) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 2)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 4 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 1  AND  VALUE
 (mstatus) NE 9  AND  VALUE(mstatus) NE 2)  AND  ((VALUE(educ) EQ 2 OR VALUE(educ) EQ 1 OR VALUE(educ) EQ 6) OR (SYSMIS(educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 4  AND  VALUE(educ) NE 5)  AND  ((VALUE(heal15) EQ 1) OR (SYSMIS(heal15) OR VALUE
 (heal15) NE 2)  AND  ((VALUE(heal12) EQ 1 OR VALUE(heal12) EQ 3 OR VALUE(heal12) EQ 4 OR VALUE(heal12) EQ 98) OR (SYSMIS(heal12) OR VALUE(heal12) NE 0  AND  VALUE(heal12) NE 2  AND  VALUE(heal12) NE 5  AND  VALUE(heal12) NE 7)  AND  ((VALUE(heal8) EQ 0
  OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 1 OR VALUE(heal8) EQ 97) OR (SYSMIS(heal8) OR VALUE(heal8) NE 5  AND  VALUE(heal8) NE 6  AND  VALUE(heal8) NE 98)  AND  ((VALUE(bmi) LE 37) OR SYSMIS
 (bmi)  AND  ((VALUE(heal2) GT 3.5) OR SYSMIS(heal2)  AND  ((VALUE(race) EQ 2 OR VALUE(race) EQ 1 OR VALUE(race) EQ 5) OR (SYSMIS(race) OR VALUE(race) NE 3  AND  VALUE(race) NE 4)  AND  ((VALUE(Race_binned) EQ 2 OR VALUE(Race_binned) EQ 1) OR (SYSMIS
 (Race_binned) OR VALUE(Race_binned) NE 3)  AND  ((VALUE(heal26) EQ 1 OR VALUE(heal26) EQ 2) OR (SYSMIS(heal26) OR VALUE(heal26) NE 8)  AND  ((VALUE(heal27f) EQ 2 OR VALUE(heal27f) EQ 1) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 8)  AND  (SYSMIS(sex) OR
  VALUE(sex) NE 1)))))))))))))))))  AND  (((VALUE(heal8) EQ 0 OR VALUE(heal8) EQ 5 OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 6) OR (SYSMIS(heal8) OR VALUE(heal8) NE 1  AND  VALUE(heal8) NE 97)
  AND  ((VALUE(educ) EQ 3 OR VALUE(educ) EQ 2 OR VALUE(educ) EQ 1 OR VALUE(educ) EQ 6 OR VALUE(educ) EQ 4) OR (SYSMIS(educ) OR VALUE(educ) NE 5)  AND  (SYSMIS(heal27e) OR VALUE(heal27e) NE 8))))  AND  (((VALUE(educ) EQ 2 OR VALUE(educ) EQ 6) OR (SYSMIS
 (educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 1  AND  VALUE(educ) NE 4)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 1 OR VALUE(mstatus) EQ 2) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 9  AND  VALUE
 (mstatus) NE 5)  AND  ((VALUE(emply) EQ 7 OR VALUE(emply) EQ 6 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 8)  AND  ((VALUE(heal12) EQ 0 OR VALUE(heal12) EQ 2 OR VALUE(heal12) EQ 4 OR VALUE(heal12) EQ 98) OR
 (SYSMIS(heal12) OR VALUE(heal12) NE 1  AND  VALUE(heal12) NE 3)  AND  ((VALUE(heal27e) EQ 2) OR (SYSMIS(heal27e) OR VALUE(heal27e) NE 1)  AND  ((VALUE(heal27a) EQ 1) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 2)  AND  ((VALUE(heal27c) EQ 1) OR (SYSMIS
 (heal27c) OR VALUE(heal27c) NE 2)  AND  ((VALUE(age) LE 61) OR SYSMIS(age)  AND  ((VALUE(heal27d) EQ 2 OR VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 1)  AND  ((VALUE(heal27b) EQ 1) OR (SYSMIS(heal27b) OR VALUE(heal27b) NE 2)  AND  (
 (VALUE(bmi) LE 24.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 1.5) OR SYSMIS(heal2)  AND  ((VALUE(heal14) EQ 3) OR (SYSMIS(heal14) OR VALUE(heal14) NE 2  AND  VALUE(heal14) NE 1  AND  VALUE(heal14) NE 4)  AND  ((VALUE(race) EQ 2 OR VALUE(race) EQ 1 OR
  VALUE(race) EQ 4) OR (SYSMIS(race) OR VALUE(race) NE 3  AND  VALUE(race) NE 5)  AND  ((VALUE(income) EQ 3 OR VALUE(income) EQ 4 OR VALUE(income) EQ 12) OR (SYSMIS(income) OR VALUE(income) NE 2  AND  VALUE(income) NE 1  AND  VALUE(income) NE 5  AND
  VALUE(income) NE 9)  AND  ((VALUE(sex) EQ 1) OR (SYSMIS(sex) OR VALUE(sex) NE 2)  AND  ((VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7) OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8)
  NE 6)  AND  ((VALUE(Race_binned) EQ 2 OR VALUE(Race_binned) EQ 1) OR (SYSMIS(Race_binned) OR VALUE(Race_binned) NE 3)  AND  ((VALUE(heal27g) EQ 2 OR VALUE(heal27g) EQ 9) OR (SYSMIS(heal27g) OR VALUE(heal27g) NE 1)  AND  ((VALUE(heal6) EQ 3 OR VALUE
 (heal6) EQ 2) OR (SYSMIS(heal6) OR VALUE(heal6) NE 1)  AND  ((VALUE(heal27f) EQ 1) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2)  AND  ((VALUE(heal1) EQ 4) OR (SYSMIS(heal1) OR VALUE(heal1) NE 5  AND  VALUE(heal1) NE 9)  AND  (VALUE(heal26) EQ 2))))))))))
 ))))))))))))))  AND  (((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 1 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 2)  AND  ((VALUE(heal12) EQ 1 OR VALUE(heal12) EQ 2 OR VALUE(heal12)
  EQ 3 OR VALUE(heal12) EQ 4) OR (SYSMIS(heal12) OR VALUE(heal12) NE 0  AND  VALUE(heal12) NE 98)  AND  ((VALUE(emply) EQ 3 OR VALUE(emply) EQ 7 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 6  AND  VALUE(emply) NE 8)  AND  ((VALUE(bmi) GT
  24) OR SYSMIS(bmi)  AND  ((VALUE(race) EQ 2 OR VALUE(race) EQ 3 OR VALUE(race) EQ 1 OR VALUE(race) EQ 4) OR (SYSMIS(race) OR VALUE(race) NE 5)  AND  ((VALUE(heal2) LE 24) OR SYSMIS(heal2)  AND  (SYSMIS(age) OR (VALUE(age) GT 27.5))))))))).
COMPUTE
  nod_001 = 12.
COMPUTE pre_001 = 0.
COMPUTE prb_001 = 0.700000.
END IF.
EXECUTE.

/* Node 10 */.
DO IF (((VALUE(heal1) EQ 4 OR VALUE(heal1) EQ 5 OR VALUE(heal1) EQ 9) OR (SYSMIS(heal1) OR VALUE(heal1) NE 2  AND  VALUE(heal1) NE 3  AND  VALUE(heal1) NE 1)  AND  ((VALUE(emply) EQ 7) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 1  AND
  VALUE(emply) NE 6  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 5  AND  VALUE(emply) NE 4)  AND  ((VALUE(bmi) GT 42.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 11) OR SYSMIS(heal2)  AND  ((VALUE(heal8) EQ 97 OR VALUE(heal8) EQ 98)
  OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 6)  AND  ((VALUE(mstatus) EQ 9) OR (SYSMIS
 (mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 2  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26)
  NE 2)  AND  ((VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 2  AND  VALUE(heal27d) NE 1)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)  AND  (VALUE(heal27g) EQ 9)))))))))))  AND  ((
 (VALUE(emply) EQ 3 OR VALUE(emply) EQ 7 OR VALUE(emply) EQ 6 OR VALUE(emply) EQ 8 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 1  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 5)  AND  ((VALUE(age) GT 51.5) OR SYSMIS(age)  AND  ((VALUE
 (income) EQ 2 OR VALUE(income) EQ 1 OR VALUE(income) EQ 3 OR VALUE(income) EQ 9) OR (SYSMIS(income) OR VALUE(income) NE 6  AND  VALUE(income) NE 7  AND  VALUE(income) NE 4  AND  VALUE(income) NE 5  AND  VALUE(income) NE 12  AND  VALUE(income) NE 15  AND
   VALUE(income) NE 14)  AND  ((VALUE(heal27a) EQ 1) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 2)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 4 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 1  AND  VALUE
 (mstatus) NE 9  AND  VALUE(mstatus) NE 2)  AND  ((VALUE(educ) EQ 2 OR VALUE(educ) EQ 1 OR VALUE(educ) EQ 6) OR (SYSMIS(educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 4  AND  VALUE(educ) NE 5)  AND  ((VALUE(heal15) EQ 1) OR (SYSMIS(heal15) OR VALUE
 (heal15) NE 2)  AND  ((VALUE(heal12) EQ 1 OR VALUE(heal12) EQ 3 OR VALUE(heal12) EQ 4 OR VALUE(heal12) EQ 98) OR (SYSMIS(heal12) OR VALUE(heal12) NE 0  AND  VALUE(heal12) NE 2  AND  VALUE(heal12) NE 5  AND  VALUE(heal12) NE 7)  AND  ((VALUE(heal8) EQ 0
  OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 1 OR VALUE(heal8) EQ 97) OR (SYSMIS(heal8) OR VALUE(heal8) NE 5  AND  VALUE(heal8) NE 6  AND  VALUE(heal8) NE 98)  AND  ((VALUE(bmi) LE 37) OR SYSMIS
 (bmi)  AND  ((VALUE(heal2) GT 3.5) OR SYSMIS(heal2)  AND  ((VALUE(race) EQ 2 OR VALUE(race) EQ 1 OR VALUE(race) EQ 5) OR (SYSMIS(race) OR VALUE(race) NE 3  AND  VALUE(race) NE 4)  AND  ((VALUE(Race_binned) EQ 2 OR VALUE(Race_binned) EQ 1) OR (SYSMIS
 (Race_binned) OR VALUE(Race_binned) NE 3)  AND  ((VALUE(heal26) EQ 1 OR VALUE(heal26) EQ 2) OR (SYSMIS(heal26) OR VALUE(heal26) NE 8)  AND  ((VALUE(heal27f) EQ 2 OR VALUE(heal27f) EQ 1) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 8)  AND  (SYSMIS(sex) OR
  VALUE(sex) NE 1)))))))))))))))))  AND  (((VALUE(heal8) EQ 0 OR VALUE(heal8) EQ 5 OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 6) OR (SYSMIS(heal8) OR VALUE(heal8) NE 1  AND  VALUE(heal8) NE 97)
  AND  ((VALUE(educ) EQ 3 OR VALUE(educ) EQ 2 OR VALUE(educ) EQ 1 OR VALUE(educ) EQ 6 OR VALUE(educ) EQ 4) OR (SYSMIS(educ) OR VALUE(educ) NE 5)  AND  (SYSMIS(heal27e) OR VALUE(heal27e) NE 8))))  AND  (((VALUE(educ) EQ 3 OR VALUE(educ) EQ 1 OR VALUE(educ
 ) EQ 4) OR (SYSMIS(educ) OR VALUE(educ) NE 2  AND  VALUE(educ) NE 6)  AND  ((VALUE(mstatus) EQ 4 OR VALUE(mstatus) EQ 9 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 1  AND  VALUE
 (mstatus) NE 2)  AND  ((VALUE(emply) EQ 3 OR VALUE(emply) EQ 8) OR (SYSMIS(emply) OR VALUE(emply) NE 7  AND  VALUE(emply) NE 6  AND  VALUE(emply) NE 4)  AND  ((VALUE(heal12) EQ 1 OR VALUE(heal12) EQ 3) OR (SYSMIS(heal12) OR VALUE(heal12) NE 0  AND
  VALUE(heal12) NE 2  AND  VALUE(heal12) NE 4  AND  VALUE(heal12) NE 98)  AND  ((VALUE(heal27e) EQ 1) OR (SYSMIS(heal27e) OR VALUE(heal27e) NE 2)  AND  ((VALUE(heal27a) EQ 2) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 1)  AND  ((VALUE(heal27c) EQ 2) OR
 (SYSMIS(heal27c) OR VALUE(heal27c) NE 1)  AND  ((VALUE(age) GT 61) OR SYSMIS(age)  AND  ((VALUE(heal27d) EQ 1) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 2  AND  VALUE(heal27d) NE 8)  AND  ((VALUE(heal27b) EQ 2) OR (SYSMIS(heal27b) OR VALUE(heal27b) NE 1)
   AND  ((VALUE(bmi) GT 24.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) LE 1.5) OR SYSMIS(heal2)  AND  ((VALUE(heal14) EQ 2 OR VALUE(heal14) EQ 1 OR VALUE(heal14) EQ 4) OR (SYSMIS(heal14) OR VALUE(heal14) NE 3)  AND  ((VALUE(race) EQ 3 OR VALUE(race) EQ 5) OR
 (SYSMIS(race) OR VALUE(race) NE 2  AND  VALUE(race) NE 1  AND  VALUE(race) NE 4)  AND  ((VALUE(income) EQ 2 OR VALUE(income) EQ 1 OR VALUE(income) EQ 5 OR VALUE(income) EQ 9) OR (SYSMIS(income) OR VALUE(income) NE 3  AND  VALUE(income) NE 4  AND  VALUE
 (income) NE 12)  AND  ((VALUE(sex) EQ 2) OR (SYSMIS(sex) OR VALUE(sex) NE 1)  AND  ((VALUE(heal8) EQ 0 OR VALUE(heal8) EQ 5 OR VALUE(heal8) EQ 6) OR (SYSMIS(heal8) OR VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8)
  NE 7)  AND  ((VALUE(Race_binned) EQ 3) OR (SYSMIS(Race_binned) OR VALUE(Race_binned) NE 2  AND  VALUE(Race_binned) NE 1)  AND  ((VALUE(heal27g) EQ 1) OR (SYSMIS(heal27g) OR VALUE(heal27g) NE 2  AND  VALUE(heal27g) NE 9)  AND  ((VALUE(heal6) EQ 1) OR
 (SYSMIS(heal6) OR VALUE(heal6) NE 3  AND  VALUE(heal6) NE 2)  AND  ((VALUE(heal27f) EQ 2) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 1)  AND  ((VALUE(heal1) EQ 5 OR VALUE(heal1) EQ 9) OR (SYSMIS(heal1) OR VALUE(heal1) NE 4)  AND  (SYSMIS(heal26) OR VALUE
 (heal26) NE 2)))))))))))))))))))))))).
COMPUTE nod_001 = 10.
COMPUTE pre_001 = 0.
COMPUTE prb_001 = 0.800000.
END IF.
EXECUTE.

/* Node 8 */.
DO IF (((VALUE(heal1) EQ 4 OR VALUE(heal1) EQ 5 OR VALUE(heal1) EQ 9) OR (SYSMIS(heal1) OR VALUE(heal1) NE 2  AND  VALUE(heal1) NE 3  AND  VALUE(heal1) NE 1)  AND  ((VALUE(emply) EQ 7) OR (SYSMIS(emply) OR VALUE(emply) NE 3  AND  VALUE(emply) NE 1  AND
  VALUE(emply) NE 6  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 8  AND  VALUE(emply) NE 5  AND  VALUE(emply) NE 4)  AND  ((VALUE(bmi) GT 42.5) OR SYSMIS(bmi)  AND  ((VALUE(heal2) GT 11) OR SYSMIS(heal2)  AND  ((VALUE(heal8) EQ 97 OR VALUE(heal8) EQ 98)
  OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND  VALUE(heal8) NE 1  AND  VALUE(heal8) NE 6)  AND  ((VALUE(mstatus) EQ 9) OR (SYSMIS
 (mstatus) OR VALUE(mstatus) NE 3  AND  VALUE(mstatus) NE 6  AND  VALUE(mstatus) NE 4  AND  VALUE(mstatus) NE 1  AND  VALUE(mstatus) NE 2  AND  VALUE(mstatus) NE 5)  AND  ((VALUE(heal26) EQ 8) OR (SYSMIS(heal26) OR VALUE(heal26) NE 1  AND  VALUE(heal26)
  NE 2)  AND  ((VALUE(heal27d) EQ 8) OR (SYSMIS(heal27d) OR VALUE(heal27d) NE 2  AND  VALUE(heal27d) NE 1)  AND  ((VALUE(heal27f) EQ 8) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 2  AND  VALUE(heal27f) NE 1)  AND  (VALUE(heal27g) EQ 9)))))))))))  AND  ((
 (VALUE(emply) EQ 3 OR VALUE(emply) EQ 7 OR VALUE(emply) EQ 6 OR VALUE(emply) EQ 8 OR VALUE(emply) EQ 4) OR (SYSMIS(emply) OR VALUE(emply) NE 1  AND  VALUE(emply) NE 2  AND  VALUE(emply) NE 5)  AND  ((VALUE(age) GT 51.5) OR SYSMIS(age)  AND  ((VALUE
 (income) EQ 2 OR VALUE(income) EQ 1 OR VALUE(income) EQ 3 OR VALUE(income) EQ 9) OR (SYSMIS(income) OR VALUE(income) NE 6  AND  VALUE(income) NE 7  AND  VALUE(income) NE 4  AND  VALUE(income) NE 5  AND  VALUE(income) NE 12  AND  VALUE(income) NE 15  AND
   VALUE(income) NE 14)  AND  ((VALUE(heal27a) EQ 1) OR (SYSMIS(heal27a) OR VALUE(heal27a) NE 2)  AND  ((VALUE(mstatus) EQ 3 OR VALUE(mstatus) EQ 6 OR VALUE(mstatus) EQ 4 OR VALUE(mstatus) EQ 5) OR (SYSMIS(mstatus) OR VALUE(mstatus) NE 1  AND  VALUE
 (mstatus) NE 9  AND  VALUE(mstatus) NE 2)  AND  ((VALUE(educ) EQ 2 OR VALUE(educ) EQ 1 OR VALUE(educ) EQ 6) OR (SYSMIS(educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 4  AND  VALUE(educ) NE 5)  AND  ((VALUE(heal15) EQ 1) OR (SYSMIS(heal15) OR VALUE
 (heal15) NE 2)  AND  ((VALUE(heal12) EQ 1 OR VALUE(heal12) EQ 3 OR VALUE(heal12) EQ 4 OR VALUE(heal12) EQ 98) OR (SYSMIS(heal12) OR VALUE(heal12) NE 0  AND  VALUE(heal12) NE 2  AND  VALUE(heal12) NE 5  AND  VALUE(heal12) NE 7)  AND  ((VALUE(heal8) EQ 0
  OR VALUE(heal8) EQ 3 OR VALUE(heal8) EQ 4 OR VALUE(heal8) EQ 2 OR VALUE(heal8) EQ 7 OR VALUE(heal8) EQ 1 OR VALUE(heal8) EQ 97) OR (SYSMIS(heal8) OR VALUE(heal8) NE 5  AND  VALUE(heal8) NE 6  AND  VALUE(heal8) NE 98)  AND  ((VALUE(bmi) LE 37) OR SYSMIS
 (bmi)  AND  ((VALUE(heal2) GT 3.5) OR SYSMIS(heal2)  AND  ((VALUE(race) EQ 2 OR VALUE(race) EQ 1 OR VALUE(race) EQ 5) OR (SYSMIS(race) OR VALUE(race) NE 3  AND  VALUE(race) NE 4)  AND  ((VALUE(Race_binned) EQ 2 OR VALUE(Race_binned) EQ 1) OR (SYSMIS
 (Race_binned) OR VALUE(Race_binned) NE 3)  AND  ((VALUE(heal26) EQ 1 OR VALUE(heal26) EQ 2) OR (SYSMIS(heal26) OR VALUE(heal26) NE 8)  AND  ((VALUE(heal27f) EQ 2 OR VALUE(heal27f) EQ 1) OR (SYSMIS(heal27f) OR VALUE(heal27f) NE 8)  AND  (SYSMIS(sex) OR
  VALUE(sex) NE 1)))))))))))))))))  AND  (((VALUE(heal8) EQ 1 OR VALUE(heal8) EQ 97) OR (SYSMIS(heal8) OR VALUE(heal8) NE 0  AND  VALUE(heal8) NE 5  AND  VALUE(heal8) NE 3  AND  VALUE(heal8) NE 4  AND  VALUE(heal8) NE 2  AND  VALUE(heal8) NE 7  AND
  VALUE(heal8) NE 6)  AND  ((VALUE(educ) EQ 5) OR (SYSMIS(educ) OR VALUE(educ) NE 3  AND  VALUE(educ) NE 2  AND  VALUE(educ) NE 1  AND  VALUE(educ) NE 6  AND  VALUE(educ) NE 4)  AND  (VALUE(heal27e) EQ 8)))).
COMPUTE nod_001 = 8.
COMPUTE pre_001 =
  1.
COMPUTE prb_001 = 0.800000.
END IF.
EXECUTE.
