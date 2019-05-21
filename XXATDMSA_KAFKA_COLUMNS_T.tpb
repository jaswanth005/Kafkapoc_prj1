
CREATE OR REPLACE TYPE APPS.xxatdmsa_kafka_columns_t is object
(
/*********************************************************************************************
*
* CVS File Id :  $Id: APPS.XXATD_GENERIC_COLUMNS_T.sql,v 1.1 2018/02/15 21:47:51 rpogula Exp $
*
* Copyright   :  Copyright 2017 American Tire Distributors, Inc.
*
* Description :  This type contains 10 columns for which serves as generic placeholder
*
*
* Author(s)   :  Rahul Pogula
*
*                American Tire Distributors
*                12200 Herbert Wayne Ct.
*                Huntersville, NC 28078
*
* History     :
*                $Log: APPS.XXATD_GENERIC_COLUMNS_T.sql,v $
*                Revision 1.1  2018/02/15 21:47:51  rpogula
*                DB-7677    EASY - Device Outbound Interface
*
*
***********************************************************************************************/
/* SNIFF_DISABLE Sniff_NoTabsAllowed */
/* SNIFF_DISABLE Sniff_EqualsOperatorSpacing */
/* SNIFF_DISABLE Sniff_ExtraneousWhiteSpace */

column1 varchar2(4000),
column2 clob,
constructor function xxatdmsa_kafka_columns_t return self as result

);
/


CREATE OR REPLACE TYPE BODY APPS.xxatdmsa_kafka_columns_t as
/*********************************************************************************************
*
* CVS File Id :  $Id: APPS.XXATD_GENERIC_COLUMNS_T.sql,v 1.1 2018/02/15 21:47:51 rpogula Exp $
*
* Copyright   :  Copyright 2017 American Tire Distributors, Inc.
*
* Description :  This type contains 10 columns for which serves as generic placeholder
*
*
* Author(s)   :  Rahul Pogula
*
*                American Tire Distributors
*                12200 Herbert Wayne Ct.
*                Huntersville, NC 28078
*
* History     :
*                $Log: APPS.XXATD_GENERIC_COLUMNS_T.sql,v $
*                Revision 1.1  2018/02/15 21:47:51  rpogula
*                DB-7677    EASY - Device Outbound Interface
*
*
***********************************************************************************************/
/* SNIFF_DISABLE Sniff_NoTabsAllowed */
/* SNIFF_DISABLE Sniff_EqualsOperatorSpacing */
/* SNIFF_DISABLE Sniff_ExtraneousWhiteSpace */

constructor function xxatdmsa_kafka_columns_t return self as result
is
begin
return;
end;
end;
/
