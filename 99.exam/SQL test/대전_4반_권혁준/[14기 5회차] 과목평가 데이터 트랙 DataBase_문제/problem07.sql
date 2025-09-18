-- Employees에서 직원간 관계를 확인하고, 각 직원의 이름과 그 직원의 관리자(manager) 이름을 함께 조회하는 쿼리를 작성하시오.
-- CEO처럼 관리자가 없는 직원은 결과에 포함되지 않아도 된다. 
-- (결과 컬럼명: employee_name, manager_name)
SELECT E.name as employee_name, EM.name as manager_name
FROM `Employees` E
JOIN `Employees` EM
ON E.manager_id = EM.employee_id   