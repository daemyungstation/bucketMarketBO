SELECT #{DEVICE} || TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(SEQ_ORD_MST_IDX.NEXTVAL, 4, '0') FROM DUAL