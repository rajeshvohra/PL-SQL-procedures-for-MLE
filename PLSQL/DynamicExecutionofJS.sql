-- Use Case: Print "Hello World" dynamically using JavaScript from PL/SQL.
-- What this script is doing: 
-- A new execution context is created.
-- JavaScript code is executed dynamically.
-- Output is printed via DBMS_OUTPUT.
-- Context is explicitly dropped.
SET SERVEROUTPUT ON;

DECLARE
    l_ctx     DBMS_MLE.context_handle_t;
    l_jscode  CLOB;
BEGIN
    -- Create a dynamic execution context
    l_ctx := DBMS_MLE.create_context;

    -- JavaScript code stored in a CLOB
    l_jscode := q'~
        console.log('Hello World, dynamically from JavaScript!');
    ~';

    -- Execute JavaScript dynamically
    DBMS_MLE.eval(
        context_handle => l_ctx,
        language_id    => 'JAVASCRIPT',
        source         => l_jscode,
        source_name    => 'DynamicHelloWorld'
    );

    -- Drop the context to free resources
    DBMS_MLE.drop_context(l_ctx);
END;
/

