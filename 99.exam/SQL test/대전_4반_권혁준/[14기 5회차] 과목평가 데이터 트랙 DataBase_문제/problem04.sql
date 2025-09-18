-- Products 테이블에서 가격(price)이 가장 비싼 상품 3개의 이름과 가격을 조회하는 쿼리를 작성하시오.

SELECT name, price
FROM Products
ORDER BY 2 desc
LIMIT 3;

# 의류 가격이 5% 올라서 문제의 예시 테이블과 후드집업 가격이 다른데 이해해주실거라 생각합니다. 