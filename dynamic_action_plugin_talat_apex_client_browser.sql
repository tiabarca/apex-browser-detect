prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>3701492013876940
,p_default_application_id=>100
,p_default_id_offset=>104240214058820053
,p_default_owner=>'VALENTIN'
);
end;
/
 
prompt APPLICATION 100 - CLIENTE-TSH
--
-- Application Export:
--   Application:     100
--   Name:            CLIENTE-TSH
--   Date and Time:   10:40 Tuesday June 28, 2022
--   Exported By:     VALENTIN
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 103811897074455336
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     300126956845048
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/talat_apex_client_browser
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(103811897074455336)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'TALAT.APEX.CLIENT.BROWSER'
,p_display_name=>'Apex Browser Detector'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_RENDER (',
'    P_DYNAMIC_ACTION   IN   APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN   APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'',
'    L_RESULT        APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'    VR_CHROME       CONSTANT P_DYNAMIC_ACTION.ATTRIBUTE_01%TYPE := P_DYNAMIC_ACTION.ATTRIBUTE_01;',
'    VR_FIREFOX      CONSTANT P_DYNAMIC_ACTION.ATTRIBUTE_02%TYPE := P_DYNAMIC_ACTION.ATTRIBUTE_02;',
'    VR_IE           CONSTANT P_DYNAMIC_ACTION.ATTRIBUTE_03%TYPE := P_DYNAMIC_ACTION.ATTRIBUTE_03;',
' ',
'    ',
'    VR_OTHERS       CONSTANT P_DYNAMIC_ACTION.ATTRIBUTE_04%TYPE := P_DYNAMIC_ACTION.ATTRIBUTE_04;',
'    VR_TXT          CONSTANT P_DYNAMIC_ACTION.ATTRIBUTE_05%TYPE := P_DYNAMIC_ACTION.ATTRIBUTE_05;',
'    VR_URL          CONSTANT P_DYNAMIC_ACTION.ATTRIBUTE_06%TYPE := P_DYNAMIC_ACTION.ATTRIBUTE_06;',
'    ',
'',
'BEGIN',
'',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME                   => ''script'',',
'        P_CHECK_TO_ADD_MINIFIED   => FALSE,',
'        P_DIRECTORY              => P_PLUGIN.FILE_PREFIX,',
'        P_KEY                    => ''TLT''',
'    );',
'',
'        L_RESULT.JAVASCRIPT_FUNCTION := ''function () { raiseError(this,'' ||',
'        APEX_JAVASCRIPT.ADD_VALUE(VR_CHROME,TRUE) ||',
'        APEX_JAVASCRIPT.ADD_VALUE(VR_FIREFOX,TRUE) ||',
'       ',
'        APEX_JAVASCRIPT.ADD_VALUE(VR_IE,TRUE) ||',
'        APEX_JAVASCRIPT.ADD_VALUE(VR_OTHERS,TRUE) ||',
'        APEX_JAVASCRIPT.ADD_VALUE(VR_TXT,TRUE) ||',
'        APEX_JAVASCRIPT.ADD_VALUE(VR_URL,FALSE) ||',
'    ''); }'';',
'',
'    RETURN L_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/tiabarca/apex-browser-detect'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(103812099554491513)
,p_plugin_id=>wwv_flow_api.id(103811897074455336)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Chrome'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'65'
,p_is_translatable=>false
,p_help_text=>'Minimum version for Chrome.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(103812369509516142)
,p_plugin_id=>wwv_flow_api.id(103811897074455336)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Firefox'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'81'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(103812651313518289)
,p_plugin_id=>wwv_flow_api.id(103811897074455336)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'IE'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'11'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(103812928158535086)
,p_plugin_id=>wwv_flow_api.id(103811897074455336)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Fail other browsers'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(103813245752536520)
,p_plugin_id=>wwv_flow_api.id(103811897074455336)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Alert text'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'This browser is too old or unsupported, please access this webapp using another browser. Most modern browsers are supported.'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(103813579126539406)
,p_plugin_id=>wwv_flow_api.id(103811897074455336)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Redirect to'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_default_value=>'https://www.google.com/chrome'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E206765745F62726F777365722829207B0D0A202020207661722075613D6E6176696761746F722E757365724167656E742C74656D2C4D3D75612E6D61746368282F286F706572617C6368726F6D657C7361666172697C66697265666F';
wwv_flow_api.g_varchar2_table(2) := '787C6D7369657C74726964656E74283F3D5C2F29295C2F3F5C732A285C642B292F6929207C7C205B5D3B200D0A202020206966282F74726964656E742F692E74657374284D5B315D29297B0D0A202020202020202074656D3D2F5C6272765B203A5D2B28';
wwv_flow_api.g_varchar2_table(3) := '5C642B292F672E6578656328756129207C7C205B5D3B200D0A202020202020202072657475726E207B6E616D653A274945272C76657273696F6E3A2874656D5B315D7C7C2727297D3B0D0A20202020202020207D2020200D0A202020206966284D5B315D';
wwv_flow_api.g_varchar2_table(4) := '3D3D3D274368726F6D6527297B0D0A202020202020202074656D3D75612E6D61746368282F5C624F50527C456467655C2F285C642B292F290D0A202020202020202069662874656D213D6E756C6C292020207B72657475726E207B6E616D653A274F7065';
wwv_flow_api.g_varchar2_table(5) := '7261272C2076657273696F6E3A74656D5B315D7D3B7D0D0A20202020202020207D2020200D0A202020204D3D4D5B325D3F205B4D5B315D2C204D5B325D5D3A205B6E6176696761746F722E6170704E616D652C206E6176696761746F722E617070566572';
wwv_flow_api.g_varchar2_table(6) := '73696F6E2C20272D3F275D3B0D0A202020206966282874656D3D75612E6D61746368282F76657273696F6E5C2F285C642B292F692929213D6E756C6C29207B4D2E73706C69636528312C312C74656D5B315D293B7D0D0A2020202072657475726E207B0D';
wwv_flow_api.g_varchar2_table(7) := '0A2020202020206E616D653A204D5B305D2C0D0A20202020202076657273696F6E3A204D5B315D0D0A202020207D3B0D0A207D0D0A0D0A66756E6374696F6E2072616973654572726F7228636F6E746578742C6368726F6D652C66697265666F782C6965';
wwv_flow_api.g_varchar2_table(8) := '2C6F74686572732C7478742C75726C5F726564697265637429207B0D0A766172206572726F72203D2066616C73653B0D0A7661722062726F777365723D6765745F62726F7773657228293B202F2F2062726F777365722E6E616D65203D20274368726F6D';
wwv_flow_api.g_varchar2_table(9) := '65270D0A2020202020202020202020202020202020202020202020202020202F2F2062726F777365722E76657273696F6E203D20273430270D0A2020202020202020202020202020202020202020202020202020202F2F696620285B312C332C31325D2E';
wwv_flow_api.g_varchar2_table(10) := '696E6465784F6628666F6F29203E202D31290D0A6966202862726F777365722E6E616D65203D3D20274564676527297B0D0A202020206572726F72203D2066616C73653B0D0A7D0D0A6966202862726F777365722E6E616D65213D274368726F6D652720';
wwv_flow_api.g_varchar2_table(11) := '26262062726F777365722E6E616D6520213D2746697265666F78272026262062726F777365722E6E616D65213D274945272026262062726F777365722E6E616D65213D274564676527202626206F7468657273203D3D20275927297B0D0A202020206572';
wwv_flow_api.g_varchar2_table(12) := '726F72203D20747275653B0D0A7D0D0A6966202862726F777365722E6E616D65203D3D20274368726F6D6527202626207061727365496E742862726F777365722E76657273696F6E29203C206368726F6D6529207B0D0A0D0A202020206572726F72203D';
wwv_flow_api.g_varchar2_table(13) := '20747275653B0D0A7D0D0A6966202862726F777365722E6E616D65203D3D202746697265666F7827202626207061727365496E742862726F777365722E76657273696F6E29203C2066697265666F7829207B0D0A2020200D0A202020206572726F72203D';
wwv_flow_api.g_varchar2_table(14) := '20747275653B0D0A7D0D0A0D0A6966202862726F777365722E6E616D65203D3D2027494527202626207061727365496E742862726F777365722E76657273696F6E29203C20696529207B0D0A20200D0A202020206572726F72203D20747275653B0D0A7D';
wwv_flow_api.g_varchar2_table(15) := '0D0A0D0A6966202862726F777365722E6E616D65203D3D20274564676527297B0D0A202020206572726F72203D2066616C73653B0D0A7D0D0A696620286572726F72297B0D0A20202020616C65727428747874293B200D0A2020206966202875726C5F72';
wwv_flow_api.g_varchar2_table(16) := '6564697265637420213D202727290D0A2020207B200D0A2020202020202077696E646F772E6C6F636174696F6E2E68726566203D2075726C5F72656469726563743B0D0A2020207D0D0A0D0A7D0D0A0D0A636F6E736F6C652E6C6F672862726F77736572';
wwv_flow_api.g_varchar2_table(17) := '293B0D0A7D0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(103813919681543227)
,p_plugin_id=>wwv_flow_api.id(103811897074455336)
,p_file_name=>'script.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
