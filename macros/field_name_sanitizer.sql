{% macro field_name_sanitizer(field_name) %}
    {% set reservedlist = ["AES128","AES256","ALL","ALLOWOVERWRITE","ANALYSE","ANALYZE","AND","ANY",
    "ARRAY","AS","ASC","AUTHORIZATION","AZ64","BACKUP","BETWEEN","BINARY","BLANKSASNULL","BOTH",
    "BYTEDICT","BZIP2","CASE","CAST","CHECK","COLLATE","COLUMN","CONSTRAINT","CREATE","CREDENTIALS",
    "CROSS","CURRENT_DATE","CURRENT_TIME","CURRENT_TIMESTAMP","CURRENT_USER","CURRENT_USER_ID",
    "DEFAULT","DEFERRABLE","DEFLATE","DEFRAG","DELTA","DELTA32K","DESC","DISABLE","DISTINCT","DO",
    "ELSE","EMPTYASNULL","ENABLE","ENCODE","ENCRYPT","ENCRYPTION","END","EXCEPT","EXPLICIT","FALSE",
    "FOR","FOREIGN","FREEZE","FROM","FULL","GLOBALDICT256","GLOBALDICT64K","GRANT","GROUP","GZIP",
    "HAVING","IDENTITY","IGNORE","ILIKE","IN","INITIALLY","INNER","INTERSECT","INTERVAL","INTO","IS",
    "ISNULL","JOIN","LANGUAGE","LEADING","LEFT","LIKE","LIMIT","LOCALTIME","LOCALTIMESTAMP","LUN",
    "LUNS","LZO","LZOP","MINUS","MOSTLY16","MOSTLY32","MOSTLY8","NATURAL","NEW","NOT","NOTNULL","NULL",
    "NULLS","OFF","OFFLINE","OFFSET","OID","OLD","ON","ONLY","OPEN","OR","ORDER","OUTER","OVERLAPS",
    "PARALLEL","PARTITION","PERCENT","PERMISSIONS","PIVOT","PLACING","PRIMARY","RAW","READRATIO",
    "RECOVER","REFERENCES","REJECTLOG","RESORT","RESPECT","RESTORE","RIGHT","SELECT","SESSION_USER",
    "SIMILAR","SNAPSHOT","SOME","SYSDATE","SYSTEM","TABLE","TAG","TDES","TEXT255","TEXT32K","THEN",
    "TIMESTAMP","TO","TOP","TRAILING","TRUE","TRUNCATECOLUMNS","UNION","UNIQUE","UNNEST","UNPIVOT",
    "USER","USING","VERBOSE","WALLET","WHEN","WHERE","WITH","WITHOUT"] %}

    {% set new_field_name = field_name %}
    {#- Only take letters, numbers, and underscores -#}
    {% set new_field_name = modules.re.sub('[^A-Za-z0-9_]+', '_', new_field_name) %} 
    {#- If a number is the first character, wrap in "" -#}
    {# this isn't the correct thing, I need a full replace, not  apositional replace #}
    {% set new_field_name = modules.re.sub('^[0-9]', '"' + new_field_name + '"', new_field_name) %}
    {# check for reserved words #}
    {%- for rword in reservedlist -%}
    {% if rword == new_field_name %}
    {% set new_field_name = '"' + new_field_name + '"' %}
    {% endif %}

    {%- endfor %}  
    {#- Lower case the string -#}
    {% set new_field_name = new_field_name | lower %}
    

    {{ return(new_field_name)}}
{#
lower(regexp_replace({{field_name}}, '[[:punct:]]|[ ]', '_'))
#}
{% endmacro %}