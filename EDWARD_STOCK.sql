/*EDWARD*/
CREATE OR REPLACE PROCEDURE PROC_CT_CUSTOMER IS
      V_CNT NUMBER;
BEGIN

SELECT COUNT (*) INTO V_CNT

FROM ALL_TABLES

WHERE OWNER = 'DEMO' AND

      TABLE_NAME = 'CUSTOMER';
      
    IF V_CNT = 0 THEN
    
    EXECUTE IMMEDIATE 'CREATE TABLE CUSTOMER
                    (
                    CUSTOMER_ID INT,
                    EMAIL VARCHAR2(45),
                    FIRSTNAME VARCHAR2(40),
                    LASTNAME VARCHAR2(40),
                    BIRTHDATE DATE,
                    CREDITS DECIMAL(4)
                    )';
                    
                    COMMIT;
                    
      END IF;
      
      SELECT COUNT (*) INTO V_CNT

FROM ALL_SEQUENCES

WHERE SEQUENCE_OWNER = 'DEMO' AND

      sequence_name = 'SQE_CUSTOMER_ID';
      
    IF V_CNT = 0 THEN
    
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SQE_CUSTOMER_ID
                       START WITH 10000
                       INCREMENT BY 1
                       CACHE 50';
                    
                    COMMIT;
                    
      END IF;
      
      
  
END PROC_CT_CUSTOMER;


