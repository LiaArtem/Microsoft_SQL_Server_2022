CREATE PROCEDURE [dbo].[insert_kurs]
	@p_curs_date NVARCHAR(255),
	@p_curr_code NVARCHAR(3),
	@p_rate NUMERIC(38,6)
AS
  DECLARE @m_curr_code NVARCHAR(3);
BEGIN
   SELECT @m_curr_code = c.CODE FROM CURRENCY c WHERE c.SHORT_NAME = @p_curr_code;

   INSERT INTO KURS (KURS_DATE, CURRENCY_CODE, RATE, FORC)
       SELECT CONVERT(date, @p_curs_date, 23), @m_curr_code, @p_rate, 1
       WHERE NOT EXISTS (SELECT 1 FROM KURS c where c.KURS_DATE = CONVERT(date, @p_curs_date, 23) and c.CURRENCY_CODE = @m_curr_code);     
RETURN 0
END