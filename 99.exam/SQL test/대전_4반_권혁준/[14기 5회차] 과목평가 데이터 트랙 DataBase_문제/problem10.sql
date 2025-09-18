--  '생활용품' 카테고리의 상품 중, 가장 비싼 상품보다 더 비싼 다른 카테고리의 모든 상품 정보를 조회하는 쿼리를 작성하시오.
SELECT *
FROM `Products`
WHERE price > (SELECT price FROM `Products`
              WHERE category = '생활용품' ORDER BY 1 desc limit 1)
AND category <> '생활용품'