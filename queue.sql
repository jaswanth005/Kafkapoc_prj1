BEGIN
  DBMS_AQADM.CREATE_QUEUE_TABLE(
                                queue_table        => 'APPS.XXATDMSA_KAFKA_OUT_T'
                               ,queue_payload_type => 'APPS.XXATDMSA_KAFKA_COLUMNS_T'
                               ,multiple_consumers => TRUE
                                );
 
  DBMS_AQADM.CREATE_QUEUE(
                          queue_name  => 'APPS.XXATDMSA_KAFKA_OUT_AQ'
                         ,queue_table => 'APPS.XXATDMSA_KAFKA_OUT_T'
                         );
 
 
  DBMS_AQADM.ADD_SUBSCRIBER(
      queue_name => 'APPS.XXATDMSA_KAFKA_OUT_AQ',
      subscriber => SYS.AQ$_AGENT('RECIPIENT', NULL, NULL )
      );
      
--    DBMS_AQ.REGISTER (
--       SYS.AQ$_REG_INFO_LIST(
--          SYS.AQ$_REG_INFO(
--             'XXATDAA.XXATDAA_COE_PUTAWAY_AQ:RECIPIENT',
--             DBMS_AQ.NAMESPACE_AQ,
--             'plsql://apps.xxatdaa_putaway_utils_pkg.DequeueAsnDatap?PR=0',
--             HEXTORAW('FF')
--             )
--          ),
--       1
--       );
             
DBMS_AQADM.START_QUEUE (queue_name => 'APPS.XXATDMSA_KAFKA_OUT_AQ');

end;

/*
BEGIN
   DBMS_AQADM.stop_QUEUE (queue_name => 'XXATDWMS.XXATDWMS_COE_PUTAWAY_AQ');
   DBMS_AQADM.drop_queue ('XXATDWMS.XXATDWMS_COE_PUTAWAY_AQ');
   DBMS_AQADM.drop_QUEUE_TABLE (queue_table => 'XXATDWMS.XXATDWMS_COE_PUTAWAY_T');
END;


BEGIN
   DBMS_AQADM.stop_QUEUE (queue_name => 'XXATDAA.XXATDAA_COE_PUTAWAY_AQ');
   DBMS_AQADM.drop_queue ('XXATDAA.XXATDAA_COE_PUTAWAY_AQ');
   DBMS_AQADM.drop_QUEUE_TABLE (queue_table => 'XXATDAA.XXATDAA_COE_PUTAWAY_T');
END;
*/
