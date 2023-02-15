CREATE OR REPLACE FUNCTION FN_MASKING 
/******************************************************************************
   [파라메터]
        # INPUT
                1. PS_GUBUN   구분(SSN:주민번호, ACCOUNT:계좌번호, CARD:카드번호, TEL:전화번호, MOBILE:휴대폰번호, EMAIL:이메일주소)
                2. PS_DATA    마스킹할 데이터

        # OUTPUT 마스킹한 데이터
   [사용예제]    
            SELECT 'SSN' ,FN_MASKING('SSN','1234561234567') FROM DUAL  --주민번호
            UNION ALL
            SELECT 'ACCOUNT' ,FN_MASKING('ACCOUNT','1234567812345678') FROM DUAL  --계좌번호
            UNION ALL
            SELECT 'CARD' ,FN_MASKING('CARD','1234567812345678') FROM DUAL   --카드번호 
            UNION ALL
            SELECT 'TEL' ,FN_MASKING('TEL','01099259341') FROM DUAL    --전화번호
            UNION ALL
            SELECT 'MOBILE' ,FN_MASKING('MOBILE','010-99259341') FROM DUAL   --휴대폰번호
            UNION ALL
            SELECT 'EMAIL' ,FN_MASKING('EMAIL','1234@NAVER.COM') FROM DUAL --이메일주소
            UNION ALL
            SELECT 'USER_NM',FN_MASKING('USER_NM', '홍길동') FROM DUAL -- 사용자명
   ******************************************************************************/
(
  PS_GUBUN IN VARCHAR2,
  PS_DATA IN VARCHAR2
)

RETURN VARCHAR2

IS

  LS_RETUN_DATA   VARCHAR2(100);
  LS_TEMP         VARCHAR2(100);

BEGIN

/*******************************************************************************
1단계: 필수값 체크
********************************************************************************/
    IF PS_GUBUN IS NULL OR PS_DATA IS NULL THEN  
        DBMS_OUTPUT.PUT_LINE('입력 값 PS_GUBUN,PS_DATA 값은 필수값입니다. ');
        RETURN '';
    END IF;

    LS_RETUN_DATA  := PS_DATA;

/*******************************************************************************
2단계: 암호화 해제
********************************************************************************/
    -- 암호화되어 있으면 복호화 함.
    /*
    SELECT FC_CM_DECRYPT_AES(PS_DATA) INTO LS_RETUN_DATA FROM DUAL;
    */
    -- 복호화되지 않은 건이면 원본 데이터로 셋팅
    IF LS_RETUN_DATA IS NULL THEN
        LS_RETUN_DATA := PS_DATA;
    END IF;

/*******************************************************************************
3단계: 마스킹 처리
********************************************************************************/
    -- 숫자만 남기고 특수문자 빼기-이메일 제외
    IF PS_GUBUN != 'EMAIL' THEN
        SELECT REGEXP_REPLACE(LS_RETUN_DATA, '[^0-9]') INTO LS_RETUN_DATA FROM DUAL;
    END IF;
    
    -- 1. 주민번호
    IF PS_GUBUN = 'SSN' THEN
        IF LENGTH(LS_RETUN_DATA) = 13 THEN
            LS_RETUN_DATA := SUBSTR(LS_RETUN_DATA,1,6) || '-' || SUBSTR(LS_RETUN_DATA,7,1) || '******';
        END IF;

    -- 2. 계좌번호
    ELSIF PS_GUBUN = 'ACCOUNT' THEN
        IF LENGTH(LS_RETUN_DATA) > 4 THEN
            LS_RETUN_DATA := SUBSTR(LS_RETUN_DATA,1,LENGTH(LS_RETUN_DATA)-4) || '****';
        END IF;
        
    -- 3. 신용카드번호
    ELSIF PS_GUBUN = 'CARD' THEN
        -- 14,15,16자리만 마스킹처리함.
        -- IF LENGTH(LS_RETUN_DATA) = 14 OR LENGTH(LS_RETUN_DATA) = 15 OR LENGTH(LS_RETUN_DATA) = 16 THEN
        IF LENGTH(LS_RETUN_DATA) >= 14 THEN
            LS_RETUN_DATA := SUBSTR(RTRIM(LS_RETUN_DATA,' '),1,4) || '-****-****-' || SUBSTR(RTRIM(LS_RETUN_DATA,' '),LENGTH(RTRIM(LS_RETUN_DATA,' '))-3, 4);
        END IF;

    -- 4. 전화번호
    ELSIF PS_GUBUN = 'TEL' THEN
        IF LENGTH(LS_RETUN_DATA) = 9 OR LENGTH(LS_RETUN_DATA) = 10 OR LENGTH(LS_RETUN_DATA) = 11 THEN
            SELECT REGEXP_REPLACE(REGEXP_REPLACE(LS_RETUN_DATA, '[^[:digit:]]'),'(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-****')
                INTO LS_RETUN_DATA
            FROM DUAL;
        END IF;

    -- 5. 휴대폰번호
    ELSIF PS_GUBUN = 'MOBILE' THEN
        IF LENGTH(LS_RETUN_DATA) = 10 OR LENGTH(LS_RETUN_DATA) = 11 THEN
            --SELECT REGEXP_REPLACE(REGEXP_REPLACE(LS_RETUN_DATA, '[^[:digit:]]'), '(^[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4}$)', '\1-\2-****')
            SELECT REGEXP_REPLACE(REGEXP_REPLACE(LS_RETUN_DATA, '[^[:digit:]]'),'(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-****')
                INTO LS_RETUN_DATA
            FROM DUAL;
        END IF;

    -- 6. 이메일주소
    ELSIF PS_GUBUN = 'EMAIL' THEN
        LS_TEMP := SUBSTR(LS_RETUN_DATA,1,INSTR(LS_RETUN_DATA,'@')-1);    --@앞자리
        IF LENGTH(LS_TEMP) > 3 THEN
            LS_TEMP := SUBSTR(LS_TEMP,1,LENGTH(LS_TEMP)-3) || '***';
        ELSIF LENGTH(LS_TEMP) = 3 THEN
            LS_TEMP := '***';
        ELSIF LENGTH(LS_TEMP) = 2 THEN
            LS_TEMP := '**';
        ELSIF LENGTH(LS_TEMP) = 1 THEN
            LS_TEMP := '*';
        ELSE
            LS_TEMP := '';
        END IF;
        LS_RETUN_DATA := LS_TEMP || SUBSTR(LS_RETUN_DATA,INSTR(LS_RETUN_DATA,'@'));
    
    -- 7. 사용자명
    ELSIF PS_GUBUN = 'USER_NM' THEN
        IF LENGTH(PS_DATA) = 2 THEN
            LS_TEMP := SUBSTR(PS_DATA,0,1)||'*';
        ELSE
            LS_TEMP := RPAD(SUBSTR(PS_DATA,0,1), LENGTH(PS_DATA), '*') || SUBSTR(PS_DATA,-1);
        END IF;
        LS_RETUN_DATA := LS_TEMP;
       
    ELSE
        DBMS_OUTPUT.PUT_LINE('PS_GUBUN 값 오류입니다. PS_GUBUN: ' || PS_GUBUN);
    END IF;

  RETURN LS_RETUN_DATA;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN LS_RETUN_DATA;
    WHEN OTHERS THEN
        RETURN LS_RETUN_DATA;

END FN_MASKING;
/