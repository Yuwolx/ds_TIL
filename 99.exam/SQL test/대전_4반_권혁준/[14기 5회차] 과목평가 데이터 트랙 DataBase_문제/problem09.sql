-- 각 상품 카테고리(category)별로 총 매출액(total_revenue)을 계산하고,\
-- 총 매출액이 30만원을 초과하는 카테고리만 조회하는 쿼리를 작성하시오.
-- 결과는 총 매출액이 높은 순으로 정렬해야 한다.
-- 총 매출 연산: total_revenue(가격 * 판매 수량)
-- problem01에 의해 결과 값이 달라질 수 있음에 유의한다.

SELECT category, SUM(price * quantitys) as total_revenue
FROM `Products` P
JOIN 
  (SELECT product_id, SUM(quantity) as quantitys
  FROM `Sales`
  GROUP BY 1) S

ON P.product_id = S.product_id
GROUP BY category
HAVING  SUM(price * quantitys) > 300000
ORDER BY total_revenue desc
;

