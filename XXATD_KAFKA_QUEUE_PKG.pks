CREATE PACKAGE xxatd_kafka_queue_pkg
AS
   PROCEDURE load_message (p_key VARCHAR2, p_json_msg CLOB);
END;
/
CREATE or replace PACKAGE body xxatd_kafka_queue_pkg
AS
   PROCEDURE load_message (p_key VARCHAR2, p_json_msg CLOB)
   is
      lc_enqueue_options      dbms_aq.enqueue_options_t;
      lc_message_properties   dbms_aq.message_properties_t;
      lc_message_handle       raw (16);
      lc_payload              apps.XXATDMSA_KAFKA_COLUMNS_T;
      l_err_num            number;      
      l_prg_id             number; 
      g_prg_name varchar2(240):='ATDI COE Putaway Suggestions';
   begin
   
   xxatd_fh_common_util_pkg.initialize (g_prg_name, l_prg_id, l_err_num);
   
      lc_payload := new apps.XXATDMSA_KAFKA_COLUMNS_T;
      lc_payload.column1 := p_key;
      lc_payload.column2 := p_json_msg;
      lc_message_properties.correlation := p_key;

      dbms_aq.enqueue (queue_name           => 'APPS.XXATDMSA_KAFKA_OUT_AQ',
                       enqueue_options      => lc_enqueue_options,
                       message_properties   => lc_message_properties,
                       payload              => lc_payload,
                       msgid                => lc_message_handle);
      commit;
   exception
      when others
      then
         xxatd_fh_common_util_pkg.write_db_exceptions (p_key,'EXCEPTION','Error Occured in enqueue_rcvtrx While Trying to process Shipment Line , Error Message is '||sqlerrm);
   end;
END;
/