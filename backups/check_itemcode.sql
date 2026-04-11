SELECT "itemCode", "itemName" FROM tbl_items WHERE "itemCode" !~ '^[0-9]+$' AND "itemCode" IS NOT NULL LIMIT 20;
