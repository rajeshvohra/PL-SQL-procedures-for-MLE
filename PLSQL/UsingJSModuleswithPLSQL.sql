--Using JavaScript Modules with PL/SQL
--Use Case: Encapsulate reusable logic in a module and call it from PL/SQL.
-- What it does :
-- hello_module stores reusable JS code.
-- hello_proc exposes JS function to PL/SQL.
-- Output is printed via DBMS_OUTPUT.

--Step 1: Create a JavaScript Module
CREATE OR REPLACE MLE MODULE hello_module
LANGUAGE JAVASCRIPT AS
function sayHello(name) {
    console.log(`Hello, ${name} from JS module!`);
}
export { sayHello };
/

--Step 2: Create a PL/SQL Procedure Call Specification
CREATE OR REPLACE PROCEDURE hello_proc(p_name VARCHAR2)
AS MLE MODULE hello_module
SIGNATURE 'sayHello(text)';
/

--Step 3: Call the Procedure in PL/SQL
BEGIN
    hello_proc('Alice');
END;
/


