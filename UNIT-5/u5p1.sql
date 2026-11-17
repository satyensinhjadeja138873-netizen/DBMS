CREATE OR REPLACE TRIGGER trg_restrict_weekend
BEFORE INSERT OR UPDATE OR DELETE ON EMP
BEGIN
  -- Checks if current day is Saturday (SAT) or Sunday (SUN)
  IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Access to the EMP table is restricted on weekends.');
  END IF;
END;
/