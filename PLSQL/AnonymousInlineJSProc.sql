-- Use Case: Quickly test JavaScript logic without creating a module.
-- What it does:
-- Quick execution of JS logic.
-- No module creation needed.
-- Useful for small computations or testing.

CREATE OR REPLACE PROCEDURE inline_js_demo
AS MLE LANGUAGE JAVASCRIPT PURE
{{
    let msg = 'Hello from inline JavaScript!';
    console.log(msg);
}};
/

BEGIN
    inline_js_demo;
END;
/


