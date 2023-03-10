ALTER TABLE DIRECT.T_PRD_MST ADD PRD_MST_PRP_YN CHAR(1) DEFAULT 'N';

ALTER TABLE DIRECT.C_PRD_MST ADD PRD_MST_PRP_YN CHAR(1) DEFAULT 'N';

CREATE TABLE "DIRECT"."T_PRD_PRP"
(
    "PRD_MST_CD" VARCHAR2(20) NOT NULL ENABLE,
    "RDP_MST_IDX" VARCHAR2(30) NOT NULL ENABLE,
    "PRD_PRP_REG_DT" CHAR(14),
    "PRD_PRP_REG_IP" VARCHAR2(20),
    "PRD_PRP_REG_ID" VARCHAR2(20),
    CONSTRAINT "T_PRD_PRP" PRIMARY KEY (PRD_MST_CD,RDP_MST_IDX) );
CREATE INDEX T_PRD_PRP_RDP_MST_IDX_IDX ON DIRECT.T_PRD_PRP (RDP_MST_IDX);


COMMENT ON TABLE DIRECT.T_PRD_PRP IS '래디플래너 전용상품 래디플래너 연결 관리';
COMMENT ON COLUMN DIRECT.T_PRD_PRP.PRD_PRP_IDX IS '연결_IDX';
COMMENT ON COLUMN DIRECT.T_PRD_PRP.PRD_MST_CD IS '상품코드';
COMMENT ON COLUMN DIRECT.T_PRD_PRP.RDP_MST_IDX IS '래디플래너 IDX';