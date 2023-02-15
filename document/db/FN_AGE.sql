CREATE OR REPLACE FUNCTION DAEMYUNG.FN_AGE 
/******************************************************************************
   [파라메터]
        # INPUT
                1. PS_BIRTHDAY   생년월일 '19910101'
        # OUTPUT 연령대
   [사용예제]    
            SELECT FN_AGE('19910101') FROM DUAL
   ******************************************************************************/
(
  PS_BIRTHDAY IN VARCHAR2
)

RETURN VARCHAR2

IS

  LS_RETUN_DATA   VARCHAR2(100);
  
BEGIN
    SELECT
        TRUNC((MONTHS_BETWEEN(TRUNC(SYSDATE,'YEAR'),TRUNC(TO_DATE(PS_BIRTHDAY,'YYYYMMDD'),'YEAR')) /12 +1)/10) * 10 INTO LS_RETUN_DATA
    FROM DUAL;
    
    IF TO_NUMBER(LS_RETUN_DATA) > 60 THEN
        LS_RETUN_DATA := '60';
    END IF;
    
  RETURN LS_RETUN_DATA;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN LS_RETUN_DATA;
    WHEN OTHERS THEN
        RETURN LS_RETUN_DATA;

END FN_AGE;
/
